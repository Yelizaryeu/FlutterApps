import 'package:core/error/exception.dart';
import 'package:data/data.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:hive/hive.dart';

class LocalProvider {
  final Box<List<UserEntity>> usersBox;
  //final Box<List<PostEntity>> postsBox;

  LocalProvider({required this.usersBox});

  Future<List<UserModel>> getUsersFromCache() {
    print('trying to get users from cache');
    final jsonUsersList = usersBox.get('users');
    print('got this list $jsonUsersList');
    if (jsonUsersList!.isNotEmpty) {
      return Future.value(jsonUsersList.map((user) => UserMapper.toModel(user)).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> usersToCache(List<UserModel> users) {
    final List<UserEntity> jsonUsersList = users.map((user) => UserMapper.toEntity(user)).toList();

    final cachedUsers = usersBox.get('users');
    if (cachedUsers != null) {
      usersBox.put('users', cachedUsers + jsonUsersList);
    } else {
      usersBox.put('users', jsonUsersList);
    }

    return Future.value(jsonUsersList);
  }
}
