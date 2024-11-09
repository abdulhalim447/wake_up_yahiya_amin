import 'package:flutter/material.dart';

class TimeManagementCard extends StatelessWidget {
  final int day;
  final int remainingTask;
  final int totalTasks;

  TimeManagementCard({required this.day, required this.remainingTask, required this.totalTasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start time"),
                  Text("6:00 am"),
                ],
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text('Day $day', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("End time"),
                  Text("8:00 am"),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Text( remainingTask == 0 ?
              "Task is completed":"Task is Not Completed",
              style: TextStyle(color: remainingTask == 0 ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Center(child: Text("Remaining task $remainingTask of $totalTasks")),
        ],
      ),
    );
  }
}
