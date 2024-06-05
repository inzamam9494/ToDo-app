import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ToDoDataBase {
  List todoList = [];

  final _myBox = Hive.box('mybox');

  // run the method if this is the first time ever opening the app
  void createInitialData() {
    todoList = [
      ["Read Daily UI Article", Colors.amber],
      ["Course work", Colors.blue.shade200],
      ["Workout", Colors.pink.shade200],
      ["Grocery Shopping", Colors.greenAccent.shade200],
      ["Course Work", Colors.red.shade200],
    ];
  }

//   load the data from database
void loadData(){
    todoList = _myBox.get("TODOLIST");
}

// update the database
void updateDataBase(){
    _myBox.put("TODOLIST", todoList);
}

}
