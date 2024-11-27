// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.price case final value?) 'price': value,
      if (instance.createdBy case final value?) 'created_by': value,
      if (instance.categoryId case final value?) 'category_id': value,
      if (instance.category case final value?) 'category': value,
    };

_$CategoryWithProductsModelImpl _$$CategoryWithProductsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryWithProductsModelImpl(
      category: json['category'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryWithProductsModelImplToJson(
        _$CategoryWithProductsModelImpl instance) =>
    <String, dynamic>{
      if (instance.category case final value?) 'category': value,
      if (instance.products?.map((e) => e.toJson()).toList() case final value?)
        'products': value,
    };
