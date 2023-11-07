import 'package:domain/domain.dart';
import 'package:domain/models/user/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>?> getAllUsers();
  Future<List<UserModel>?> searchUser(String query);
}
