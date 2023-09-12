import 'package:flutter/material.dart';
import 'package:practice/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        primarySwatch: Colors.deepPurple,
      ),
      home: myHomepage(),
    );
  }
}
