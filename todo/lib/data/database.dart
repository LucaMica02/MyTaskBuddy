import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/topic_obj.dart';

class Data {
  //data
  List topic = [];

  //reference the box
  final _myBox = Hive.box('mybox');

  //init the topic
  void initTopic() {
    if (_myBox.get("TOPIC") != null) {
      topic = _myBox.get("TOPIC");
    } else {
      topic = [Topic("Add your first Topic")];
    }
  }

  //update the topic
  void updateTopic() {
    _myBox.put("TOPIC", topic);
  }
}
