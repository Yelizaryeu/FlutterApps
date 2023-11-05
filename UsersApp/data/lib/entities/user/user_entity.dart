import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity extends HiveObject with _$UserEntity {
  UserEntity._();

  @HiveType(typeId: 5, adapterName: 'UserEntityAdapter')
  factory UserEntity({
    @HiveField(1) required int id,
    @HiveField(2) required String name,
    @HiveField(3) required String? avatar,
    @HiveField(4) required String email,
    @HiveField(5) required String phone,
    @HiveField(6) required Map<String, dynamic> address,
    @HiveField(7) required Map<String, dynamic> company,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
