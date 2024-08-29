import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/data/topic_obj.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class TopicPage extends StatefulWidget {
  Topic topic;
  Data db;

  TopicPage({required this.topic, required this.db});

  @override
  State<TopicPage> createState() => _TopicPage();
}

class _TopicPage extends State<TopicPage> {
  //text controller
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //checkbox function
  void checkBoxChanged(bool? value, int index) {
    if (index >= 0 && index < widget.topic.getTodo().length) {
      setState(() {
        widget.topic.getTodo()[index][1] = value ?? false;
      });
    }
    widget.db.updateTopic();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      widget.topic.addTodo([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    widget.db.updateTopic();
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
    widget.db.updateTopic();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      widget.topic.removeTodo(index);
    });
    widget.db.updateTopic();
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.topic.getName() + " To-Do";
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
            itemCount: widget.topic.getTodo().length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: widget.topic.getTodo()[index][0],
                taskComplete: widget.topic.getTodo()[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
