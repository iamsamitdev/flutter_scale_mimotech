import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/drawermenu/about/about_screen.dart';
import 'package:flutter_scale/screens/drawermenu/contact/contact_screen.dart';
import 'package:flutter_scale/screens/drawermenu/info/info_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/newsdetail/news_detail_screen.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';

// App Router Class
class AppRouter {

  // Router Map key
  static const String welcome = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String info = '/info';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String newsdetail = '/newsdetail';

  // Router Map
  static get routes => <String, WidgetBuilder> {
  // static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    dashboard: (context) => const DashboardScreen(),
    info: (context) => const InfoSceen(),
    about: (context) => const AboutSceen(),
    contact: (context) => const ContactSceen(),
    newsdetail: (context) => const NewsDetailScreen(),
  };

}