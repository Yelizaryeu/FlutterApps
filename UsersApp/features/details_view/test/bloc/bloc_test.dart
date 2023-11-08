import 'package:bloc_test/bloc_test.dart';
import 'package:details_view/bloc/details_view/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([GetUserPostsUseCase])
void main() {
  late MockGetUserPostsUseCase mockGetUserPostsUseCase;
  late UserModel user;
  late DetailsBloc postsListBloc;

  UserModel testUserModel = UserModel(
      id: 1,
      name: "Leanne Graham",
      avatar: '',
      email: "Sincere@april.biz",
      address: {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
      },
      phone: "1-770-736-8031 x56442",
      company: {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      });

  PostModel testPostModel = PostModel(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  );
  final testPostList = [testPostModel];
  const userId = 1;

  setUp(() {
    mockGetUserPostsUseCase = MockGetUserPostsUseCase();
    postsListBloc = DetailsBloc(getUserPostsUseCase: mockGetUserPostsUseCase, user: testUserModel);
  });

  test(
    'initial state should be empty',
    () {
      const result = DetailsState();
      expect(result.posts, postsListBloc.state.posts);
    },
  );

  blocTest<DetailsBloc, DetailsState>(
    'should emit {posts: testPostList} when data is gotten successfully',
    build: () {
      when(mockGetUserPostsUseCase.execute(userId)).thenAnswer((_) async => testPostList);
      return postsListBloc;
    },
    act: (bloc) => bloc.add((LoadDetailsEvent())),
    wait: const Duration(milliseconds: 100),
    expect: () => [postsListBloc.state.copyWith(posts: testPostList)],
    // verify: (bloc) {
    //   verify(mockGetUserPostsUseCase.execute(userId));
    // },
  );
}
