import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:etamen/layout/home_layout.dart';
import 'package:etamen/signing/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(HomeLayout());
                  },
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thank You!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(width: 160, height: 160, child: Image.asset('confirm.png'))
        ]),
      ),
    );
  }
}
