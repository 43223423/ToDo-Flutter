// import 'package:flutter/material.dart';
// import 'package:projeto/Utill/ButtonColor.dart';
// import 'package:projeto/Todo.dart';
// import 'package:projeto/Utill/ChangeColor.dart';
// import 'package:projeto/data/dataBase.dart';

// class AlertColors extends StatefulWidget {
// Color corteste = Colors.yellow;



//   State<AlertColors> createState() => _AlertColors();
// }

// class _AlertColors extends State<AlertColors> {
//   ColorChanger colorChanger = ColorChanger();

//   void _Teste(Color cor) {
    
//      TodoDataBase().listColors = Colors.black;
    
//   }

  

//     void MudarDeCor(Color cor) {
//     setState(() {
//       widget.corteste = cor;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: widget.corteste,
//       content: Container(
//         height: 500,
//         child:
//             Padding(
//               padding: EdgeInsets.only(top: 40.0),
//               child: ElevatedButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: Text("Voltar")),
//             )
          
//         ),
//       ),
//     );
//   }
// }
