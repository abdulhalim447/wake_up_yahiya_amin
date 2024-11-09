class Task {
  final int id;
  final String name;

  Task({required this.id, required this.name});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
    );
  }
}

class DashboardData {
  final int day;
  final int remainingTask;
  final String video;
  final List<Task> tasks;
  final int totalTasks;
  final List<dynamic> taskDone;
  final List<dynamic> taskNotDone;

  DashboardData({
    required this.day,
    required this.remainingTask,
    required this.video,
    required this.tasks,
    required this.totalTasks,
    required this.taskDone,
    required this.taskNotDone,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    var tasksList = json['task'] as List;
    List<Task> tasks = tasksList.map((task) => Task.fromJson(task)).toList();

    return DashboardData(
      day: json['day'],
      remainingTask: json['remaining_task'],
      video: json['video'],
      tasks: tasks,
      totalTasks: json['totalTasks'],
      taskDone: json['taskDone'],
      taskNotDone: json['taskNotDone'],
    );
  }
}
