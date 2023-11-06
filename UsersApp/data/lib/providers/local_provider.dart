import 'package:core/constants/api_constants.dart';
import 'package:core/error/exception.dart';
import 'package:data/data.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:hive/hive.dart';

class LocalProvider {
  final Box<List> usersBox;

  LocalProvider({required this.usersBox});

  Future<List<UserModel>> getUsersFromCache() {
    final jsonUsersList = usersBox.get(ApiConstants.hiveUsersBoxKey, defaultValue: [])?.cast<UserEntity>();
    if (jsonUsersList!.isNotEmpty) {
      return Future.value(jsonUsersList.map((user) => UserMapper.toModel(user)).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> usersToCache(List<UserModel> users) {
    final List<UserEntity> jsonUsersList = users.map((user) => UserMapper.toEntity(user)).toList();

    final cachedUsers = usersBox.get(ApiConstants.hiveUsersBoxKey);
    if (cachedUsers != null) {
      usersBox.put(ApiConstants.hiveUsersBoxKey, cachedUsers + jsonUsersList);
    } else {
      usersBox.put(ApiConstants.hiveUsersBoxKey, jsonUsersList);
    }

    return Future.value(jsonUsersList);
  }
}
