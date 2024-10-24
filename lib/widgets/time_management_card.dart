import 'package:flutter/material.dart';

class TimeManagementCard extends StatelessWidget {
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

              // Start time  ===================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start time"),
                  Text("6:00 am"),
                ],
              ),
              // day 1================================
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all( // Adding border
                    color: Colors.red, // Border color
                    width: 2, // Border width
                  ),
                ),

                child: Center(
                  child: Text('Day 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.green),),
                ),
              ),

              // end time  ======================================
              
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
            child: Text(
              "Task is completed",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Center(child: Text("Remaining task 2 of 3")),
        ],
      ),
    );
  }
}
