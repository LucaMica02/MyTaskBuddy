import 'package:hive_flutter/hive_flutter.dart';
part 'topic_obj.g.dart';

@HiveType(typeId: 1) //          <-- this is a hive object
class Topic extends HiveObject {
  @HiveField(0) //          <-- hive field
  String topicName;

  @HiveField(1) //          <-- hive field
  List<List<dynamic>> todo = [
    ["Add your first To-Do", false]
  ];

  Topic(this.topicName);

  void addTodo(List todoList) {
    todo.add(todoList);
  }

  void removeTodo(int index) {
    todo.removeAt(index);
  }

  String getName() {
    return topicName;
  }

  List getTodo() {
    return todo;
  }
}
