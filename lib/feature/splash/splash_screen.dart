import 'dart:async';

import 'package:app_1/feature/route/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      _checkFirstTime();
    });
  }

  _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool("isFirstTime");

    if (isFirstTime == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(onboarding, (route) => false);
      prefs.setBool("isFirstTime", true);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(todoScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/onBoarding", (route) => false);
        },
        child: Column(
          children: [
            const SizedBox(height: 243),
            Image.asset(Assets.assets_image_i0_png),
            const SizedBox(height: 16),
            const Text(
              "CodeFactory",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3C3A36)),
            ),
          ],
        ),
      ),
    );
  }
}
