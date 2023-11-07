import 'package:data/data.dart';
import 'package:domain/repositories/posts_repository.dart';
import 'package:domain/repositories/users_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    UsersRepository,
    PostsRepository,
    RemoteUsersProvider,
    RemotePostsProvider,
    LocalProvider,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
