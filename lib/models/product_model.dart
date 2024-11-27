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
    @JsonKey(name: 'category_id') int? categoryId, // Add category_id field
    @JsonKey(name: 'category') String? category,    // Add category field (category name)
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class CategoryWithProductsModel with _$CategoryWithProductsModel {
  const factory CategoryWithProductsModel({
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'products') List<ProductModel>? products,
  }) = _CategoryWithProductsModel;

  factory CategoryWithProductsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryWithProductsModelFromJson(json);
}