// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  int? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId =>
      throw _privateConstructorUsedError; // Add category_id field
  @JsonKey(name: 'category')
  String? get category =>
      throw _privateConstructorUsedError; // Add category field (category name)
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'price') double? price,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? createdBy = freezed,
    Object? categoryId = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'price') double? price,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? createdBy = freezed,
    Object? categoryId = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'price')
  final double? price;
  @override
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
// Add category_id field
  @override
  @JsonKey(name: 'category')
  final String? category;
// Add category field (category name)
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, createdBy: $createdBy, categoryId: $categoryId, category: $category, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, price,
      createdBy, categoryId, category, imageUrl);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'price') final double? price,
      @JsonKey(name: 'created_by') final int? createdBy,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'category') final String? category,
      @JsonKey(name: 'image_url') final String? imageUrl}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'price')
  double? get price;
  @override
  @JsonKey(name: 'created_by')
  int? get createdBy;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId; // Add category_id field
  @override
  @JsonKey(name: 'category')
  String? get category; // Add category field (category name)
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryWithProductsModel _$CategoryWithProductsModelFromJson(
    Map<String, dynamic> json) {
  return _CategoryWithProductsModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryWithProductsModel {
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<ProductModel>? get products => throw _privateConstructorUsedError;

  /// Serializes this CategoryWithProductsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryWithProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryWithProductsModelCopyWith<CategoryWithProductsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryWithProductsModelCopyWith<$Res> {
  factory $CategoryWithProductsModelCopyWith(CategoryWithProductsModel value,
          $Res Function(CategoryWithProductsModel) then) =
      _$CategoryWithProductsModelCopyWithImpl<$Res, CategoryWithProductsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category') String? category,
      @JsonKey(name: 'products') List<ProductModel>? products});
}

/// @nodoc
class _$CategoryWithProductsModelCopyWithImpl<$Res,
        $Val extends CategoryWithProductsModel>
    implements $CategoryWithProductsModelCopyWith<$Res> {
  _$CategoryWithProductsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryWithProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryWithProductsModelImplCopyWith<$Res>
    implements $CategoryWithProductsModelCopyWith<$Res> {
  factory _$$CategoryWithProductsModelImplCopyWith(
          _$CategoryWithProductsModelImpl value,
          $Res Function(_$CategoryWithProductsModelImpl) then) =
      __$$CategoryWithProductsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category') String? category,
      @JsonKey(name: 'products') List<ProductModel>? products});
}

/// @nodoc
class __$$CategoryWithProductsModelImplCopyWithImpl<$Res>
    extends _$CategoryWithProductsModelCopyWithImpl<$Res,
        _$CategoryWithProductsModelImpl>
    implements _$$CategoryWithProductsModelImplCopyWith<$Res> {
  __$$CategoryWithProductsModelImplCopyWithImpl(
      _$CategoryWithProductsModelImpl _value,
      $Res Function(_$CategoryWithProductsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryWithProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? products = freezed,
  }) {
    return _then(_$CategoryWithProductsModelImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryWithProductsModelImpl implements _CategoryWithProductsModel {
  const _$CategoryWithProductsModelImpl(
      {@JsonKey(name: 'category') this.category,
      @JsonKey(name: 'products') final List<ProductModel>? products})
      : _products = products;

  factory _$CategoryWithProductsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryWithProductsModelImplFromJson(json);

  @override
  @JsonKey(name: 'category')
  final String? category;
  final List<ProductModel>? _products;
  @override
  @JsonKey(name: 'products')
  List<ProductModel>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryWithProductsModel(category: $category, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryWithProductsModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_products));

  /// Create a copy of CategoryWithProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryWithProductsModelImplCopyWith<_$CategoryWithProductsModelImpl>
      get copyWith => __$$CategoryWithProductsModelImplCopyWithImpl<
          _$CategoryWithProductsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryWithProductsModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryWithProductsModel implements CategoryWithProductsModel {
  const factory _CategoryWithProductsModel(
          {@JsonKey(name: 'category') final String? category,
          @JsonKey(name: 'products') final List<ProductModel>? products}) =
      _$CategoryWithProductsModelImpl;

  factory _CategoryWithProductsModel.fromJson(Map<String, dynamic> json) =
      _$CategoryWithProductsModelImpl.fromJson;

  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'products')
  List<ProductModel>? get products;

  /// Create a copy of CategoryWithProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryWithProductsModelImplCopyWith<_$CategoryWithProductsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
