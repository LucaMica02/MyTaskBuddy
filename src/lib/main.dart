import 'package:flutter/material.dart';
import 'package:todo/data/topic_obj.dart';
import 'package:todo/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  // register the adapter for the Topic hive object
  Hive.registerAdapter(TopicAdapter()); // <-- this line right here

  //open a box
  var box = await Hive.openBox('myBox');

  //run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.deepPurple));
  }
}
