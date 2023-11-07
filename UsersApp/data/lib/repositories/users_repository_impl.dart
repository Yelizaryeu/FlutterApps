import 'package:core/core.dart';
import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:data/errors/error_handler.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/users_repository.dart';

import '../mappers/mappers.dart';

class UsersRepositoryImpl implements UsersRepository {
  final RemoteUsersProvider remoteProvider;
  final LocalProvider localProvider;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl({
    required this.remoteProvider,
    required this.localProvider,
    required this.networkInfo,
  });

  @override
  Future<List<UserModel>?> getAllUsers() async {
    if (await networkInfo.isConnected) {
      final remoteUsers = await ErrorHandler().safeDioRequest(remoteProvider.getUsers());
      localProvider.usersToCache(remoteUsers.map((user) => UserMapper.toModel(user)).toList());
      return remoteUsers.map((user) => UserMapper.toModel(user)).toList();
    } else {
      return localProvider.getUsersFromCache();
    }
  }

  @override
  Future<List<UserModel>?> searchUser(String query) async {
    if (await networkInfo.isConnected) {
      List<UserEntity> matchedUsers = await ErrorHandler().safeDioRequest(remoteProvider.getUserByName(query));
      matchedUsers.addAll(await ErrorHandler().safeDioRequest(remoteProvider.getUserByEmail(query)));
      localProvider.usersToCache(matchedUsers.map((user) => UserMapper.toModel(user)).toList());
      return matchedUsers.map((user) => UserMapper.toModel(user)).toList();
    } else {
      return localProvider.getUsersFromCache();
    }
  }
}
