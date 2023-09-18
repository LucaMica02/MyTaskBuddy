import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class TopicPage extends StatefulWidget {
  String topicName;
  int topicNumber;
  ToDoDataBase db;

  TopicPage(
      {required this.topicName, required this.topicNumber, required this.db});

  @override
  State<TopicPage> createState() => _TopicPage();
}

class _TopicPage extends State<TopicPage> {
  //reference the box
  final _myBox = Hive.box('mybox');

  //text controller
  final _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.containsKey("TODO")) {
      if (widget.topicNumber > (_myBox.get("TODO").length) - 1) {
        widget.db.createInitialTodo();
      } else {
        widget.db.loadTodo();
      }
    } else {
      widget.db.createInitialTodo();
    }
    super.initState();
  }

  //checkbox function
  void checkBoxChanged(bool? value, int index) {
    if (index >= 0 && index < widget.db.todo[widget.topicNumber].length) {
      setState(() {
        widget.db.todo[widget.topicNumber][index][1] = value ?? false;
      });
      widget.db.updateTodo();
    }
  }

  //save new task
  void saveNewTask() {
    setState(() {
      widget.db.todo[widget.topicNumber].add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    widget.db.updateTodo();
  }

  //new task function
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            text: "Add a new task",
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      widget.db.todo[widget.topicNumber].removeAt(index);
    });
    widget.db.updateTodo();
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.topicName + " To-Do";
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 190, 93),
        appBar: AppBar(
            title: Text(
          name,
          style: TextStyle(fontSize: 26, color: Colors.white),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: widget.db.todo[widget.topicNumber].length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: widget.db.todo[widget.topicNumber][index][0],
                taskComplete: widget.db.todo[widget.topicNumber][index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
