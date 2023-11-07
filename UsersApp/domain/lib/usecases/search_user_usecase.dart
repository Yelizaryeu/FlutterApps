import 'package:domain/usecases/usecase.dart';

import '../models/user/user_model.dart';
import '../repositories/users_repository.dart';

class SearchUserUseCase extends FutureUseCase<String, List<UserModel>?> {
  final UsersRepository _usersRepository;

  SearchUserUseCase({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  @override
  Future<List<UserModel>?> execute(input) {
    return _usersRepository.searchUser(input);
  }
}
