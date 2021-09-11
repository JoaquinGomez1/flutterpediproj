import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/pages/screens/account_screen.dart';
import 'package:pediprojflutter/ui/pages/screens/cart_screen.dart';

import 'package:pediprojflutter/ui/pages/screens/home_screen.dart';
import 'package:provider/provider.dart';

List<BottomNavigationBarItem> _navList = [
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: "Cart",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "Account",
  ),
];

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Widget> _screens = [CartScreen(), HomeScreen(), AccountScreen()];
  int _selectedScreen = 1; // Home screen index

  void _setSelectedScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreen,
        onTap: (int index) {
          _setSelectedScreen(index);
        },
        items: _navList,
      ),
      body: _screens.elementAt(_selectedScreen),
    );
  }
}
