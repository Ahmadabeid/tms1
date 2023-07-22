// import 'package:flutter/material.dart';
// import 'package:tms1/login.dart';
// import 'package:tms1/model/userModel.dart';
// import 'package:tms1/Service/traineeservice.dart';
//
// import '../register.dart';
//
// class CregisterService extends StatefulWidget {
//   @override
//   _CregisterServiceState createState() => _CregisterServiceState();
// }
//
// class _CregisterServiceState extends State<CregisterService>
//     with SingleTickerProviderStateMixin {
//   TextEditingController firstName = TextEditingController();
//   TextEditingController middleName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController username = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController age = TextEditingController();
//   TextEditingController phoneNo = TextEditingController();
//   TextEditingController gender = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   add(userModel customerModel) async {
//     await traineeService().addCustomer(customerModel).then((success) {
//       print('Add successful to model');
//     });
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
//   bool _status = true;
//   final FocusNode myFocusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       color: Colors.white,
//       child: ListView(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Container(
//                 color: Color(0xffFFFFFF),
//                 child: Padding(
//                   padding: EdgeInsets.only(bottom: 25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Padding(
//                           padding: EdgeInsets.only(left: 25.0, top: 100.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Service register ',
//                                     style: TextStyle(
//                                         fontSize: 38.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Tap the pen to edit',
//                                     style: TextStyle(
//                                         fontSize: 18.0,
//                                         fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   _status ? _getEditIcon() : Container(),
//                                 ],
//                               )
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'First Name',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: firstName,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter First Name",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Middle Name',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: firstName,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter Middle Name",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Last Name',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: lastName,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter Last Name",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Username',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: username,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter username",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Email',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: email,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter Email",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Age',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: age,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter Age",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Address',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: address,
//                                   decoration: const InputDecoration(
//                                     hintText: "Enter Address",
//                                   ),
//                                   enabled: !_status,
//                                   autofocus: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Expanded(
//                                 child: Container(
//                                   child: Text(
//                                     'Phone Number',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 flex: 2,
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Flexible(
//                                 child: Padding(
//                                   padding: EdgeInsets.only(right: 10.0),
//                                   child: TextField(
//                                     controller: phoneNo,
//                                     decoration: const InputDecoration(
//                                         hintText: "Enter Phone_Number"),
//                                     enabled: !_status,
//                                   ),
//                                 ),
//                                 flex: 2,
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 25.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Gender',
//                                     style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               left: 25.0, right: 25.0, top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: TextField(
//                                   controller: gender,
//                                   decoration: const InputDecoration(
//                                       hintText: "Enter gender"),
//                                   enabled: !_status,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                         padding:
//                             EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: 10.0),
//                                 child: Container(
//                                     child: RaisedButton(
//                                   child: Text("Save"),
//                                   textColor: Colors.white,
//                                   color: Colors.green,
//                                   onPressed: () {
//                                     setState(() {
//                                       _status = true;
//                                       FocusScope.of(context)
//                                           .requestFocus(FocusNode());
//                                     });
//                                     //toast controller
//                                     if (firstName.value.text.isEmpty) {
//                                       setState(() {
//                                         error(context,
//                                             "First name is not filled");
//                                       });
//                                     } else if (firstName.value.text.length < 3) {
//                                       setState(() {
//                                         error(context,
//                                             "First name length not valid");
//                                         error(context,
//                                             "Length must have more than 2 characters");
//                                       });
//                                     } else if (lastName.value.text.isEmpty) {
//                                       setState(() {
//                                         error(
//                                             context, "Last name is no filled");
//                                       });
//                                     } else if (lastName.value.text.length < 3) {
//                                       error(
//                                           context, "Last name lenth not valid");
//                                       error(context,
//                                           "Lenth must have more than 2 characters");
//                                     } else if (phoneNo.value.text.isEmpty) {
//                                       setState(() {
//                                         error(context,
//                                             "Phone number is no filled");
//                                       });
//                                     } else if (phoneNo.value.text.length != 10) {
//                                       error(context,
//                                           "Phone number length not valid");
//                                       error(context,
//                                           "Lenth must have 10 characters");
//                                     } else if (address.value.text.isEmpty) {
//                                       setState(() {
//                                         error(context, "Address is no filled");
//                                       });
//                                     } else if (address.value.text.length < 5) {
//                                       error(context,
//                                           "Address location length not valid");
//                                       error(context,
//                                           "Lenth must have more than 4 characters");
//                                     } else {
//                                       userModel usrModel =
//                                           userModel(
//                                               firstName: firstName.text,
//                                               lastName: lastName.text,
//                                               middleName:middleName.text,
//                                               username: username.text,
//                                               address: address.text,
//                                               age: age.text,
//                                               email: email.text,
//                                               password: password.text,
//                                               phoneNo: phoneNo.text,
//                                               gender: gender.text,
//                                               id: '', regNo: '');
//                                       add(usrModel);
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Login()));
//                                     }
//                                   },
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(20.0)),
//                                 )),
//                               ),
//                               flex: 2,
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Padding(
//                                 padding: EdgeInsets.only(left: 10.0),
//                                 child: Container(
//                                     child: RaisedButton(
//                                   child: Text("Cancel"),
//                                   textColor: Colors.white,
//                                   color: Colors.red,
//                                   onPressed: () {
//                                     setState(() {
//                                       _status = true;
//                                       FocusScope.of(context)
//                                           .requestFocus(FocusNode());
//                                     });
//                                   },
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(20.0)),
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     ));
//   }
//
//   Widget _getEditIcon() {
//     return GestureDetector(
//       child: CircleAvatar(
//         backgroundColor: Colors.red,
//         radius: 14.0,
//         child: Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
//
//   traineeService() {}
// }
