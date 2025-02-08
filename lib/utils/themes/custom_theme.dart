import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Color(0xFF17181c),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF17181c),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200),
    bodySmall: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200),
  ),
);
