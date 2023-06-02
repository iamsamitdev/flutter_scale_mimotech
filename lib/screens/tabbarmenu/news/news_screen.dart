// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'ข่าวล่าสุด',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 210,
              child: Container(
                color: primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'ข่าวทั้งหมด',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Container(
                color: primary,
              ),
            ),
          ],
        )
      ),
    );
  }
}