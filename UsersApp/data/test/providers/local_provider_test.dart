// import 'package:data/entities/user/user_entity.dart';
// import 'package:data/providers/remote_users_provider.dart';
// import 'package:data/providers/local_provider.dart';
// import 'package:dio/src/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// void main() async {
//   await Hive.initFlutter();
//   await Hive.openBox<List>('users');
//   await Hive.openBox<List>('posts');
//
//   test('getUsers should return list of users where first user have name Leanne Graham', () async {
//     // ARRANGE
//
//     final LocalProvider localProvider = LocalProvider(usersBox: );
//     const leanneGraham = 'Leanne Graham';
//     // ACT
//     final List<UserEntity> users = await remoteProvider.getUsers();
//     // ASSERT
//     expect(users[0].name, leanneGraham);
//   });
// }
