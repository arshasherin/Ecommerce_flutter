import 'package:ecommerce_flutter/config/localDB.dart';
import 'package:ecommerce_flutter/config/network_repo.dart';
import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:ecommerce_flutter/views/admin/ahome/ahome.dart';
import 'package:ecommerce_flutter/views/user/uhome.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();

  UserModel user = const UserModel();

  Future<void> login(
      void Function(bool success) callback, BuildContext context) async {
    bool success = false;
    try {
      user = user.copyWith(username: user.username, password: user.password);
      print("User attempting to log in: $user");

      final response = await apiProvider.authentication('login', user.toJson());

      if (response.containsKey('token') && response.containsKey('data')) {
        final token = response['token'];
        final userData = response['data'];
        final userId = userData['id'];
        final userType = userData['type'];

        // Save to local storage
        db.toDb(await db.openBox('token'), "key", token);
        db.toDb(await db.openBox('id'), "key", userId);
        db.toDb(await db.openBox('type'), "key", userType);

        success = true;

        // Navigate based on user type
        if (userType == 'admin') {
          Navigator.pushReplacementNamed(context, AhomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, UhomeScreen.routeName);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        _logger.e("Error: Missing 'token' or 'data' in response");
      }
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
    }
  }

  Future<void> register(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(username: user.username, password: user.password);
      await apiProvider.authentication('register', user.toJson());
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  logoutUser() async {
    final a = await db.openBox("token");
    db.deleteDb(a, 'key');
    _logger.d("User logged out successfully");
    notifyListeners();
  }
}
