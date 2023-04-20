import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo_app/ui/add_task/add_task_page.dart';
import 'package:simple_todo_app/ui/task_details/task_details_page.dart';

import '../../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Tasks Demo'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            onTap: () {
              _openTaskDetailsPage(task);
            },
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              task.description,
              style: TextStyle(
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                _changeTaskStatus(task, value!);
              },
            ),
            leading: CircleAvatar(child: Text('${index + 1}')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskPage,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openAddTaskPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskPage(),
      ),
    );
    if (result != null) {
      setState(() {
        _tasks.add(result as Task);
      });
    }
  }

  void _openTaskDetailsPage(Task task) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskDetailsPage(
          task: task,
        ),
      ),
    );
  }

  _changeTaskStatus(Task task, bool value) {
    setState(() {
      task.isCompleted = value;
    });
  }
}
