// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ContactSceen extends StatefulWidget {
  const ContactSceen({super.key});

  @override
  State<ContactSceen> createState() => _ContactSceenState();
}

class _ContactSceenState extends State<ContactSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: const Text('Contact Screen'),
      ),
    );
  }
}