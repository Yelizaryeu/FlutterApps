import 'package:core/constants/api_constants.dart';
import 'package:data/entities/post/post_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_provider.g.dart';

@RestApi(baseUrl: ApiConstants.kBaseUrl)
abstract class RemoteProvider {
  factory RemoteProvider(Dio dio) = _RemoteProvider;

  @GET(ApiConstants.kUsersPath)
  Future<List<UserEntity>> getUsers();

  @GET('${ApiConstants.kUsersPath}/?name={name}')
  Future<List<UserEntity>> getUserByName(@Path('name') String query);

  @GET('${ApiConstants.kUsersPath}/{id}/posts')
  Future<List<PostEntity>> getPosts(@Path('id') int id);

  @GET('${ApiConstants.kUsersPath}/?email={email}')
  Future<List<UserEntity>> getUserByEmail(@Path('email') String query);
}
