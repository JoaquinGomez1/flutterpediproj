import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pediprojflutter/services/cart_service.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<UserService>(
          create: (_) => UserService(),
        ),
        Provider<CartService>(
          create: (_) => CartService(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedi Proj Flutter',
      theme: ThemeData(
        primaryColor: Colors.red[400],
        backgroundColor: Colors.red,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: "/auth",
      routes: routes,
    );
  }
}