import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/config/localDB.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ApiProvider {
  static const baseUrl = 'http://localhost:2000';
  Future<Map<String, dynamic>> authentication(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      print(baseUrl);

      // Log response details
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'HTTP Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (error) {
      print('Error during API call: $error');
      throw Exception('API call failed: $error');
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint, Map<String, dynamic> body) async {
  try {
    final boxOpen = await db.openBox("token");
    final token = db.fromDb(boxOpen, 'key');
    
    // Make sure the token is prefixed with 'Bearer '
    final authHeader = 'Bearer $token';
    
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': authHeader,  // Use the 'Bearer' token format
      },
      body: jsonEncode(body),
    );

    printx('Response Status Code', response.statusCode);
    printx('Response Body', response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successful response
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      // Handle Bad Request (400)
      throw Exception('Bad Request: ${response.body}');
    } else if (response.statusCode == 401) {
      // Handle Unauthorized (401)
      throw Exception('Unauthorized: ${response.body}');
    } else if (response.statusCode == 404) {
      // Handle Not Found (404)
      throw Exception('Not Found: ${response.body}');
    } else if (response.statusCode == 500) {
      // Handle Internal Server Error (500)
      throw Exception('Internal Server Error: ${response.body}');
    } else {
      // Handle other HTTP errors here.
      throw Exception('Failed to make API call: ${response.statusCode}');
    }
  } catch (error) {
    // Handle network or other errors
    throw Exception('Failed to make API call: $error');
  }
}


  LocalDatabaseService db = LocalDatabaseService();

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final boxOpen = await db.openBox("token");
      final token = db.fromDb(boxOpen, 'key');
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );
      printx('body', response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to make GET API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make GET API call: $error');
    }
  }

 Future<List<dynamic>> getList(String endpoint) async {
  try {
    final boxOpen = await db.openBox("token");
    final token = db.fromDb(boxOpen, 'key');

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      throw Exception("No token found. Please log in again.");
    }

    // Log token and headers for debugging
   print('Token: $token');

    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // Log the full response for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Check if the response is successful
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception(
          'Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (error) {
   print('Error making GET API call: $error');
    throw Exception('Failed to make GET API call: $error');
  }
}


  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final boxOpen = await db.openBox("token");
      final token = db.fromDb(boxOpen, 'key');
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(body),
      );
      printx("body", response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to make PUT API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make PUT API call: $error');
    }
  }

  delete(String endpoint) async {
    try {
      final boxOpen = await db.openBox("token");
      final token = db.fromDb(boxOpen, 'key');
      final response = await http.delete(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );
      printx("", response.statusCode);
      printx(response.body, "");
      if (response.statusCode != 200) {
        throw Exception(
            'Failed to make DELETE API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make DELETE API call: $error');
    }
  }
}
