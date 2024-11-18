class TaskModel {
  final int taskId;
  bool isDone;
  String? comment;
  String name;
  String status;

  TaskModel({required this.taskId, this.isDone = false, this.comment, this.status = '',required this.name});

  // Method to convert Task object to JSON format
  Map<String, dynamic> toJson() {
    return {
      "task_id": taskId,
      "is_done": isDone,
      "comment": comment,
      "name": comment,
    };
  }

  // Method to create Task object from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['task_id'],
      isDone: json['is_done'] ?? false,
      comment: json['comment'],
      name: json['name'],
    );
  }
}
