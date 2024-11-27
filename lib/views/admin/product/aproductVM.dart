// ignore: file_names
import 'package:ecommerce_flutter/config/network_repo.dart';
import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/models/category_model.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AProductVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();
  final Logger _logger = Logger();
  ProductModel product = const ProductModel();
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  bool isLoaded = false;
  bool hasError = false;
  String errorMessage = '';

  CategoryModel? _selectedCategory;

  CategoryModel? get selectedCategory => _selectedCategory;

  void selectCategory(CategoryModel category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Constructor is clean, no need to call fetchProducts here
  AProductVM() {
    fetchProducts();
    fetchCategories();
  }

  Future<void> addProduct(void Function(bool success) callback) async {
    bool success = false;
    try {
      // Ensure a category is selected before proceeding
      if (_selectedCategory == null) {
        throw Exception('No category selected');
      }

      product = product.copyWith(
        name: product.name,
        description: product.description,
        price: product.price,
        categoryId: _selectedCategory!.id, // Add the selected category ID
      );

      printx(
          ".....................././././././././././././././. prodycts with categotu ixd ",
          product);

      await apiProvider.post('admin/add', product.toJson());
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  // Fetch products
  Future<void> fetchProducts() async {
    isLoaded = false;
    hasError = false;
    errorMessage = '';
    notifyListeners();

    try {
      final response = await apiProvider.getList('admin/products');

      _logger.d('Fetched Products Response user: $response');
      products = response
          .map<ProductModel>((data) => ProductModel.fromJson(data))
          .toList();

      isLoaded = true;
    } catch (error, stackTrace) {
      _logger.e('Error fetching products: $error',
          error: error, stackTrace: stackTrace);
      hasError = true;
      errorMessage = error.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> dtlProduct(int id) async {
    try {
      await apiProvider.delete('admin/product/$id');

      // Log success message
      _logger.d("Product deleted successfully: ID $id");

      // Refresh the product list to reflect the change
      await fetchProducts();
    } catch (error, stackTrace) {
      // Log error details for debugging
      _logger.e("Error deleting product: $error",
          error: error, stackTrace: stackTrace);
    }
  }

  Future<void> updateProduct(int id, ProductModel updatedProduct) async {
    try {
      final response =
          await apiProvider.put('admin/product/$id', updatedProduct.toJson());
      _logger.d("Product updated successfully: $response");

      // Update the local list
      final index = products.indexWhere((p) => p.id == id);
      if (index != -1) {
        products[index] = updatedProduct;
        notifyListeners();
      }
    } catch (error, stackTrace) {
      _logger.e("Error updating product: $error",
          error: error, stackTrace: stackTrace);
    }
  }

  // Fetch products
  Future<void> fetchCategories() async {
    isLoaded = false;
    hasError = false;
    errorMessage = '';
    notifyListeners();

    try {
      final response = await apiProvider.getList('admin/categories');

      _logger.d('Fetched categories Response user: $response');
      categories = response
          .map<CategoryModel>((data) => CategoryModel.fromJson(data))
          .toList();

      isLoaded = true;
    } catch (error, stackTrace) {
      _logger.e('Error fetching products: $error',
          error: error, stackTrace: stackTrace);
      hasError = true;
      errorMessage = error.toString();
    } finally {
      notifyListeners();
    }
  }
}
