import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];

  final _MyBox = Hive.box("MyBox");

  void createInitialDate() {
    toDoList = [
      ['Bem-Vindo!!', false],
      ['Welcome!!', false],
    ];
  }

  void LoadData() {
    toDoList = _MyBox.get('TODOLIST');
  }

  void updateDataBase() {
    _MyBox.put('TODOLIST', toDoList);
  }
}
