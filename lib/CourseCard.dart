import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseCode;
  final String courseTitle;
  final String courseYear;
  final String courseLevel;

  CourseCard({
    required this.courseCode,
    required this.courseTitle,
    required this.courseYear,
    required this.courseLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Code: $courseCode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Course Title: $courseTitle',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8.0),
            Text(
              'Course Year: $courseYear',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8.0),
            Text(
              'Course Level: $courseLevel',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
