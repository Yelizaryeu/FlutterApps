import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockUsersRepository repo;
  late GetUsersUseCase usecase;

  setUp(() async {
    repo = MockUsersRepository();
    usecase = GetUsersUseCase(usersRepository: repo);
  });

  UserModel testUserDetail = UserModel(
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
  List<UserModel> testUserList = [testUserDetail];

  test(
    'should get ... from the repository',
    () async {
      // arrange
      when(repo.getAllUsers()).thenAnswer((_) async => testUserList);

      // act
      final result = await usecase.execute(const NoParams());

      // assert
      expect(result, equals(testUserList));
    },
  );
}
