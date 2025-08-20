import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  String btnText;
  VoidCallback btnAction;

  MyButton({super.key, required this.btnText, required this.btnAction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: btnAction,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black
    ), 
    child: Text(
      btnText,
    ),);
  }
}