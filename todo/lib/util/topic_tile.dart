import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TopicTile extends StatelessWidget {
  final String topicName;
  Function(BuildContext)? deleteFunction;

  TopicTile({super.key, required this.topicName, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Text(topicName,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
