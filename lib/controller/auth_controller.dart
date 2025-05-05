import 'package:flutter/material.dart';
import 'package:get/get.dart';

var authController = Get.put(AuthController());

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
}
