import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pediprojflutter/services/cart_service.dart';
import 'package:pediprojflutter/ui/components/badge_icon.dart';
import 'package:pediprojflutter/ui/pages/screens/account_screen.dart';
import 'package:pediprojflutter/ui/pages/screens/cart_screen.dart';
import 'package:animations/animations.dart';
import 'package:pediprojflutter/ui/pages/screens/home_screen.dart';
import 'package:pediprojflutter/ui/pages/screens/shop_screen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          badgeIcon(
            label: "Cart",
            value: '${context.watch<CartService>().items.length}',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Shops",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
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
