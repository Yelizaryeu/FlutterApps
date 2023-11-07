import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:data/errors/error_handler.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:domain/repositories/posts_repository.dart';

import '../mappers/mappers.dart';

class PostsRepositoryImpl implements PostsRepository {
  final RemotePostsProvider remoteProvider;
  final LocalProvider localProvider;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.remoteProvider,
    required this.localProvider,
    required this.networkInfo,
  });

  @override
  Future<List<PostModel>> getPosts(int id) async {
    if (await networkInfo.isConnected) {
      final remotePosts = await ErrorHandler().safeDioRequest(remoteProvider.getPosts(id));
      localProvider.postsToCache(remotePosts.map((post) => PostMapper.toModel(post)).toList());
      return remotePosts.map((post) => PostMapper.toModel(post)).toList();
    } else {
      return localProvider.getPostsFromCache(id);
    }
  }
}
