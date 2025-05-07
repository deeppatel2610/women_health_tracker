import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_health_tracker/screens/auth%20page/login_page.dart';
import 'package:women_health_tracker/screens/curved%20navigation%20bar/navigation_bar.dart';

import '../../facility/firebase_auth.dart';
import '../../utilis/global.dart';
import '../component/bg_color_method.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.run(() {
      if (FireAuth.fireAuth.currentUser() == null) {
        Get.offAll(
          LoginScreen(),
          duration: Duration(milliseconds: 600),
          transition: Transition.fadeIn,
        );
      } else {
        Get.offAll(
          NavigationBarBild(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 600),
        );
      }
    });

    return Scaffold(
      body: bgColorMethod(
        method: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(appLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
