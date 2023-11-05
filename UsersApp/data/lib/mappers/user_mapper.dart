import 'package:domain/models/user/user_model.dart';

import '../entities/user/user_entity.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      avatar: model.avatar,
      email: model.email,
      phone: model.phone,
      address: model.address,
      company: model.company,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      avatar: entity.avatar,
      email: entity.email,
      phone: entity.phone,
      address: entity.address,
      company: entity.company,
    );
  }
}
