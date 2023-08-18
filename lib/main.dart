import 'package:clothing_app/screens/product_home_page.dart';
import 'package:flutter/material.dart';

import 'utils/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Constants.primaryFont,
      ),
      home: const HomePage(),
    );
  }
}