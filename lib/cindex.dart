import 'package:flutter/material.dart';
import 'package:tms1/Course.dart';
import 'package:tms1/Home.dart';
// import 'package:tms1/Resource.dart';
import 'package:tms1/Timetable.dart';
// import 'package:tms1/register.dart';

class Cindex extends StatefulWidget {
  dynamic name;
  dynamic id;
  Cindex({Key? key, required this.name, required this.id}) : super(key: key);

  @override
  _CindexState createState() => _CindexState();
}

class _CindexState extends State<Cindex> with SingleTickerProviderStateMixin {
  late TabController tabController;
  var currentPage;
  @override
  void initState() {
    currentPage = Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 85.0),
      child: Text(
        'Trainee Dashboard  ',
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0),
      ),
    );
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Panel'),
      ),
      body: currentPage,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Provider Account'),
              accountEmail: Text(widget.name),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/m.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                print('Home');
                Navigator.pop(context);
                setState(() {
                  currentPage = HomePage();
                });
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
            ),
            ListTile(
              leading: Icon(Icons.subject),
              title: Text('Course'),
              onTap: () {
                // print('Course');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Course(
                            name: widget.name,
                            id: widget.id,
                            courseCode: 'courseCode',
                            courseTitle: 'courseTitle',
                            courseYear: 'courseYear',
                            courseLevel: 'courseLevel')));
                // Navigator.pop(context);
                // setState(() {
                //   currentPage =
                // });
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Timetable'),
              onTap: () {
                print('Timetable');
                Navigator.pop(context);
                setState(() {
                  currentPage = Timetable(
                    ttDate: 'ttDate',
                    ttTime: 'ttTime',
                    ttTitle: 'ttTitle',
                    ttVenue: 'ttVenue',
                  );
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Forum'),
              // onTap: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) => UserView()));
              //             },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Profile'),
              // onTap: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //             },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Document'),
              // onTap: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //             },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              // onTap: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
              //             },
            ),
          ],
        ),
      ),
    );
  }
}
