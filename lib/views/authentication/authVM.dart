import 'package:ecommerce_flutter/config/localDB.dart';
import 'package:ecommerce_flutter/config/network_repo.dart';
import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();

  UserModel user = const UserModel();

  Future<void> login(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(username: user.username, password: user.password);
      printx(".........................", user);
      final response = await apiProvider.post('signin', user.toJson());
      final token = response['token'];
      final userId = response['_id'];
      final userType = response['userType'];
      printx("this is user is..............user is user is ...........",
          "${userId} use idddddddddddddddddddddd");
      printx('dddddddddddddddddddddd this my token dddddddddddddddddddddddd',
          token);
      _logger.d("Token: $token");
      db.toDb(await db.openBox('token'), "key", token);
      db.toDb(await db.openBox('_id'), "key", userId);
      db.toDb(await db.openBox('userType'), "key", userType);
      _logger.d("userTypessssssssssssssssssssssssssssssssssssss: $userType");
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  Future<void> register(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(username: user.username, password: user.password);
      await apiProvider.post('signup', user.toJson());
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
