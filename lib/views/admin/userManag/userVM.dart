import 'package:ecommerce_flutter/config/localDB.dart';
import 'package:ecommerce_flutter/config/network_repo.dart';
import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();
  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();
  UserModel user = const UserModel();
  List<UserModel> users = [];
  bool isLoaded = false;
  bool hasError = false;
  String errorMessage = '';

  UserVM() {
    getUsers();
  }

  Future<void> addUser(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(
          username: user.username, password: user.password, type: "user");
      await apiProvider.authentication('admin/user', user.toJson());
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  // Fetch users
  Future<void> getUsers() async {
    isLoaded = false;
    hasError = false;
    errorMessage = '';
    notifyListeners();

    try {
      // Fetch the full JSON response
      final response = await apiProvider.getJson('admin/users');

      // Ensure the "data" key is present and contains a list
      if (response.containsKey('data') && response['data'] is List<dynamic>) {
        final data = response['data'] as List<dynamic>;
        _logger.d('Fetched Users Data: $data');
        users =
            data.map<UserModel>((json) => UserModel.fromJson(json)).toList();
        isLoaded = true;
      } else {
        throw Exception(
            'Invalid response format: "data" key is missing or not a list.');
      }
    } catch (error, stackTrace) {
      _logger.e('Error fetching users: $error',
          error: error, stackTrace: stackTrace);
      hasError = true;
      errorMessage = error.toString();
    } finally {
      notifyListeners();
    }
  }
}
