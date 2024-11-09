import 'package:flutter/material.dart';
import 'package:wake_up/screens/dashboard_model/task_model.dart';
import '../screens/dashboard_model/TaskService.dart';
import 'TaskItem.dart';
import '../screens/dashboard_model/DashboardData.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final TaskService taskService = TaskService();

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks.map((task) {
        // Convert Task to TaskModel
        TaskModel taskModel = TaskModel(
          taskId: task.id,
          isDone: false,  // Assuming tasks are not done initially
        );
        return TaskItem(task: taskModel, taskService: taskService);
      }).toList(),
    );
  }
}
