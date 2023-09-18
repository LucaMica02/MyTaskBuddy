import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  String text;
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.text,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange,
      content: Container(
        height: 150,
        width: 300,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //get user input
          TextField(
            maxLength: 20,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: text,
            ),
          ),

          //center the button
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //save button
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 8),

              //cancel button
              MyButton(text: "Cancel", onPressed: onCancel)
            ],
          ))
        ]),
      ),
    );
  }
}
