import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:women_health_tracker/screens/curved%20navigation%20bar/navigation_bar.dart';
import 'package:women_health_tracker/screens/curved%20navigation%20bar/home_page.dart';

import '../../facility/firebase_auth.dart';
import '../../facility/firebase_firestore_database.dart';
import '../../utilis/global.dart';
import '../component/bg_color_method.dart';
import '../component/yes_and_no_button_method.dart';

class HealthQuestion3 extends StatelessWidget {
  const HealthQuestion3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgColorMethod(
        method: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "How is your overall energy level these days? Are you getting enough sleep, eating regularly, and staying active?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    yesAndNoButtonMethod(
                      text: "Yes😊, I am feeling better",
                      onTap: () async {
                        await FirebaseFireStoreDatabase.fireStoreDatabase
                            .updateData(
                              email: FireAuth.fireAuth.currentUser()!.email!,
                              data: "Yes😊, I am feeling better",
                              keyName: "ans3",
                            );
                        Get.offAll(
                          NavigationBarBild(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 600),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    yesAndNoButtonMethod(
                      text: "No😥, I am not feeling better",
                      onTap: () async {
                        await FirebaseFireStoreDatabase.fireStoreDatabase
                            .updateData(
                              email: FireAuth.fireAuth.currentUser()!.email!,
                              data: "No😥, I am not feeling better",
                              keyName: "ans3",
                            );
                        Get.offAll(
                          NavigationBarBild(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 600),
                        );
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageQ3),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
