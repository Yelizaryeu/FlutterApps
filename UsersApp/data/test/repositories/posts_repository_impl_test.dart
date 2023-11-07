import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockRemotePostsProvider mockRemoteProvider;
  late MockLocalProvider mockLocalProvider;
  late PostsRepositoryImpl repository;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteProvider = MockRemotePostsProvider();
    mockLocalProvider = MockLocalProvider();
    mockNetworkInfo = NetworkInfoImp(InternetConnectionChecker());
    repository = PostsRepositoryImpl(
      remoteProvider: mockRemoteProvider,
      localProvider: mockLocalProvider,
      networkInfo: mockNetworkInfo,
    );
  });

  PostEntity testPostEntity = PostEntity(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  );
  final List<PostEntity> testPostList = [testPostEntity];

  PostModel testPostModel = PostModel(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  );

  group('get posts', () {
    const int userId = 1;
    test(
      'should return List<PostModel> when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteProvider.getPosts(userId)).thenAnswer((_) async => testPostList);

        // act
        final result = await repository.getPosts(userId);

        // assert
        verify(mockRemoteProvider.getPosts(userId));
        expect(result.first, equals(testPostModel));
      },
    );
  });
}
