import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:users_view/src/bloc/bloc.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([GetUsersUseCase, SearchUserUseCase])
void main() {
  late MockGetUsersUseCase mockGetUsersUseCase;
  late MockSearchUserUseCase mockSearchUserUseCase;
  late UsersListBloc usersListBloc;

  setUp(() {
    mockGetUsersUseCase = MockGetUsersUseCase();
    mockSearchUserUseCase = MockSearchUserUseCase();
    usersListBloc = UsersListBloc(getUsersUseCase: mockGetUsersUseCase, searchUserUseCase: mockSearchUserUseCase);
  });

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
  final testUserList = [testUserModel];
  const noParams = NoParams();

  test(
    'initial state should be empty',
    () {
      const result = UsersListState();
      expect(result, usersListBloc.state.copyWith(isLoading: true, users: null));
    },
  );

  blocTest<UsersListBloc, UsersListState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetUsersUseCase.execute(noParams)).thenAnswer((_) async => testUserList);
      return usersListBloc;
    },
    seed: () => const UsersListState().copyWith(isLoading: true, users: []),
    act: (bloc) => bloc.add((LoadUsersEvent())),
    wait: const Duration(milliseconds: 100),
    expect: () => [usersListBloc.state.copyWith(users: testUserList, isLoading: false)],
    verify: (bloc) {
      verify(mockGetUsersUseCase.execute(noParams));
    },
  );
}
