import 'package:flutter/material.dart';

import '../../utilis/global.dart';

Container bgColorMethod({required Widget method}) {
  return Container(
    width: mediaQueryWidth,
    height: mediaQueryHeight,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFEAC1C1), Color(0xFFF3D6D6)],
      ),
    ),
    child: method,
  );
}
