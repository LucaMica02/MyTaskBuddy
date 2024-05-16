import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/data/topic_obj.dart';
import 'package:todo/pages/topic_page.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/topic_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();

  //data
  Data db = Data();

  @override
  void initState() {
    db.initTopic();
    super.initState();
  }

  //save new task
  void saveNewTopic() {
    setState(() {
      db.topic.add(Topic(_controller.text));
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
    db.updateTopic();
  }

  //delete task
  void deleteTopic(int index) {
    setState(() {
      db.topic.removeAt(index);
    });
    db.updateTopic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 167, 199, 118),
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
            itemCount: db.topic.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicPage(
                        topic: db.topic[index],
                        db: db,
                      ),
                    ),
                  );
                },
                child: TopicTile(
                  topicName: db.topic[index].topicName,
                  deleteFunction: (context) => deleteTopic(index),
                ),
              );
            }));
  }
}
