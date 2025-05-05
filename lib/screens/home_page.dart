import 'package:flutter/material.dart';
import 'package:women_health_tracker/screens/component/bg_color_method.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: Color(0xFFEAC1C1),
      ),
      body: bgColorMethod(
        method: SizedBox(height: double.infinity, width: double.infinity),
      ),
    );
  }
}
