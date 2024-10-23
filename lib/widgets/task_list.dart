import 'package:flutter/material.dart';
import 'package:wake_up/utils/utility.dart';

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
              onPressed: () {
                _dialogBuilder(context);
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.message, color: Colors.blue),
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Why Miss Your Task ?'),
          content: TextFormField(
            decoration: AppInputDecoration("Comments"),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
