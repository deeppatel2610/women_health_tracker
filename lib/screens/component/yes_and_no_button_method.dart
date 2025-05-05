import 'package:flutter/material.dart';

GestureDetector yesAndNoButtonMethod({required String text,required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
