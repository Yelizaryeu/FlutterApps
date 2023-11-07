// import 'package:data/entities/entities.dart';
// import 'package:data/mappers/mappers.dart';
// import 'package:domain/domain.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   UserModel testUserModel = UserModel(
//       id: 1,
//       name: "Leanne Graham",
//       avatar: '',
//       email: "Sincere@april.biz",
//       address: {
//         "street": "Kulas Light",
//         "suite": "Apt. 556",
//         "city": "Gwenborough",
//         "zipcode": "92998-3874",
//       },
//       phone: "1-770-736-8031 x56442",
//       company: {
//         "name": "Romaguera-Crona",
//         "catchPhrase": "Multi-layered client-server neural-net",
//         "bs": "harness real-time e-markets"
//       });
//
//   group('to model', () {
//     test(
//       'should be a subclass of weather entity',
//           () async {
//         // assert
//             final user1 =
//         final result = UserMapper.toModel(testUserEntity);
//         expect(result, equals(testUserModel));
//       },
//     );
//   });
//
//   group('from json', () {
//     test(
//       'should return a valid entity from json',
//           () async {
//         // arrange
//         final Map<String, dynamic> jsonMap = {
//           "id": 1,
//           "name": "Leanne Graham",
//           "avatar": "",
//           "email": "Sincere@april.biz",
//           "address": {
//             "street": "Kulas Light",
//             "suite": "Apt. 556",
//             "city": "Gwenborough",
//             "zipcode": "92998-3874",
//           },
//           "phone": "1-770-736-8031 x56442",
//           "company": {
//             "name": "Romaguera-Crona",
//             "catchPhrase": "Multi-layered client-server neural-net",
//             "bs": "harness real-time e-markets"
//           }
//         };
//
//         // act
//         final result = UserEntity.fromJson(jsonMap);
//
//         // assert
//         expect(result, equals(testUserEntity));
//       },
//     );
//   });
//
//   group('to json', () {
//     test(
//       'should return a json map containing proper data',
//           () async {
//         // act
//         final result = testUserEntity.toJson();
//
//         // assert
//         final expectedJsonMap = {
//           "id": 1,
//           "name": "Leanne Graham",
//           "avatar": "",
//           "email": "Sincere@april.biz",
//           "address": {
//             "street": "Kulas Light",
//             "suite": "Apt. 556",
//             "city": "Gwenborough",
//             "zipcode": "92998-3874",
//           },
//           "phone": "1-770-736-8031 x56442",
//           "company": {
//             "name": "Romaguera-Crona",
//             "catchPhrase": "Multi-layered client-server neural-net",
//             "bs": "harness real-time e-markets"
//           }
//         };
//         expect(result, equals(expectedJsonMap));
//       },
//     );
//   });
// }
