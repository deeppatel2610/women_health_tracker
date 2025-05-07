import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_health_tracker/controller/update_controller.dart';
import 'package:women_health_tracker/model/user_model.dart';
import 'package:women_health_tracker/screens/component/bg_color_method.dart';
import 'package:women_health_tracker/utilis/global.dart';

import '../../../controller/auth_controller.dart';
import '../../../facility/firebase_auth.dart';
import '../../../facility/firebase_firestore_database.dart';
import '../../component/build_card_method.dart';
import '../../component/update_data.dart';
import '../../component/update_question_ans.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAC1C1),
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5),
        ),
      ),
      body: bgColorMethod(
        method: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: FirebaseFireStoreDatabase.fireStoreDatabase
                .readUserFireStore(
                  email: FireAuth.fireAuth.currentUser()!.email!,
                ),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                Map<String, Object?> data = snapshot.data!.data();
                UserModel json = UserModel.fromJson(data);
                updateController.updateUserName.value = json.userName!;
                updateController.updateName.value = json.name!;
                updateController.updateAns1.value = json.ans1!;
                updateController.updateAns2.value = json.ans2!;
                updateController.updateAns3.value = json.ans3!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(profile),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Information",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      /// TODO : update username
                      Obx(
                        () => buildCardMethod(
                          title: "Username",
                          subtitle: updateController.updateUserName.value,
                          onTap: () {
                            authController.updateController.clear();
                            showDialog(
                              context: context,
                              builder:
                                  (context) => Obx(
                                    () => UpdateData(
                                      title: "Update Username",
                                      keyName: "userName",
                                      hintText:
                                          updateController.updateUserName.value,
                                      notUpdateData: json.userName!,
                                    ),
                                  ),
                            );
                          },
                        ),
                      ),

                      /// TODO : update name
                      Obx(
                        () => buildCardMethod(
                          title: "Name",
                          subtitle: updateController.updateName.value,
                          onTap: () {
                            authController.updateController.clear();
                            showDialog(
                              context: context,
                              builder:
                                  (context) => UpdateData(
                                    title: "Update Name",
                                    keyName: "name",
                                    hintText: updateController.updateName.value,
                                    notUpdateData: json.name!,
                                  ),
                            );
                          },
                        ),
                      ),

                      /// TODO : update email but email is not update !
                      buildCardMethod(
                        title: "Email",
                        subtitle: json.email!,
                        onTap: () {
                          Get.snackbar("Sorry", "You can't update email!");
                        },
                      ),
                      buildCardMethod(
                        title: "Logout",
                        subtitle: json.email!,
                        onTap: () {
                          FireAuth.fireAuth.logout();
                          Get.offAllNamed("/");
                        },
                      ),

                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Health Problems",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),

                      /// TODO : update Q1
                      Obx(
                        () => buildCardMethod(
                          title:
                              "Have you experienced any recent headaches, dizziness, or difficulty concentrating?",
                          subtitle: updateController.updateAns1.value,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return updateAns(
                                  onTapNo: () async {
                                    updateController.updateAns1.value =
                                        json.ans1!;
                                    updateController.updateAns2.value =
                                        json.ans2!;
                                    updateController.updateAns3.value =
                                        json.ans3!;
                                    await FirebaseFireStoreDatabase
                                        .fireStoreDatabase
                                        .updateData(
                                          data: 'No😥, I am not feeling better',
                                          email:
                                              FireAuth.fireAuth
                                                  .currentUser()!
                                                  .email!,
                                          keyName: "ans1",
                                        );
                                    updateController.updateAns(
                                      ans1: 'No😥, I am not feeling better',
                                      ans2: json.ans2!,
                                      ans3: json.ans3!,
                                    );
                                    Navigator.pop(context);
                                  },
                                  onTapYes: () async {
                                    updateController.updateAns1.value =
                                        json.ans1!;
                                    updateController.updateAns2.value =
                                        json.ans2!;
                                    updateController.updateAns3.value =
                                        json.ans3!;
                                    await FirebaseFireStoreDatabase
                                        .fireStoreDatabase
                                        .updateData(
                                          data: 'Yes😊, I am feeling better',
                                          email:
                                              FireAuth.fireAuth
                                                  .currentUser()!
                                                  .email!,
                                          keyName: "ans1",
                                        );
                                    updateController.updateAns(
                                      ans1: 'Yes😊, I am feeling better',
                                      ans2: json.ans2!,
                                      ans3: json.ans3!,
                                    );
                                    Navigator.pop(context);
                                  },
                                  question:
                                      "Have you experienced any recent headaches, dizziness, or difficulty concentrating?",
                                );
                              },
                            );
                          },
                        ),
                      ),

                      /// TODO : update Q2
                      Obx(
                        () => buildCardMethod(
                          title:
                              "Do you ever feel chest pain, shortness of breath, or a rapid heartbeat while resting or during activity?",
                          subtitle: updateController.updateAns2.value,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return updateAns(
                                  onTapNo: () async {
                                    updateController.updateAns1.value =
                                        json.ans1!;
                                    updateController.updateAns2.value =
                                        json.ans2!;
                                    updateController.updateAns3.value =
                                        json.ans3!;
                                    await FirebaseFireStoreDatabase
                                        .fireStoreDatabase
                                        .updateData(
                                          data: 'No😥, I am not feeling better',
                                          email:
                                              FireAuth.fireAuth
                                                  .currentUser()!
                                                  .email!,
                                          keyName: "ans2",
                                        );
                                    updateController.updateAns(
                                      ans1: json.ans1!,
                                      ans2: 'No😥, I am not feeling better',
                                      ans3: json.ans3!,
                                    );
                                    Navigator.pop(context);
                                  },
                                  onTapYes: () async {
                                    updateController.updateAns1.value =
                                        json.ans1!;
                                    updateController.updateAns2.value =
                                        json.ans2!;
                                    updateController.updateAns3.value =
                                        json.ans3!;
                                    await FirebaseFireStoreDatabase
                                        .fireStoreDatabase
                                        .updateData(
                                          data: 'Yes😊, I am feeling better',
                                          email:
                                              FireAuth.fireAuth
                                                  .currentUser()!
                                                  .email!,
                                          keyName: "ans2",
                                        );
                                    updateController.updateAns(
                                      ans1: json.ans1!,
                                      ans2: 'Yes😊, I am feeling better',
                                      ans3: json.ans3!,
                                    );
                                    Navigator.pop(context);
                                  },
                                  question:
                                      "Do you ever feel chest pain, shortness of breath, or a rapid heartbeat while resting or during activity?",
                                );
                              },
                            );
                          },
                        ),
                      ),

                      /// TODO : update Q3
                      Obx(
                        () => buildCardMethod(
                          title:
                              "How is your overall energy level these days? Are you getting enough sleep, eating regularly, and staying active?",
                          subtitle: updateController.updateAns3.value,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return updateAns(
                                  onTapNo: () async {
                                    updateController.updateAns1.value =
                                        json.ans1!;
                                    updateController.updateAns2.value =
                                        json.ans2!;
                                    updateController.updateAns3.value =
                                        json.ans3!;
                                    await FirebaseFireStoreDatabase
                                        .fireStoreDatabase
                                        .updateData(
                                          data: 'No😥, I am not feeling better',
                                          email:
                                              FireAuth.fireAuth
                                                  .currentUser()!
                                                  .email!,
                                          keyName: "ans3",
                                        );
                                    updateController.updateAns(
                                      ans1: json.ans1!,
                                      ans2: json.ans2!,
                                      ans3: "No😥, I am not feeling better",
                                    );
                                    Navigator.pop(context);
                                  },
                                  onTapYes: () async {
                                    updateController.updateAns1.value =
                                        json.ans1!;
                                    updateController.updateAns2.value =
                                        json.ans2!;
                                    updateController.updateAns3.value =
                                        json.ans3!;
                                    await FirebaseFireStoreDatabase
                                        .fireStoreDatabase
                                        .updateData(
                                          data: 'Yes😊, I am feeling better',
                                          email:
                                              FireAuth.fireAuth
                                                  .currentUser()!
                                                  .email!,
                                          keyName: "ans3",
                                        );
                                    updateController.updateAns(
                                      ans1: json.ans1!,
                                      ans2: json.ans2!,
                                      ans3: 'Yes😊, I am feeling better',
                                    );
                                    Navigator.pop(context);
                                  },
                                  question:
                                      "How is your overall energy level these days? Are you getting enough sleep, eating regularly, and staying active?",
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
