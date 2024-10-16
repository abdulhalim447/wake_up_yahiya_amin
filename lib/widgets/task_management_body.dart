import 'package:flutter/material.dart';
import 'package:wake_up/widgets/slider.dart';
import 'time_management_card.dart';
import 'task_list.dart';
import 'video_section.dart';

class TaskManagementBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          HomeBannerSlider(),
          SizedBox(height: 20),
          TimeManagementCard(),
          SizedBox(height: 20),
          TaskList(),
          SizedBox(height: 20),
          VideoSection(),
        ],
      ),
    );
  }
}
