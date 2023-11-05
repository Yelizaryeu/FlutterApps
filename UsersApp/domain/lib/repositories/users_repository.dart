import 'package:domain/domain.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:domain/models/user/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getAllUsers();
  Future<List<UserModel>> searchUser(String query);
  Future<List<PostModel>> getPosts(int id);
}
