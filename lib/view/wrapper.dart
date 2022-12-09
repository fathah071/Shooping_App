import 'package:flutter/material.dart';
import 'package:shopping_cart/view/account_page/account_screen.dart';
import 'package:shopping_cart/view/Cart_page/cart_page.dart';

import 'home_page/home_screen.dart';
import 'menu_page/product_listing_screen.dart';
import 'search_page/search_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
     ProductListingScreen(categoryIndex: 0,),
    const SearchScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 18,
          unselectedFontSize: 18,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          selectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
          unselectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[900],
          onTap: _onItemTapped,
        ));
  }
}
