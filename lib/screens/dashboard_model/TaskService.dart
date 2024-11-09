

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wake_up/screens/dashboard_model/task_model.dart';


class TaskService {
  final String apiUrl = "https://yahiyaamin.xyz/api/task/store";

  Future<void> updateTask(TaskModel task) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(task.toJson()),
      );

      if (response.statusCode == 200) {
        print('Task updated successfully');
      } else {
        print('Failed to update task. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
