import 'package:bookmyroom/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffBA94D1),
      )),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
