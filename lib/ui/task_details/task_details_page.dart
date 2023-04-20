import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: task.title,
          child: Text(task.title),
        ),
      ),
      body: Column(
        children: [
          Text(task.description),
        ],
      ),
    );
  }
}
