import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePages extends StatelessWidget {
  HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MyApp")),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(child: Text("Welcome to My App")),
    );
  }
}