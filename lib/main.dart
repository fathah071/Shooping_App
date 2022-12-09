

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/controller/shared_preference_controller.dart';
import 'view/wrapper.dart';

void main() {
  // SharedPreferences.setMockInitialValues({});
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider<CartItemController>(create: (context)=>CartItemController())
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper()
    ),
  ),);
}
