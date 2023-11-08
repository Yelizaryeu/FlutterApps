import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockPostsRepository repo;
  late GetUserPostsUseCase useCase;

  setUp(() async {
    repo = MockPostsRepository();
    useCase = GetUserPostsUseCase(postsRepository: repo);
  });

  PostModel testPostDetail = PostModel(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  );
  List<PostModel> testPostList = [testPostDetail];

  test(
    'should get ... from the repository',
    () async {
      // arrange
      when(repo.getPosts(1)).thenAnswer((_) async => testPostList);

      // act
      final result = await useCase.execute(1);

      // assert
      expect(result, equals(testPostList));
    },
  );
}
