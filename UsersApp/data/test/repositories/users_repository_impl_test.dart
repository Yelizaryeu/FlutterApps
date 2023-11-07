import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteUsersProvider mockRemoteProvider;
  late MockLocalProvider mockLocalProvider;
  late UsersRepositoryImpl repository;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteProvider = MockRemoteUsersProvider();
    mockLocalProvider = MockLocalProvider();
    mockNetworkInfo = NetworkInfoImp(InternetConnectionChecker());
    repository = UsersRepositoryImpl(
      remoteProvider: mockRemoteProvider,
      localProvider: mockLocalProvider,
      networkInfo: mockNetworkInfo,
    );
  });

  UserEntity testUserEntity = UserEntity(
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
  List<UserEntity> testUserList = [testUserEntity];

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

  group('get users', () {
    test(
      'should return List<UserModel> when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteProvider.getUsers()).thenAnswer((_) async => testUserList);

        // act
        final result = await repository.getAllUsers();

        // assert
        verify(mockRemoteProvider.getUsers());
        expect(result!.first, equals(testUserModel));
      },
    );

    const emailQuery = "Sincere@april.biz";

    test(
      'should return List<UserModel> when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteProvider.getUserByEmail(emailQuery)).thenAnswer((_) async => testUserList);
        when(mockRemoteProvider.getUserByName(emailQuery)).thenAnswer((_) async => []);

        // act
        final result = await repository.searchUser(emailQuery);

        // assert
        verify(mockRemoteProvider.getUserByEmail(emailQuery));
        expect(result!.first, equals(testUserModel));
      },
    );

    const nameQuery = "Leanne Graham";

    test(
      'should return List<UserModel> when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteProvider.getUserByName(nameQuery)).thenAnswer((_) async => testUserList);
        when(mockRemoteProvider.getUserByEmail(nameQuery)).thenAnswer((_) async => []);

        // act
        final result = await repository.searchUser(nameQuery);

        // assert
        verify(mockRemoteProvider.getUserByName(nameQuery));
        expect(result!.first, equals(testUserModel));
      },
    );
  });
}
