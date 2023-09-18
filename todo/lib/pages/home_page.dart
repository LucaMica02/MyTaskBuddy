import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/pages/topic_page.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/topic_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box('mybox');

  //text controller
  final _controller = TextEditingController();

  //Database
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TOPIC") == null) {
      db.createInitialTopic();
    } else {
      db.loadTopic();
    }
    super.initState();
  }

  //save new task
  void saveNewTopic() {
    setState(() {
      db.topic.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateTopic();
  }

  //new topic function
  void createNewTopic() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            text: "Add a new topic",
            controller: _controller,
            onSave: saveNewTopic,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTopic(int index) {
    setState(() {
      db.topic.removeAt(index);
      db.todo.removeAt(index);
    });
    db.updateTopic();
  }

  @override
  Widget build(BuildContext context) {
    List topic = db.topic;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 190, 93),
        appBar: AppBar(
            title: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Topic",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTopic,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: topic.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicPage(
                        topicName: topic[index],
                        topicNumber: index,
                        db: db,
                      ),
                    ),
                  );
                },
                child: TopicTile(
                  topicName: topic[index],
                  deleteFunction: (context) => deleteTopic(index),
                ),
              );
            }));
  }
}
