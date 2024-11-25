import 'package:ecommerce_flutter/config/network_repo.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AProductVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();
  final Logger _logger = Logger();
  ProductModel product = const ProductModel();
  List<ProductModel> products = [];
  bool isLoaded = false;
  bool hasError = false;
  String errorMessage = '';

  // Constructor is clean, no need to call fetchProducts here
  AProductVM() {
    fetchProducts();
  }

  Future<void> addProduct(void Function(bool success) callback) async {
    bool success = false;
    try {
      product = product.copyWith(
          name: product.name,
          description: product.description,
          price: product.price);
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
      final response = await apiProvider.getList('admin/list');

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
}
