import 'package:data/entities/post/post_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_provider.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RemoteProvider {
  factory RemoteProvider(Dio dio) = _RemoteProvider;

  @GET('users')
  Future<List<UserEntity>> getUsers();

  // Future<List<UserEntity>> searchUser(String query) {
  //   return getUserByName(query);
  // }

  @GET('/users/?name={name}')
  Future<List<UserEntity>> searchUser(@Path('name') String query);

  @GET('users/{id}/posts')
  Future<List<PostEntity>> getPosts(@Path('id') int id);

  // @GET('/users/?email={name}')
  // Future<List<UserEntity>> getUserByEmail(@Path('email') String query);
}
