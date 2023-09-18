import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  //topic list
  List topic = [];

  //todo list
  List todo = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  //run this method if this is the first time ever opening the app
  void createInitialTopic() {
    topic = ['Add your first topic'];
  }

  //run this method if this is the first time ever opening the topic
  void createInitialTodo() {
    todo.add([
      ['Add your first to-do', false]
    ]);
  }

  //load the topic
  void loadTopic() {
    topic = _myBox.get("TOPIC");
  }

  //update the topic
  void updateTopic() {
    _myBox.put("TOPIC", topic);
  }

  //load the to do
  void loadTodo() {
    todo = _myBox.get("TODO");
  }

  //update the to do
  void updateTodo() {
    _myBox.put("TODO", todo);
  }
}
