// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:women_health_tracker/screens/auth%20page/login_page.dart';
//
// import '../../utilis/global.dart';
// import '../component/bg_color_method.dart';
//
// class FlashScreen extends StatelessWidget {
//   const FlashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryHeight = MediaQuery.of(context).size.height;
//     mediaQueryWidth = MediaQuery.of(context).size.width;
//
//     Timer.periodic(Duration(seconds: 5), (timer) {
//       Get.offAll(
//         LoginPage(),
//         duration: Duration(milliseconds: 600),
//         transition: Transition.fadeIn,
//       );
//     });
//
//     return Scaffold(
//       body: bgColorMethod(
//         method: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: mediaQueryHeight! / 3,
//               width: mediaQueryWidth! / 1.5,
//               decoration: BoxDecoration(
//                 // color: Colors.black,
//                 image: DecorationImage(
//                   image: AssetImage(logo),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
