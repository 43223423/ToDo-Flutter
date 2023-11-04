import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto/Utill/ButtonColor.dart';
import 'package:projeto/Utill/Dialog_box.dart';
import 'package:projeto/Utill/Dialog_person.dart';
import 'package:projeto/Utill/Todo_title.dart';
import 'package:projeto/data/dataBase.dart';

TodoDataBase dbState = TodoDataBase();

List corList = [
  Colors.blue.shade200,
  Colors.blue.shade400,
  Colors.blue,
  Colors.white
];

class HomePageState extends StatefulWidget {
  Color corContainer = corList[0];

  Color corBox = corList[1];

  Color corNav = corList[2];

  Color corText = corList[3];

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageState> {
  // reference the hive box
  final _MyBox = Hive.box('MyBox');

  //text controller
  final _controller = TextEditingController();

  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if (_MyBox.get('TODOLIST') == null) {
      db.createInitialDate();
    } else {
      db.LoadData();
    }
  }

  // checkbox was tapped

  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task

  void SaveNewTask() {
    if (_controller.text.length >= 1) {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            corBox: corList[1],
            corContainer: corList[0],
            corText: corList[3],
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: SaveNewTask,
          );
        });
  }

  void dialogPerson() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogPerson(
          corBackground: corList[0],
          corButton: corList[1],
          codText: corList[3],
        );
      },
    );
  }

  // deleteTaks
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void MudarDeCor(
      Color corContainer, Color corBox, Color corNav, Color corText) {
    setState(() {
      corList[0] = corContainer;
      corList[1] = corBox;
      corList[2] = corNav;
      corList[3] = corText;
    });
  }

  Color corContainer = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corList[0],
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 15.0),
            child: FloatingActionButton(
              backgroundColor: corList[2],
              onPressed: dialogPerson,
              child: Icon(
                Icons.person,
                color: corList[3],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
            child: FloatingActionButton(
              backgroundColor: corList[2],
              onPressed: createNewTask,
              child: Icon(
                Icons.add,
                color: corList[3],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("ToDo", style: TextStyle(color: corList[3], fontSize: 14)),
        backgroundColor: corList[2],
        elevation: 0,
        actions: [
          ButtonColor(
            cor: Colors.black,
            onPressed: () {
              MudarDeCor(const Color.fromARGB(137, 73, 73, 73), Colors.black26,
                  Colors.black, Colors.white);
            },
          ),
          ButtonColor(
            cor: Colors.blue,
            onPressed: () {
              MudarDeCor(Colors.blue.shade200, Colors.blue.shade600,
                  Colors.blue, Colors.black);
            },
          ),
          ButtonColor(
            cor: Colors.green,
            onPressed: () {
              MudarDeCor(Colors.green.shade200, Colors.green.shade400,
                  Colors.green, Colors.black);
            },
          ),
          ButtonColor(
              cor: Colors.pink,
              onPressed: () {
                MudarDeCor(Colors.pink.shade200, Colors.pink.shade400,
                    Colors.pink, Colors.white);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
              corBack: corList[1],
              corText: corList[3],
              deleteFunction: (context) => deleteTask(index),
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChaged: (value) => CheckBoxChanged(value, index));
        },
      ),
    );
  }
}
