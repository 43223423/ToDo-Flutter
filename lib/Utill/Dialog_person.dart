import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogPerson extends StatefulWidget {
  final Color corBackground;
  final Color codText;
  final Color corButton;

  DialogPerson({
    required this.corBackground,
    required this.corButton,
    required this.codText,
  });

  @override
  State<DialogPerson> createState() => _DialogPerson();
}

class _DialogPerson extends State<DialogPerson> {
  final Uri _uri = Uri.parse('https://www.linkedin.com/in/thiago-49213b24b/');

  void _launcher() async {
    if (!await launchUrl(_uri)) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: widget.corBackground,
      content: Container(
        height: 450,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bem-Vindo ao ToDo.',
              textAlign: TextAlign.center,
              style: TextStyle(color: widget.codText, fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'O aplicativo ToDo é uma ferramenta para organizar suas tarefas diárias, permitindo adicionar, marcar como concluídas e excluir tarefas com facilidade.',
              textAlign: TextAlign.center,
              style: TextStyle(color: widget.codText, fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 20.0),
            child: Text(
              'Made by: \n Thiago Henrique \n Email: thiagocontato1232@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(color: widget.codText, fontSize: 18.0),
            ),
          ),
          GestureDetector(
            onTap: _launcher,
            child: Text(
              'Linkedin: \n https://www.linkedin.com/in/thiago-49213b24b/',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.codText,
                  decoration: TextDecoration.underline,
                  fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: widget.corButton),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Voltar")),
          )
        ]),
      ),
    );
  }
}
