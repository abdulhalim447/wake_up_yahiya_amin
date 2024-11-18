import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashboard_model/TaskService.dart';
import '../screens/dashboard_model/task_model.dart';

class TaskItem extends StatefulWidget {
  final TaskModel task;
  final TaskService taskService;

  const TaskItem({required this.task, required this.taskService, Key? key}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isCompleted = false;
  bool isCancelled = false;

  // Keys for SharedPreferences
  static const String statusKeySuffix = '_status';
  static const String timestampKeySuffix = '_timestamp';

  @override
  void initState() {
    super.initState();
    _loadStatus(); // Load saved status when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        color: isCompleted
            ? Colors.green.withOpacity(0.8)
            : isCancelled
            ? Colors.red.withOpacity(0.8)
            : Colors.white,
        child: ListTile(
          title: Text(
            isCompleted ? 'Task Completed' : ': ${widget.task.name}',
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () => _handleTaskStatusUpdate(isComplete: true),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () => _showCancelDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handle task completion or cancellation
  Future<void> _handleTaskStatusUpdate({required bool isComplete, String? comment}) async {
    try {
      setState(() {
        isCompleted = isComplete;
        isCancelled = !isComplete;
      });

      widget.task.status = isComplete ? 'Complete' : 'Cancelled';
      widget.task.isDone = isComplete;
      widget.task.comment = comment;
      await widget.taskService.updateTask(widget.task);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('${widget.task.taskId}$statusKeySuffix', widget.task.status);
      await prefs.setInt('${widget.task.taskId}$timestampKeySuffix', DateTime.now().millisecondsSinceEpoch);

      // Show feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isComplete ? 'Task marked as complete!' : 'Task cancelled.'),
        duration: const Duration(seconds: 2),
      ));
    } catch (error) {
      debugPrint('Error in updating task status: $error');
    }
  }

  // Load task status from SharedPreferences
  Future<void> _loadStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? status = prefs.getString('${widget.task.taskId}$statusKeySuffix');
      int? timestamp = prefs.getInt('${widget.task.taskId}$timestampKeySuffix');

      if (status != null && timestamp != null) {
        int currentTime = DateTime.now().millisecondsSinceEpoch;
        int twelveHoursInMilliseconds = 12 * 60 * 60 * 1000;

        // Validate timestamp and update UI
        if ((currentTime - timestamp) < twelveHoursInMilliseconds) {
          setState(() {
            isCompleted = (status == 'Complete');
            isCancelled = (status == 'Cancelled');
          });
        } else {
          _clearSavedStatus(prefs);
        }
      }
    } catch (error) {
      debugPrint('Error in loading task status: $error');
    }
  }

  // Clear status if expired
  Future<void> _clearSavedStatus(SharedPreferences prefs) async {
    await prefs.remove('${widget.task.taskId}$statusKeySuffix');
    await prefs.remove('${widget.task.taskId}$timestampKeySuffix');
  }

  // Show dialog to handle task cancellation
  Future<void> _showCancelDialog(BuildContext context) async {
    final TextEditingController commentController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Task'),
          content: TextFormField(
            controller: commentController,
            decoration: const InputDecoration(labelText: 'Reason for cancellation'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  _handleTaskStatusUpdate(isComplete: false, comment: commentController.text);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please provide a reason for cancellation.')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
