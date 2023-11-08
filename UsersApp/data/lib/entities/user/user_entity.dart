import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity extends HiveObject with _$UserEntity {
  UserEntity._();

  @HiveType(typeId: 5)
  factory UserEntity({
    @HiveField(1) @Default(-1) int id,
    @HiveField(2) @Default('') String name,
    @HiveField(3) @Default('') String? avatar,
    @HiveField(4) @Default('') String email,
    @HiveField(5) @Default('') String phone,
    @HiveField(6) @Default({}) Map<String, dynamic> address,
    @HiveField(7) @Default({}) Map<String, dynamic> company,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
