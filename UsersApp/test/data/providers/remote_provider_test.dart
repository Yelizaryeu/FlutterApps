import 'package:data/data.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getUsers should return list of users where first user have name Leanne Graham', () async {
    // ARRANGE
    final RemoteProvider remoteProvider = RemoteProvider(Dio());
    const leanneGraham = 'Leanne Graham';
    // ACT
    final List<UserEntity> users = await remoteProvider.getUsers();
    // ASSERT
    expect(users[0].name, leanneGraham);
  });

  test('getPosts(1) should return list of posts for user with id 1', () async {
    // ARRANGE
    final RemoteProvider remoteProvider = RemoteProvider(Dio());
    // ACT
    final List<PostEntity> posts = await remoteProvider.getPosts(1);
    // ASSERT
    expect(posts[0].userId, 1);
  });

  test('getUserByName("Leanne Graham") should return UserEntity for Leanne Graham', () async {
    // ARRANGE
    final RemoteProvider remoteProvider = RemoteProvider(Dio());
    const leanneGraham = 'Leanne Graham';
    // ACT
    final List<UserEntity> searchResult = await remoteProvider.getUserByName(leanneGraham);
    // ASSERT
    expect(searchResult[0].name, leanneGraham);
  });

  test('getUserByEmail("Sincere@april.biz") should return UserEntity for Leanne Graham', () async {
    // ARRANGE
    final RemoteProvider remoteProvider = RemoteProvider(Dio());
    const leanneGraham = 'Leanne Graham';
    const email = 'Sincere@april.biz';
    // ACT
    final List<UserEntity> searchResult = await remoteProvider.getUserByEmail(email);
    // ASSERT
    expect(searchResult[0].name, leanneGraham);
  });
}
