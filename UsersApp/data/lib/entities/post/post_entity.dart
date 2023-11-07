import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
class PostEntity extends HiveObject with _$PostEntity {
  PostEntity._();

  @HiveType(typeId: 4)
  factory PostEntity({
    @HiveField(1) required int userId,
    @HiveField(2) required int id,
    @HiveField(3) required String title,
    @HiveField(4) required String body,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) => _$PostEntityFromJson(json);
}
