import 'package:flutter/material.dart';

AlertDialog updateAns({
  required Function() onTapNo,
  required Function() onTapYes,
  required String question,
}) {
  return AlertDialog(
    backgroundColor: Color(0xFFEAC1C1),
    title: Text('Health Question'),
    content: Column(mainAxisSize: MainAxisSize.min, children: [Text(question)]),
    actions: <Widget>[
      TextButton(
        onPressed: onTapYes,
        child: Text('Yes😊, I am feeling better'),
      ),
      TextButton(
        onPressed: onTapNo,
        child: Text('No😥, I am not feeling better'),
      ),
    ],
  );
}
