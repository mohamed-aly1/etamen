import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:etamen/layout/home_layout.dart';
import 'package:etamen/signing/signin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Image.asset('assets/done.png')),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      nextScreen: HomeLayout(),
      splashIconSize: 250,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
