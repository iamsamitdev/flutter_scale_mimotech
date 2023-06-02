// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      onSkip: () async {
        // debugPrint("On Skip Called....");
        // Create shared preference object
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('step', 1);

        // Naviate to Login Screen
        Navigator.pushReplacementNamed(context, '/login');
      },
      showPrevNextButton: true,
      showIndicator: true,
      backgourndColor: Colors.white,
      activeDotColor: Colors.blue,
      deactiveDotColor: Colors.grey,
      iconColor: Colors.black,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: [
        OnBoardingModel(
          image: Image.asset("assets/images/img1.png"),
          title: "Business Chat",
          body:
              "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/img2.png"),
          title: "Coffee With Friends",
          body:
              "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/img3.png"),
          title: "Mobile Application",
          body:
              "Mobile content marketing has also been found to enhance quick online actions and make follow-ups easier.",
        ),
        OnBoardingModel(
          image: Column(
            children: [
              Image.asset("assets/images/img4.png"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setInt('step', 1);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  "เริ่มต้นใช้งาน",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
          title: "",
          body: "",
        ),
      ],
    );
  }
}
