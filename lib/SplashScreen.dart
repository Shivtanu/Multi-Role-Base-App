import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muliti_role_base_app/AdminScreen%20.dart';
import 'package:muliti_role_base_app/HomeScreen.dart';
import 'package:muliti_role_base_app/LoginScreen.dart';
import 'package:muliti_role_base_app/StudentScreen.dart';
import 'package:muliti_role_base_app/TeacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    String userType = sp.getString('UserType') ?? '';

    if (islogin) {
      if (userType == 'Student') {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else if (userType == 'Teacher') {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      } else if (userType == 'Admin') {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminScreen()));
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          image: NetworkImage(
              "https://images.unsplash.com/photo-1500485035595-cbe6f645feb1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2NlbmVyeXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80")),
    );
  }
}
