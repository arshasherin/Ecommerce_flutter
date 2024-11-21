import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/user_model.freezed.dart';
part '../gen/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'type') String? type,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
