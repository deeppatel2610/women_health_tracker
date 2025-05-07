import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_health_tracker/screens/auth%20page/login_page.dart';
import 'package:women_health_tracker/screens/curved%20navigation%20bar/navigation_bar.dart';
import 'package:women_health_tracker/screens/flash%20page/flash_screen.dart';
import 'package:women_health_tracker/screens/health%20question/health_question.dart';
import 'package:women_health_tracker/screens/curved%20navigation%20bar/home_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: "/", page: () => FlashScreen())],
    );
  }
}
