import 'package:domain/usecases/usecase.dart';

import '../models/user/user_model.dart';
import '../repositories/users_repository.dart';

class GetUsersUseCase extends FutureUseCase<void, List<UserModel>> {
  final UsersRepository _usersRepository;

  GetUsersUseCase({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  @override
  Future<List<UserModel>> execute(input) {
    return _usersRepository.getAllUsers();
  }
}
