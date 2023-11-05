import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String name,
    required String? avatar,
    required String email,
    required String phone,
    required Map<String, dynamic> address,
    required Map<String, dynamic> company,
  }) = _UserModel;
}
