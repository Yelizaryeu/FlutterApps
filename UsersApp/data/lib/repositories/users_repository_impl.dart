import 'package:core/error/exception.dart';
import 'package:core/error/failure.dart';
import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:data/providers/local_provider.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/users_repository.dart';

import '../entities/post/post_entity.dart';
import '../mappers/mappers.dart';

class UsersRepositoryImpl implements UsersRepository {
  final RemoteProvider remoteProvider;
  final LocalProvider localProvider;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl({
    required this.remoteProvider,
    required this.localProvider,
    required this.networkInfo,
  });

  @override
  Future<List<UserModel>> getAllUsers() async {
    return await _getUsers(remoteProvider.getUsers);
  }

  @override
  Future<List<UserModel>> searchUser(String query) async {
    return await _getUsers(() {
      return remoteProvider.searchUser(query);
    });
  }

  Future<List<UserModel>> _getUsers(Future<List<UserEntity>> Function() getUsers) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await getUsers();
        final List<UserModel> userModelList = [];
        for (UserEntity userEntity in remoteUsers) {
          userModelList.add(UserMapper.toModel(userEntity));
        }
        //localProvider.usersToCache(userModelList);
        return userModelList;
      } on ServerException {
        throw ServerFailure();
      }
    } else {
      try {
        final hiveLocalUsers = await localProvider.getUsersFromCache();
        return hiveLocalUsers;
      } on ServerException {
        throw CacheFailure();
      }
    }
  }

  @override
  Future<List<PostModel>> getPosts(int id) async {
    return await _getPosts(await remoteProvider.getPosts(id));
  }

  Future<List<PostModel>> _getPosts(List<PostEntity> posts) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = posts;
        final List<PostModel> postModelList = [];
        for (PostEntity postEntity in remotePosts) {
          postModelList.add(PostMapper.toModel(postEntity));
        }
        //localProvider.usersToCache(userModelList);
        return postModelList;
      } on ServerException {
        throw ServerFailure();
      }
    } else {
      return [];
    }
  }
}
