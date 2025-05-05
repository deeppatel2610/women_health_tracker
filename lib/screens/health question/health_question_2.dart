import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_health_tracker/screens/health%20question/health_question_3.dart';

import '../../facility/firebase_auth.dart';
import '../../facility/firebase_firestore_database.dart';
import '../../utilis/global.dart';
import '../component/bg_color_method.dart';
import '../component/yes_and_no_button_method.dart';

class HealthQuestion2 extends StatelessWidget {
  const HealthQuestion2({super.key});

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
                        "Do you ever feel chest pain, shortness of breath, or a rapid heartbeat while resting or during activity?",
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
                              keyName: "ans2",
                            );
                        Get.offAll(
                          HealthQuestion3(),
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
                              keyName: "ans2",
                            );
                        Get.offAll(
                          HealthQuestion3(),
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
                        image: AssetImage(imageQ2),
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
