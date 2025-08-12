import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final bool obscureText;

  const CustomTextField({super.key, required this.controller, required this.labeltext,this.obscureText = false, });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labeltext),
      ),
      obscureText: obscureText ,
    );
  }
}