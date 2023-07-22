// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:tms1/customer/Channellist.dart';
// import 'package:myspace/customer/package.dart';
// import 'package:myspace/customer/pcontrol.dart';
// import 'package:myspace/customer/registerparent.dart';
// import 'package:myspace/customer/setting.dart';
// import 'package:m/global/api.dart';
// import 'package:http/http.dart' as http;
//
// class Service extends StatefulWidget {
//   @override
//   _ServiceState createState() => _ServiceState();
// }
//
// class _ServiceState extends State<Service> with SingleTickerProviderStateMixin {
//   TextEditingController pincode = TextEditingController();
//
//   Future pin() async {
//     var url = Uri.parse(appurl + "pin.php");
//     var response = await http.post(url,
//         body: jsonEncode({
//           "pincode": pincode.text,
//           "pin": "pin",
//         }),
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json"
//         });
//
//     var data = json.decode(response.body);
//     print(response.statusCode.toString());
//
//     if (response.statusCode == 200) {
//       print((data["status"]=="201").toString());
//       if (data["status"] == "201") {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Pcontrol()));
//       }
//     } else {
//       print("req fail");
//     }
//
//   }
//
//   late TabController tabController;
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(vsync: this, length: 5);
//   }
//
//   void error(BuildContext context, String error) {
//     final scaffold = ScaffoldMessenger.of(context);
//     scaffold.showSnackBar(
//       SnackBar(
//         content: Text(error),
//         action: SnackBarAction(
//             label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         SizedBox(height: 25.0),
//         AnimCard(
//           Colors.orange,
//           'TAP',
//           'PACKAGES',
//           IconButton(
//             icon: Icon(Icons.people_outline_rounded),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Package()));
//             },
//           ),
//         ),
//         AnimCard(
//           Colors.blueAccent,
//           'TAP',
//           'S_CONTROL',
//           IconButton(
//             icon: Icon(Icons.people_outline_rounded),
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       scrollable: true,
//                       title: Text('SERVICE_Control'),
//                       content: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Form(
//                           child: Column(
//                             children: <Widget>[
//                               TextFormField(
//                                 controller: pincode,
//                                 decoration: InputDecoration(
//                                   labelText: 'PIN',
//                                   icon: Icon(Icons.shield_sharp),
//                                 ),
//                                 obscureText: true,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       actions: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) => Registerparent()));
//                           },
//                           child: Text(
//                             'New user',
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               fontSize: 15.0,
//                               color: Color.fromARGB(255, 110, 110, 110),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10.0),
//                         RaisedButton(
//                           child: Text("Confirm"),
//                           onPressed: () {
//                             pin();
//                           },
//                         )
//                       ],
//                     );
//                   });
//             },
//           ),
//         ),
//         AnimCard(
//           Colors.greenAccent,
//           'TAP',
//           'CHANNELS',
//           IconButton(
//             icon: Icon(Icons.list_alt_rounded),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Channellist()));
//             },
//           ),
//         ),
//         AnimCard(
//           Colors.redAccent,
//           'TAP',
//           'SETTING',
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Setting()));
//             },
//           ),
//         ),
//       ]),
//     );
//   }
// }
//
// class AnimCard extends StatefulWidget {
//   final Color color;
//   final String numEng;
//   final String content;
//   final icon;
//
//   AnimCard(this.color, this.numEng, this.content, this.icon);
//   @override
//   _AnimCardState createState() => _AnimCardState();
// }
//
// class _AnimCardState extends State<AnimCard> {
//   var padding = 100.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 4),
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           AnimatedPadding(
//             padding: EdgeInsets.only(left: padding),
//             duration: Duration(milliseconds: 3000),
//             curve: Curves.ease,
//             child: Container(
//               child: CardItem(
//                 widget.color,
//                 widget.numEng,
//                 widget.content,
//                 widget.icon,
//                     () {
//                   setState(
//                         () => padding = padding == 0 ? 100.0 : 0.0,
//                   );
//                 },
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: ClipPath(
//               clipper: ArcClipper(),
//               child: Container(
//                 height: 100,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(8),
//                     bottomRight: Radius.circular(8),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CardItem extends StatelessWidget {
//   final Color color;
//   final String numEng;
//   final String content;
//   final Icon;
//   final onTap;
//
//   CardItem(this.color, this.numEng, this.content, this.Icon, this.onTap);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Container(
//           color: color.withOpacity(0.5),
//           height: 80,
//           width: 250,
//           child: Row(
//             children: <Widget>[
//               RotatedBox(
//                 quarterTurns: 3,
//                 child: Container(
//                   width: 100,
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   child: Text(
//                     numEng,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     color: color.withOpacity(1),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 15),
//                   child: Text(
//                     content,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 30),
//                 child: Icon,
//               ),
//             ],
//           ),
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }
//
// class ArcClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//
//     var arcPath = Path.combine(
//       PathOperation.difference,
//       path,
//       Path()
//         ..addArc(
//           Rect.fromCircle(
//             center: Offset(0, size.height / 2),
//             radius: size.height / 3,
//           ),
//           0,
//           2 * pi,
//         ),
//     );
//     return arcPath;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
