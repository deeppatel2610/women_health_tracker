import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../facility/firebase_auth.dart';
import '../../utilis/global.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(logo),
                  fit: BoxFit.cover,
                ),
                color: Color(0xFFF8D7E3),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade800,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      "Name",
                      false,
                      txtController: authController.nameController,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      "Username",
                      false,
                      txtController: authController.usernameController,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      "Email",
                      false,
                      txtController: authController.emailController,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      "Password",
                      true,
                      txtController: authController.passwordController,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          String data = await FireAuth.fireAuth.createUser(
                            email: authController.emailController.text,
                            password: authController.passwordController.text,
                          );
                          if (data == "error") {
                            Get.snackbar(
                              "Error",
                              "This email is already in use",
                            );
                          } else {
                            Get.offAll(
                              LoginScreen(),
                              transition: Transition.fadeIn,
                              duration: Duration(milliseconds: 800),
                            );
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
                        child: Text('Sign Up'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Get.offAll(
                          LoginScreen(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 800),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, bool obscure, {required txtController}) {
    return TextField(
      obscureText: obscure,
      controller: txtController,
      decoration: InputDecoration(
        labelText: hint,
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
