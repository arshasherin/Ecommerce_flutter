import 'package:ecommerce_flutter/views/authentication/authVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> customProviders(BuildContext context) {
  return [
     ChangeNotifierProvider<AuthVM>(create: (_) => AuthVM()),
  ];
}
