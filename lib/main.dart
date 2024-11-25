import 'package:ecommerce_flutter/config/localDB.dart';
import 'package:ecommerce_flutter/config/providers.dart';
import 'package:ecommerce_flutter/config/routes.dart';
import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/views/admin/ahome/ahome.dart';
import 'package:ecommerce_flutter/views/authentication/login.dart';
import 'package:ecommerce_flutter/views/user/home/uhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hive_flutter/adapters.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiProvider(
      providers: customProviders(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: SplashScreen(saved: saved),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  final dynamic saved;

  const SplashScreen({Key? key, this.saved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _checkUserType(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(), // Show loading indicator
          );
        }

        if (snapshot.hasData && saved != null) {
          final userType = snapshot.data;
          print('User type: $userType');

          if (userType == 'admin') {
            return const AhomeScreen();
          } else {
            return const UhomeScreen();
          }
        } else {
          return const LoginScreen();
        }
      },
    );
  }

  Future<String?> _checkUserType() async {
    try {
      final userTypeBox = await LocalDatabaseService().openBox("type");
      final userType = LocalDatabaseService().fromDb(userTypeBox, 'key');
      print('User Type: $userType');
      return userType;
    } catch (e) {
      print('Error during userType check: $e');
      return null;
    }
  }
}
