import 'package:flutter/material.dart';
import 'package:todo_application/util/my_button.dart';

class CreateTaskDialog extends StatelessWidget {

  final TextEditingController? controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  CreateTaskDialog({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Input field
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "create new task",
                border: OutlineInputBorder(),
              ),
            ),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //cancel button
                MyButton(btnText: "Cancel", btnAction: onCancel),

                //Space between 2 buttons
                SizedBox(width: 8),

                //save button
                MyButton(btnText: "Create", btnAction: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
