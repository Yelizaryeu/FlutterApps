import 'package:data/providers/remote_users_provider.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/posts_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    UsersRepository,
    PostsRepository,
    RemoteUsersProvider,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
