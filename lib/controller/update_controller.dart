import 'package:get/get.dart';

var updateController = Get.put(UpdateController());

class UpdateController extends GetxController {
  RxString updateUserName = "".obs;
  RxString updateName = "".obs;
  RxString updateAns1 = "".obs;
  RxString updateAns2 = "".obs;
  RxString updateAns3 = "".obs;

  void updateDataController(String username, String name) {
    updateUserName.value = username;
    updateName.value = name;
  }

  void updateAns({
    required String ans1,
    required String ans2,
    required String ans3,
  }) {
    updateAns1.value = ans1;
    updateAns2.value = ans2;
    updateAns3.value = ans3;
  }
}
