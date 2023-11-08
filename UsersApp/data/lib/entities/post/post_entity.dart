import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
class PostEntity extends HiveObject with _$PostEntity {
  PostEntity._();

  @HiveType(typeId: 4)
  factory PostEntity({
    @HiveField(1) @Default(-1) int userId,
    @HiveField(2) @Default(-1) int id,
    @HiveField(3) @Default('') String title,
    @HiveField(4) @Default('') String body,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) => _$PostEntityFromJson(json);
}
