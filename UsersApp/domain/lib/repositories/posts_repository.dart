import 'package:domain/models/post/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts(int id);
}
