import 'package:data/entities/entities.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PostEntity testPostEntity = PostEntity(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  );

  PostModel testPostModel = PostModel(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  );

  group('to model', () {
    test(
      'should be a subclass of weather model',
      () async {
        // assert
        final result = PostMapper.toModel(testPostEntity);
        expect(result, equals(testPostModel));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = {
          "userId": 1,
          "id": 1,
          "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          "body":
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        };

        // act
        final result = PostEntity.fromJson(jsonMap);

        // assert
        expect(result, equals(testPostEntity));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = testPostEntity.toJson();

        // assert
        final expectedJsonMap = {
          "userId": 1,
          "id": 1,
          "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          "body":
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
