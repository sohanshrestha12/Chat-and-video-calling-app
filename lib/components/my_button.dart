import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String text;
  const MyButton({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
    );
  }
}
