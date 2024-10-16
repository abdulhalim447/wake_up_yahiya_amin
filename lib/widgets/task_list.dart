import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(taskName: 'Fajar Salat'),
        TaskItem(taskName: 'Quran Tilawat'),
        TaskItem(taskName: 'Meditation'),
        TaskItem(taskName: 'Exercise'),
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  final String taskName;

  TaskItem({required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(taskName),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
