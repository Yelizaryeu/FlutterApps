import 'package:domain/models/post/post_model.dart';
import 'package:domain/usecases/usecase.dart';

import '../repositories/users_repository.dart';

class GetUserPostsUseCase extends FutureUseCase<int, List<PostModel>> {
  final UsersRepository _usersRepository;

  GetUserPostsUseCase({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  @override
  Future<List<PostModel>> execute(input) {
    return _usersRepository.getPosts(input);
  }
}
