// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationModelImpl _$$AuthenticationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationModelImpl(
      username: json['username'] as String?,
      password: json['password'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$AuthenticationModelImplToJson(
        _$AuthenticationModelImpl instance) =>
    <String, dynamic>{
      if (instance.username case final value?) 'username': value,
      if (instance.password case final value?) 'password': value,
      if (instance.type case final value?) 'type': value,
    };
