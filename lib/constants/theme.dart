import 'package:flutter/material.dart';

themeData() {
  return ThemeData(
    primaryColor: Colors.red[400],
    backgroundColor: Colors.red,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
