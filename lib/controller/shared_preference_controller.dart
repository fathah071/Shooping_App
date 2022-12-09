import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItemController extends ChangeNotifier {
  List<String> cartItemList = [];
  int count1 =1;
  List count=[];

  addItemToCart(String cartItem) async {
    cartItemList.add(cartItem);
    notifyListeners();
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    var a= sharedPrefs.getStringList("item");
    print(sharedPrefs.getStringList("item"));
    print(a);
    if(a!=null)
      {a!.forEach((element) {
      cartItemList.add(element);

    });}
    cartItemList=cartItemList.toSet().toList();
    sharedPrefs.setStringList("item", cartItemList);
    notifyListeners();
    print(sharedPrefs.getStringList("item"));

  }

  getCartItem() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    cartItemList = sharedPrefs.getStringList("item") ?? [];
    print(cartItemList.length);
    print("after save" + sharedPrefs.getStringList("item").toString());
    // count.clear();
  count.isEmpty?cartItemList.forEach((element) {
    count.add(0);
  }):count.fillRange(count.length,cartItemList.length,0);
    print(count.length);
    notifyListeners();
    print("after save" + sharedPrefs.getStringList("item").toString());
    
  }
  clearData() async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }




  void add1({int? index}){
    count[index!]++;
      // count1++;
    notifyListeners();
  }
  void less1({int? index}){
    count[index!]--;
    // count1++;
    notifyListeners();
  }


}
