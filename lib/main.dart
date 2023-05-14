import 'package:etamen/completed.dart';
import 'package:etamen/firebase_options.dart';
import 'package:etamen/layout/home_layout.dart';
import 'package:etamen/modules/reservation/available_nurses.dart';
import 'package:etamen/modules/reservation/reservation.dart';
import 'package:etamen/modules/reservation/resv_confirmation.dart';
import 'package:etamen/modules/reservation/resv_datails.dart';
import 'package:etamen/shared/network/local/cach_helper.dart';
import 'package:etamen/signing/signup.dart';
import 'package:etamen/signupsplash.dart';
import 'package:etamen/splash.dart';
import 'package:etamen/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signing/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFF06D57),
        colorScheme: ColorScheme.light(
            primary: Color(0xFFF06D57), secondary: Color(0xFFF48E7C)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40),
            backgroundColor:
                Color.fromARGB(255, 240, 109, 87), // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          TextTheme(
            displayLarge: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'leagueSpartan'),
            titleLarge: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'leagueSpartan',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            titleMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'leagueSpartan',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            bodyMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'leagueSpartan',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            bodyLarge: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'leagueSpartan',
              color: Color(0xFFF06D57),
            ),
            bodySmall: TextStyle(fontSize: 16.0, fontFamily: 'leagueSpartan'),
          ),
        ),
      ),
      routes: {
        "welcome": (context) => WelcomePage(),
        "SignUp": (context) => Signup(),
        "SignIn": (context) => SignIn(),
        "HomeLayout": (context) => HomeLayout(),
        "SignUpSplash": (context) => SignUpSplash(),
        "Reservation": (context) => Reservation(),
        "ResvDetails": (context) => ResvDetails(),
        "AvailableNurses": (context) => AvailableNurses(),
        "ResvConfirmation": (context) => ResvConfirmation(),
        "Completed": (context) => Completed(),
      },
      home: Splash(),
    );
  }
}



