// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/authentication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) {
  return _AuthenticationModel.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationModel {
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this AuthenticationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationModelCopyWith<AuthenticationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationModelCopyWith<$Res> {
  factory $AuthenticationModelCopyWith(
          AuthenticationModel value, $Res Function(AuthenticationModel) then) =
      _$AuthenticationModelCopyWithImpl<$Res, AuthenticationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? username,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class _$AuthenticationModelCopyWithImpl<$Res, $Val extends AuthenticationModel>
    implements $AuthenticationModelCopyWith<$Res> {
  _$AuthenticationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationModelImplCopyWith<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  factory _$$AuthenticationModelImplCopyWith(_$AuthenticationModelImpl value,
          $Res Function(_$AuthenticationModelImpl) then) =
      __$$AuthenticationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? username,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class __$$AuthenticationModelImplCopyWithImpl<$Res>
    extends _$AuthenticationModelCopyWithImpl<$Res, _$AuthenticationModelImpl>
    implements _$$AuthenticationModelImplCopyWith<$Res> {
  __$$AuthenticationModelImplCopyWithImpl(_$AuthenticationModelImpl _value,
      $Res Function(_$AuthenticationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? type = freezed,
  }) {
    return _then(_$AuthenticationModelImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationModelImpl implements _AuthenticationModel {
  const _$AuthenticationModelImpl(
      {@JsonKey(name: 'username') this.username,
      @JsonKey(name: 'password') this.password,
      @JsonKey(name: 'type') this.type});

  factory _$AuthenticationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationModelImplFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'password')
  final String? password;
  @override
  @JsonKey(name: 'type')
  final String? type;

  @override
  String toString() {
    return 'AuthenticationModel(username: $username, password: $password, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, password, type);

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationModelImplCopyWith<_$AuthenticationModelImpl> get copyWith =>
      __$$AuthenticationModelImplCopyWithImpl<_$AuthenticationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationModelImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationModel implements AuthenticationModel {
  const factory _AuthenticationModel(
      {@JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'password') final String? password,
      @JsonKey(name: 'type') final String? type}) = _$AuthenticationModelImpl;

  factory _AuthenticationModel.fromJson(Map<String, dynamic> json) =
      _$AuthenticationModelImpl.fromJson;

  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'password')
  String? get password;
  @override
  @JsonKey(name: 'type')
  String? get type;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationModelImplCopyWith<_$AuthenticationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
