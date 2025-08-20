import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_application/data/todo_database.dart';
import 'package:todo_application/util/create_task_dialog.dart';
import 'package:todo_application/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Reference to hive box
  final _myBox = Hive.box("mybox");
  TodoDatabase db = TodoDatabase();

  final _controller = TextEditingController();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //Checkbox clicked
  void onCheckBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value;
    });
  }

  //Update new task
  void updateNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });

    db.updateTodoData();

    Navigator.of(context).pop();
  }

  //Delete Task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });

    db.updateTodoData();
  }

  //Dialogbox
  void createTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CreateTaskDialog(
          controller: _controller,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onSave: updateNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      //App bar
      appBar: AppBar(
        title: Center(child: Text("To do")),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
      ),

      // Todo list UI
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            isTaskCompleted: db.todoList[index][1],
            onChanged: (value) => {onCheckBoxChanged(value, index)},
            onDelete: (context) => {
              deleteTask(index)
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createTaskDialog,
        child: Icon(Icons.add),
        shape: OvalBorder(),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
