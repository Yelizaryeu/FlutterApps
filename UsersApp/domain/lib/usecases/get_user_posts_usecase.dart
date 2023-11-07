import 'package:domain/models/post/post_model.dart';
import 'package:domain/repositories/posts_repository.dart';
import 'package:domain/usecases/usecase.dart';

class GetUserPostsUseCase extends FutureUseCase<int, List<PostModel>?> {
  final PostsRepository _postsRepository;

  GetUserPostsUseCase({
    required PostsRepository postsRepository,
  }) : _postsRepository = postsRepository;

  @override
  Future<List<PostModel>?> execute(input) {
    return _postsRepository.getPosts(input);
  }
}
