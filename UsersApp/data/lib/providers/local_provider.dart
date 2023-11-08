import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/errors/error_handler.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:hive/hive.dart';

class LocalProvider {
  final Box<List> _usersBox = Hive.box('users');
  final Box<List> _postsBox = Hive.box('posts');

  List<UserModel>? getUsersFromCache() {
    final cachedUsersList =
        ErrorHandler().safeCacheRequest(_usersBox.get(HiveConstants.usersBoxKey, defaultValue: [])?.cast<UserEntity>());
    return cachedUsersList?.map((user) => UserMapper.toModel(user)).toList();
  }

  void usersToCache(List<UserModel> users) {
    final List<UserEntity> jsonUsersList = users.map((user) => UserMapper.toEntity(user)).toList();

    final cachedUsers = _usersBox.get(HiveConstants.usersBoxKey);
    if (cachedUsers != null) {
      _usersBox.clear();
      _usersBox.put(HiveConstants.usersBoxKey, jsonUsersList);
    } else {
      _usersBox.put(HiveConstants.usersBoxKey, jsonUsersList);
    }
  }

  List<PostModel> getPostsFromCache(int id) {
    final cachedPostsList =
        ErrorHandler().safeCacheRequest(_postsBox.get(HiveConstants.postsBoxKey, defaultValue: [])?.cast<PostEntity>());
    final List<PostEntity> postsList = [];
    cachedPostsList?.forEach((element) {
      if (element.userId == id) {
        postsList.add(element);
      }
    });
    print(postsList.length);
    return postsList?.map((post) => PostMapper.toModel(post)).toList() ?? [];
  }

  void postsToCache(List<PostModel> posts) {
    final List<PostEntity> postsList = posts.map((post) => PostMapper.toEntity(post)).toList();

    final cachedPosts = _postsBox.get(HiveConstants.postsBoxKey);
    if (cachedPosts != null) {
      _postsBox.clear();
      _postsBox.put(HiveConstants.postsBoxKey, cachedPosts + postsList);
    } else {
      _postsBox.put(HiveConstants.postsBoxKey, postsList);
    }
  }
}
