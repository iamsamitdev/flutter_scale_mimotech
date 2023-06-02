// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InfoSceen extends StatefulWidget {
  const InfoSceen({super.key});

  @override
  State<InfoSceen> createState() => _InfoSceenState();
}

class _InfoSceenState extends State<InfoSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: Center(
        child: const Text('Info Screen'),
      ),
    );
  }
}