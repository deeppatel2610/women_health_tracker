import 'package:flutter/material.dart';
import 'package:women_health_tracker/controller/update_controller.dart';

import '../../controller/auth_controller.dart';
import '../../facility/firebase_auth.dart';
import '../../facility/firebase_firestore_database.dart';
import '../../model/user_model.dart';
import 'input_box_method.dart';

class UpdateData extends StatelessWidget {
  const UpdateData({
    super.key,
    required this.notUpdateData,
    required this.keyName,
    required this.title,
    required this.hintText,
  });

  final String notUpdateData;
  final String keyName;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFEAC1C1),
      title: Text(title),
      content: SizedBox(
        width: 700,
        child: inputBoxMethod(
          hintText: hintText,
          controller: authController.updateController,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await FirebaseFireStoreDatabase.fireStoreDatabase.updateData(
              keyName: keyName,
              email: FireAuth.fireAuth.currentUser()!.email!,
              data: authController.updateController.text,
            );
            updateController.updateDataController(
              authController.updateController.text,
              notUpdateData,
            );
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
