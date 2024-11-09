



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_up/screens/dashboard_model/DashboardData.dart';

import '../screens/dashboard_model/TaskService.dart';
import '../screens/dashboard_model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final TaskService taskService;

  TaskItem({required this.task, required this.taskService});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Task ID: ${task.taskId}'), // Using taskId
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () => _handleTaskDone(),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () => _dialogBuilder(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleTaskDone() async {
    task.isDone = true; // Using isDone
    await taskService.updateTask(task);
  }

  Future<void> _handleTaskUndone(String comment) async {
    task.isDone = false; // Using isDone
    task.comment = comment; // Using comment
    await taskService.updateTask(task);
  }

  Future<void> _dialogBuilder(BuildContext context) async {
    final TextEditingController commentController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Why Miss Your Task?'),
          content: TextFormField(
            controller: commentController,
            decoration: InputDecoration(labelText: "Comments"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                _handleTaskUndone(commentController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
