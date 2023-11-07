import 'package:core/constants/api_constants.dart';
import 'package:data/entities/post/post_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_posts_provider.g.dart';

@RestApi(baseUrl: ApiConstants.kBaseUrl)
abstract class RemotePostsProvider {
  factory RemotePostsProvider(Dio dio) = _RemotePostsProvider;

  @GET('${ApiConstants.kUsersPath}/{id}/posts')
  Future<List<PostEntity>> getPosts(@Path('id') int id);
}
