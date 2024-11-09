class TaskModel {
  final int taskId;
  bool isDone;
  String? comment;

  TaskModel({required this.taskId, this.isDone = false, this.comment});

  // Method to convert Task object to JSON format
  Map<String, dynamic> toJson() {
    return {
      "task_id": taskId,
      "is_done": isDone,
      "comment": comment,
    };
  }

  // Method to create Task object from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['task_id'],
      isDone: json['is_done'] ?? false,
      comment: json['comment'],
    );
  }
}
