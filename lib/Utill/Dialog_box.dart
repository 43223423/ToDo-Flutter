import 'package:flutter/material.dart';
import 'package:projeto/Utill/Buttons.dart';

class DialogBox extends StatefulWidget {
  final controller;
  final Color corContainer;
  final Color corText;
  final Color corBox;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.corContainer,
      required this.corBox,
      required this.corText,
      required this.onSave});

  State<DialogBox> createState() => _DialogBox();
}

class _DialogBox extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 0,
        backgroundColor: widget.corContainer,
        content: Container(
          height: 180,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  maxLength: 23,
                  controller: widget.controller,
                  style: TextStyle(color: widget.corText),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        "Nome da tarefa",
                        style: TextStyle(color: widget.corText),
                      ),
                      hintText: "Insira o nome da tarefa"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: widget.corContainer),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: widget.corText),
                        ),
                        onPressed: widget.onCancel),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: widget.corContainer),
                        child: Text(
                          "Salvar",
                          style: TextStyle(color: widget.corText),
                        ),
                        onPressed: widget.onSave),
                  ],
                ),
              ]),
        ));
  }
}
