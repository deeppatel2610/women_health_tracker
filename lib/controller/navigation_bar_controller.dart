import 'package:get/get.dart';

import '../screens/curved navigation bar/home_page.dart';
import '../screens/curved navigation bar/profile/profile_page.dart';

var navigationBarController = Get.put(NavigationBarController());

class NavigationBarController extends GetxController {
  var currentIndex = 0.obs;
  var pages = [HomePage(), ProfilePage()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
