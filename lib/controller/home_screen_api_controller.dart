import 'dart:io';
import 'package:shopping_cart/controller/shared_preference_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/model/cart_model.dart';
import 'package:shopping_cart/model/categories_model.dart';
import 'package:shopping_cart/utilities/constants/api_url.dart';

//get home page data
Future<Cart> getHomeScreenData() async {
  final response = await http.get(
    Uri.parse("${homeScreenApiUrl}home"),
    headers: {HttpHeaders.authorizationHeader: "Bearer akhil@intertoons.com"},
  );
  final cart = cartFromJson(response.body);
  if (response.statusCode == 200) {
    return cart;
  } else {
    throw Exception("failed to load data");
  }
}

//get home page categories data
Future<Categories> getCategories() async {
  final response = await http.get(
    Uri.parse("${homeScreenApiUrl}categories"),
    headers: {HttpHeaders.authorizationHeader: "Bearer akhil@intertoons.com"},
  );
  final categories = categoriesFromJson(response.body);
  if (response.statusCode == 200) {
    return categories;
  } else {
    throw Exception("failed to load data");
  }
}

postData(List Cartlist) async {
   try {var response = await http
      .post(Uri.parse("http://fda.intertoons.com/api/V1/products"), headers: {
    HttpHeaders.authorizationHeader: "Bearer akhil@intertoons.com"
  }, body: {
    "name": "fathah",
    "items": Cartlist,
  });
  print(response.body);}
       catch (e){
     print(e);
       }
}
