import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/authentication_model.freezed.dart';
part '../gen/authentication_model.g.dart';

@freezed
class AuthenticationModel with _$AuthenticationModel {
  const factory AuthenticationModel({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'type') String? type,
  }) = _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
}
