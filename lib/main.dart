import 'package:flutter/material.dart';
import 'package:star_github/presentation/details_screen/details_screen.dart';
import 'package:star_github/presentation/home_screen/homescreen_view.dart';
import 'package:star_github/utils/themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customTheme,
      home: const DetailsScreen(),
    );
  }
}


