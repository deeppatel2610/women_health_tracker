import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_health_tracker/screens/health%20question/health_question_2.dart';

import '../../facility/firebase_auth.dart';
import '../../facility/firebase_firestore_database.dart';
import '../../utilis/global.dart';
import '../component/bg_color_method.dart';
import '../component/yes_and_no_button_method.dart';

class HealthQuestion1 extends StatelessWidget {
  const HealthQuestion1({super.key});

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
                        "Have you experienced any recent headaches, dizziness, or difficulty concentrating?",
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
                            .qAnsAdd(
                              email: FireAuth.fireAuth.currentUser()!.email!,
                              ans: "yes",
                              keyName: "ans1",
                            );
                        Get.offAll(
                          HealthQuestion2(),
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
                            .qAnsAdd(
                              email: FireAuth.fireAuth.currentUser()!.email!,
                              ans: "no",
                              keyName: "ans1",
                            );
                        Get.offAll(
                          HealthQuestion2(),
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
                        image: AssetImage(imageQ1),
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
