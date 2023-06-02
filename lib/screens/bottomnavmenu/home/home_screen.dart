// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/tabbarmenu/news/news_screen.dart';
import 'package:flutter_scale/screens/tabbarmenu/products/products_screen.dart';
import 'package:flutter_scale/screens/tabbarmenu/stores/stores_screen.dart';
import 'package:flutter_scale/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TabBar(
            labelColor: primaryDark,
            indicatorColor: primaryDark,
            tabs: [
              Tab(text: 'News'),
              Tab(text: 'Products'),
              Tab(text: 'Stores'),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            NewsScreen(),
            ProductsScreen(),
            StoresScreen()
          ],
        )
      ),
    );
  }
}