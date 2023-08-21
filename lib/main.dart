import 'package:flutter/material.dart';
import 'package:muliti_role_base_app/HomeScreen.dart';
import 'package:muliti_role_base_app/SplashScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "demo project",
      home: SplashScreen(),
    );
  }
}
