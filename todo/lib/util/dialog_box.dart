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
      backgroundColor: Colors.deepPurple,
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
              hintStyle:
                  TextStyle(color: Colors.white), // Colore del testo suggerito
              labelStyle: TextStyle(
                  color: Colors.white), // Colore del testo dell'etichetta
              counterStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),

          //center the button
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //save button
              MyButton(
                text: "Save",
                onPressed: onSave,
                buttonColor: Color.fromARGB(255, 145, 219, 34),
              ),

              const SizedBox(width: 8),

              //cancel button
              MyButton(
                text: "Cancel",
                onPressed: onCancel,
                buttonColor: Color.fromARGB(255, 217, 45, 45),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
