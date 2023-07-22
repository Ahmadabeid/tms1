import 'package:flutter/material.dart';

class StudySession {
  final String date;
  final String time;
  final String title;
  final String venue;

  StudySession({
    required this.date,
    required this.time,
    required this.title,
    required this.venue});
}

// Widget for displaying the timetable
class Timetable extends StatelessWidget {
  Timetable({Key? key}) : super(key: key);

  final List<StudySession> timetableList=[
    StudySession(
        date: '12-07-2023',
        time: '20:30:50',
        title: 'Kiswahili',
        venue: 'Clr5'
    ),
    StudySession(
        date: '11-07-2023',
        time: '10:30:50',
        title: 'English',
        venue: 'Clr4'
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Timetable'),
        ),
        body: ListView.builder(
          itemCount: timetableList.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.lightBlueAccent,
              child:Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Timetable',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        timetableList[index].date,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        timetableList[index].time,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        timetableList[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        timetableList[index].venue,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Add any additional widgets or buttons here
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}


