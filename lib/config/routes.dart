import 'package:ecommerce_flutter/views/admin/ahome/ahome.dart';
import 'package:ecommerce_flutter/views/admin/product/aproduct.dart';
import 'package:ecommerce_flutter/views/authentication/login.dart';
import 'package:ecommerce_flutter/views/user/home/uhome.dart';
import 'package:ecommerce_flutter/views/user/product/uproduct.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case UhomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UhomeScreen(),
      );
    case AhomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AhomeScreen(),
      );
      case UProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UProductScreen(),
      );
       case AProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AProductScreen(),
      );


    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
