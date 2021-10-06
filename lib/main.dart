import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pediprojflutter/app.dart';
import 'package:pediprojflutter/services/cart_service.dart';
import 'package:pediprojflutter/services/user_service.dart';
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
        ChangeNotifierProvider<CartService>(
          create: (_) => CartService(),
        )
      ],
      child: MyApp(),
    ),
  );
}
