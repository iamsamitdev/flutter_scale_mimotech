import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';

// App Router Class
class AppRouter {

  // Router Map key
  static const String welcome = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';

  // Router Map
  static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    dashboard: (context) => const DashboardScreen(),
  };

}