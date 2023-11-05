import 'package:domain/models/post/post_model.dart';

import '../entities/post/post_entity.dart';

abstract class PostMapper {
  static PostEntity toEntity(PostModel model) {
    return PostEntity(
      userId: model.userId,
      id: model.id,
      title: model.title,
      body: model.body,
    );
  }

  static PostModel toModel(PostEntity entity) {
    return PostModel(
      userId: entity.userId,
      id: entity.id,
      title: entity.title,
      body: entity.body,
    );
  }
}
