import 'package:freezed_annotation/freezed_annotation.dart';
part '../gen/product_model.freezed.dart';
part '../gen/product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'created_by') int? createdBy,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
