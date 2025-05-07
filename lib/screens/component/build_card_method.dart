import 'package:flutter/material.dart';

Widget buildCardMethod({
  required String title,
  required String subtitle,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.pink.shade50,
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    ),
  );
}
