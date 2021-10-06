import 'package:flutter/material.dart';
import 'package:pediprojflutter/constants/theme.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn =
        Provider.of<UserService>(context).getCurrentUser() != null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedi Proj Flutter',
      theme: themeData(),
      initialRoute: isLoggedIn ? "/" : "/auth",
      routes: routes,
    );
  }
}
