import 'package:flutter/material.dart';
import 'package:wake_up/widgets/slider.dart';
import 'package:wake_up/widgets/task_list.dart';
import 'package:wake_up/widgets/time_management_card.dart';
import 'package:wake_up/widgets/video_section.dart';

import '../screens/dashboard_model/DashboardData.dart';
import '../screens/dashboard_model/fetchDashboardData.dart';

class TaskManagementBody extends StatefulWidget {
  @override
  _TaskManagementBodyState createState() => _TaskManagementBodyState();
}

class _TaskManagementBodyState extends State<TaskManagementBody> {
  DashboardData? dashboardData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    dashboardData = await fetchDashboardData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          HomeBannerSlider(),
          SizedBox(height: 20),
          TimeManagementCard(day: dashboardData!.day, remainingTask: dashboardData!.remainingTask, totalTasks: dashboardData!.totalTasks),
          SizedBox(height: 20),
          TaskList(tasks: dashboardData!.tasks),
          SizedBox(height: 20),
          VideoSection(videoUrl: dashboardData!.video),
        ],
      ),
    );
  }
}
