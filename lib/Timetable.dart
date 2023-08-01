// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// List<StudySession> postFromJson(String str)=>
//     List<StudySession>.from(json.decode(str).map((x)=>StudySession.fromMap(x)));
//
// class StudySession {
//   final String date;
//   final String time;
//   final String title;
//   final String venue;
//
//   StudySession({
//     required this.date,
//     required this.time,
//     required this.title,
//     required this.venue});
// }
//
// // Widget for displaying the timetable
// class Timetable extends StatelessWidget {
//   Timetable({Key? key}) : super(key: key);
//
//   final List<StudySession> timetableList=[
//     StudySession(
//         date: '12-07-2023',
//         time: '20:30:50',
//         title: 'Kiswahili',
//         venue: 'Clr5'
//     ),
//     StudySession(
//         date: '11-07-2023',
//         time: '10:30:50',
//         title: 'English',
//         venue: 'Clr4'
//     ),
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Timetable',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Timetable'),
//         ),
//         body: ListView.builder(
//           itemCount: timetableList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               color: Colors.lightBlueAccent,
//               child:Card(
//                 elevation: 10,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Timetable',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         timetableList[index].date,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         timetableList[index].time,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         timetableList[index].title,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         timetableList[index].venue,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       // Add any additional widgets or buttons here
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//
// }
//
//

import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:animated_text_kit/animated_text_kit.dart';



List<StudySession> postFromJson(String str) =>
    List<StudySession>.from(json.decode(str).map((x) => StudySession.fromMap(x)));

class StudySession {
  StudySession(
      {
        required this.ttDate,
        required this.ttTime,
        required this.ttTitle,
        required this.ttVenue});

  // int userId;

  String ttDate;
  String ttTime;
  String ttTitle;
  String ttVenue;

  factory StudySession.fromMap(Map<String, dynamic> json) => StudySession(
    // userId: json["userId"],

    ttDate: json["ttDate"],
    ttTime: json["ttTime"],
    ttTitle: json["ttTitle"],
    ttVenue: json["ttVenue"],
  );
}

Future<List<StudySession>> fetchPost() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.227:8085/timetable/getTimetables'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<StudySession>((json) => StudySession.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Timetable extends StatefulWidget {
  const Timetable ({Key? key, required String ttDate, required String ttTime, required String ttTitle, required String ttVenue}) : super(key: key);

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  late Future<List<StudySession>> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Timetable'),
      ),
      body: FutureBuilder<List<StudySession>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xff97FFFF),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // iwe sawa na databasename mfano coursename attribute
                        "${snapshot.data![index].ttDate}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.location_on),
                      Text("TIMETABLE:${snapshot.data![index].ttTime}"),
                      SizedBox(height: 10),
                      Icon(Icons.punch_clock),
                      Text("TIMETABLE:${snapshot.data![index].ttTitle}"),
                      SizedBox(height: 10),
                      Text("TIMETABLE:${snapshot.data![index].ttVenue}"),



                      // TextButton(
                      //   onPressed: (){
                      //       Navigator.push(context, Course)
                      //   }
                      //
                      //
                      //   child: AnimatedTextKit(
                      //     animatedTexts: [
                      //       TypewriterAnimatedText('Click here for Course',
                      //           textStyle: const TextStyle(
                      //             color: Colors.red,
                      //             fontSize: 30,
                      //             fontStyle: FontStyle.italic,
                      //             fontFamily: 'Times New Roman',
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //           speed: const Duration(
                      //             milliseconds: 450,
                      //           )),
                      //     ],
                      //     // onTap: (() {
                      //     //   Navigator.pushNamed(
                      //     //     context,
                      //     //     MyRoutes.hosp24,
                      //     //   );
                      //     // }),
                      //     isRepeatingAnimation: true,
                      //     totalRepeatCount: 2,
                      //   ),
                      //   // onPressed: (() {
                      //   //   Navigator.pushNamed(
                      //   //     context,
                      //   //     MyRoutes.hosp24,
                      //   //   );
                      //   // }),
                      // )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
