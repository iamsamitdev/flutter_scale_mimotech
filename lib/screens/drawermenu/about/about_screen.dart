// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutSceen extends StatefulWidget {
  const AboutSceen({super.key});

  @override
  State<AboutSceen> createState() => _AboutSceenState();
}

class _AboutSceenState extends State<AboutSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: const Text('About'),
      ),
    );
  }
}