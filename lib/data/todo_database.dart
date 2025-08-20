import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {

  List todoList = [];

  final _myBox = Hive.box("mybox");

  //Create default data when user launch app for the first time ever
  void createDefaultData() {
    todoList = [
    ["Study in Morning", false],
    ["Do the Cooking", false],
  ];
  }

  //Get the data from database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  //update the database on change of data
  void updateTodoData() {
    _myBox.put("TODOLIST", todoList);
  }

}