import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_health_tracker/facility/firebase_auth.dart';
import 'package:women_health_tracker/facility/firebase_firestore_database.dart';
import 'package:women_health_tracker/model/user_model.dart';
import 'package:women_health_tracker/screens/auth%20page/sign_up_page.dart';
import 'package:women_health_tracker/screens/health%20question/health_question.dart';
import 'package:women_health_tracker/utilis/global.dart';
import '../../controller/auth_controller.dart';
import '../../facility/google_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(logo)),
              color: Color(0xFFF8D7E3),
              // Light rose card
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                colors: [Color(0xFFEAC1C1), Color(0xFFF3D6D6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Women’s Health Tracker',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: authController.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          /// todo : login
                          //////////////////////////////////////////// hal aiya kam baki che to tem tare kar va nu che ke TODO username
                          String data = await FireAuth.fireAuth.loginUser(
                            email: authController.emailController.text,
                            password: authController.passwordController.text,
                          );
                          if (data == "error") {
                            Get.snackbar(
                              "error.....!",
                              "email and password is incorrect!",
                            );
                          } else {
                            User? user = FireAuth.fireAuth.currentUser();
                            if (user != null) {
                              UserModel users = UserModel(
                                userName:
                                    (authController.usernameController.text ==
                                            "")
                                        ? "deep2607"
                                        : authController
                                            .usernameController
                                            .text,
                                name:
                                    (authController.nameController.text == "")
                                        ? "patel"
                                        : authController.nameController.text,
                                email: user.email,
                                ans1: "",
                                ans2: "",
                                ans3: "",
                              );
                              await FirebaseFireStoreDatabase.fireStoreDatabase
                                  .addUser(users);
                              authController.emailController.clear();
                              authController.passwordController.clear();
                              authController.nameController.clear();
                              authController.usernameController.clear();
                              Get.offAll(
                                const HealthQuestion1(),
                                duration: const Duration(milliseconds: 600),
                                transition: Transition.fadeIn,
                              );
                            } else {
                              Get.snackbar("error", user!.toString());
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: Colors.deepPurple,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          /// todo : google auth
                          await GoogleAuth.googleAuth.signInWithGoogle();
                          User? user = FireAuth.fireAuth.currentUser();
                          print(
                            "deep .....................................................",
                          );
                          if (user != null) {
                            print(
                              "deep .....................................................deppppppppppppppppppppppppppppppppppppp",
                            );
                            UserModel users = UserModel(
                              userName: user.email,
                              name: user.displayName,
                              email: user.email,
                              ans1: "",
                              ans2: "",
                              ans3: "",
                            );
                            await FirebaseFireStoreDatabase.fireStoreDatabase
                                .addUser(users);
                            Get.offAll(
                              const HealthQuestion1(),
                              duration: const Duration(milliseconds: 600),
                              transition: Transition.fadeIn,
                            );
                          } else {
                            Get.snackbar("error", user!.toString());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: Colors.deepPurple,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        child: Text('Google Login'),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Get.offAll(
                          SignUpPage(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 700),
                        );
                      },
                      child: Text("Not a Member? Sign"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
