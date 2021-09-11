import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pediprojflutter/ui/pages/auth_page.dart';
import 'package:pediprojflutter/ui/pages/product_page.dart';
import 'package:pediprojflutter/ui/pages/home_page.dart';

class RouteModel {
  String name;
  String route;
  Icon icon;
  Icon? activeIcon;
  Widget widget;

  RouteModel({
    required this.name,
    required this.route,
    required this.widget,
    required this.icon,
    this.activeIcon,
  }) {}
}

/*
  This project is structured in a way that every page can contain different screens
  Each page has zero or one BottomTabNavigationBar
*/

Map<String, RouteModel> routesConfig = {
  "home": RouteModel(
    name: "Home",
    route: "/",
    widget: MyHomePage(title: "Home"),
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home),
  ),
  "product": RouteModel(
    name: "Product",
    route: "/product",
    widget: ProductPage(),
    activeIcon: Icon(Icons.shopping_cart),
    icon: Icon(Icons.shopping_cart),
  ),
  "auth": RouteModel(
    name: "Auth",
    route: "/auth",
    widget: AuthPage(),
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home),
  ),
};

Widget _defaultWidget = Container();

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => routesConfig["home"]!.widget,
  "/product/:id": (context) => routesConfig["product"]!.widget,
  "/auth": (context) => routesConfig["auth"]!.widget,
};
