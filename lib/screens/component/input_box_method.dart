import 'package:flutter/material.dart';

Card inputBoxMethod({required String hintText, required controller}) {
  return Card(
    color: Colors.pink.shade50,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black54),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
