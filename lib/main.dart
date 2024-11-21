import 'package:ecommerce_flutter/config/localDB.dart';
import 'package:ecommerce_flutter/config/providers.dart';
import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/views/admin/ahome/ahome.dart';
import 'package:ecommerce_flutter/views/authentication/login.dart';
import 'package:ecommerce_flutter/views/user/uhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  final token = LocalDatabaseService()
      .fromDb(await LocalDatabaseService().openBox("token"), 'key');
  runApp(MyApp(
    saved: token,
  ));
}

class MyApp extends StatelessWidget {
  final dynamic saved;

  const MyApp({super.key, this.saved});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: 
      FutureBuilder<String?>(
        future: check(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final userType = snapshot.data;
            printx("User type", userType);
    
            return saved != null
                ? userType == 'admin'
                    ? const AhomeScreen()
                    : const UhomeScreen()
                : AhomeScreen();
          } else {
            return AhomeScreen();
          }
        },
      ),
    );
  }

  Future<String?> check() async {
    try {
      // Open the box named "userType"
      final userTypeBox = await LocalDatabaseService().openBox("role");

      // Retrieve the value associated with the key 'key'
      final userType = LocalDatabaseService().fromDb(userTypeBox, 'key');
      printx('User Type', userType);
      return userType;
    } catch (e) {
      printx('Error during userType check', e);
      return null; // Handle error gracefully, return null or a default value
    }
  }
}
