import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation_bar_controller.dart';

class NavigationBarBild extends StatelessWidget {
  const NavigationBarBild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3D6D6),
      body: Obx(
        () =>
            navigationBarController.pages[navigationBarController
                .currentIndex
                .value],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: navigationBarController.currentIndex.value,
        color: Colors.pinkAccent.shade200,
        onTap: (value) {
          navigationBarController.changePage(value);
        },
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
