import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pediprojflutter/ui/components/badge_icon.dart';
import 'package:pediprojflutter/ui/pages/screens/account_screen.dart';
import 'package:pediprojflutter/ui/pages/screens/cart_screen.dart';
import 'package:animations/animations.dart';
import 'package:pediprojflutter/ui/pages/screens/home_screen.dart';
import 'package:pediprojflutter/ui/pages/screens/shop_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> _navList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    badgeIcon(label: "Cart", value: "0", icon: Icon(Icons.shopping_cart)),
    BottomNavigationBarItem(
      icon: Icon(Icons.shop),
      label: "Shops",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Account",
    ),
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    ShopScreen(),
    AccountScreen(),
  ];
  int _selectedScreen = 0; // Home screen index

  void _setSelectedScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedFontSize: 0,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreen,
        onTap: _setSelectedScreen,
        items: _navList,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: _screens[_selectedScreen],
      ),
    );
  }
}
