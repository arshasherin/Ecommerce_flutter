import 'package:ecommerce_flutter/views/admin/product/aproductVM.dart';
import 'package:ecommerce_flutter/views/authentication/authVM.dart';
import 'package:ecommerce_flutter/views/user/product/productVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> customProviders(BuildContext context) {
  return [
    ChangeNotifierProvider<AuthVM>(create: (_) => AuthVM()),
    ChangeNotifierProvider<ProductVM>(create: (_) => ProductVM()),
     ChangeNotifierProvider<AProductVM>(create: (_) => AProductVM()),
  ];
}
