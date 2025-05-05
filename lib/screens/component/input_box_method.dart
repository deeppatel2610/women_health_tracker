import 'package:flutter/material.dart';

Card inputBoxMethod({required String hintText}) {
  return Card(
    color: Colors.blue.shade200,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
