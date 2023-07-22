// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(Course());
//
// class CourseData {
//   final String code;
//   final String title;
//   final String year;
//   final String level;
//
//   const CourseData({
//     required this.code,
//     required this.title,
//     required this.year,
//     required this.level,
//   });
// }
//
// class Course extends StatelessWidget {
//   Course({Key? key}) : super(key: key);
//
//   final List<CourseData> courseList = [
//     CourseData(
//       code: 'CSE101',
//       title: 'Introduction to Computer Science',
//       year: '2023',
//       level: 'Beginner',
//     ),
//     CourseData(
//       code: 'MTH201',
//       title: 'Linear Algebra',
//       year: '2023',
//       level: 'Intermediate',
//     ),
//     CourseData(
//       code: 'MTH201',
//       title: 'Linear Algebra',
//       year: '2023',
//       level: 'Intermediate',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Course',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Course'),
//         ),
//         body: ListView.builder(
//           itemCount: courseList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               color: Colors.lightBlueAccent,
//               child:Card(
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Course',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       courseList[index].code,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       courseList[index].title,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       courseList[index].year,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       courseList[index].level,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     // Add any additional widgets or buttons here
//                   ],
//                 ),
//               ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, avoid_print, camel_case_types, unnecessary_string_interpolations, avoid_unnecessary_containers, sort_child_properties_last
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';



List<Course> postFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromMap(x)));

class Course {
  Course(
      {
        // required this.userId,

        required this.courseCode,
        required this.courseTitle,
        required this.courseYear,
        required this.courseLevel});

  // int userId;

  String courseCode;
  String courseTitle;
  String courseYear;
  String courseLevel;

  factory Course.fromMap(Map<String, dynamic> json) => Course(
    // userId: json["userId"],

    courseCode: json["courseCode"],
    courseTitle: json["courseTitle"],
    courseYear: json["courseYear"],
    courseLevel: json["courseLevel"],
  );
}

Future<List<Course>> fetchPost() async {
  final response = await http
      .get(Uri.parse('http://172.22.16.1:8085/course/getCourses'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Course>((json) => Course.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Courses extends StatefulWidget {
  const Courses ({Key? key, required String courseCode, required String courseTitle, required String courseYear, required String courseLevel}) : super(key: key);

  @override
  State<Courses> createState() => _CourseState();
}

class _CourseState extends State<Courses> {
  late Future<List<Course>> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Course'),
      ),
      body: FutureBuilder<List<Course>>(
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
                        "${snapshot.data![index].courseCode}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.location_on),
                      Text("COURSE:${snapshot.data![index].courseTitle}"),
                      SizedBox(height: 10),
                      Icon(Icons.punch_clock),
                      Text("COURSE:${snapshot.data![index].courseYear}"),
                      SizedBox(height: 10),
                      Text("COURSE:${snapshot.data![index].courseLevel}"),



                      TextButton(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('Click here for Course',
                                textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500,
                                ),
                                speed: const Duration(
                                  milliseconds: 450,
                                )),
                          ],
                          // onTap: (() {
                          //   Navigator.pushNamed(
                          //     context,
                          //     MyRoutes.hosp24,
                          //   );
                          // }),
                          isRepeatingAnimation: true,
                          totalRepeatCount: 2,
                        ),
                        // onPressed: (() {
                        //   Navigator.pushNamed(
                        //     context,
                        //     MyRoutes.hosp24,
                        //   );
                        // }),
                      )
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
