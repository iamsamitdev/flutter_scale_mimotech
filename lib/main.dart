// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/routers/app_router.dart';
import 'package:flutter_scale/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

var initURL;

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // ต้องเรียกใช้เพื่อให้ทำงานก่อน runApp

  // Create shared preferences instance
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getInt('step') == null){
    initURL = '/';
  } else if(prefs.getInt('step') == 1){
    initURL = '/login';
  } else if(prefs.getInt('step') == 2){
    initURL = '/dashboard';
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: initURL,
      routes: AppRouter.routes,
    );
  }
}

