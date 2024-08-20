import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  //? means it can accept null as well
  final String? hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 55,
        child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ))),
      ),
    );
  }
}
