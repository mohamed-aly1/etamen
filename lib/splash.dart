import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:etamen/layout/home_layout.dart';
import 'package:etamen/signing/signup.dart';
import 'package:etamen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Image.asset('assets/splashlogo.png')),
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      nextScreen: WelcomePage(),
      splashIconSize: 150,
      duration: 1500,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
