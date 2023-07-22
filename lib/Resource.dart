// import 'package:flutter/material.dart';
//
// void main() => runApp(Resource());
//
// class formdata{
//   final String resourceType;
//   final String resourceName;
//   final String resourceContent;
//   final String resourceFile;
//   final String resourceDate;
//
//   const formdata({
//     required this.resourceType,
//     required this.resourceName,
//     required this.resourceContent,
//     required this.resourceFile,
//     required this.resourceDate,
//   });
//
// }
//
// class Resource extends StatefulWidget {
//    Resource ({Key? key}):super(key: key);
//
//   final List<formdata>> formList = [
//   formdata(
//   code: 'CSE101',
//   title: 'Introduction to Computer Science',
//   year: '2023',
//   level: 'Beginner',
//   ),
//
//   @override
//   State<Resource> createState() => _ResourceState();
// }
//
// class _ResourceState extends State<Resource> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     String  resourceType;
//     String? resourceName;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Resource Form'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Resource Type'),
//                 onSaved: (value) => resourceType = value,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the resource type';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Resource Name'),
//                 onSaved: (value) => resourceName = value,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter the resource name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Resource Content'),
//                 onSaved: (value) => _resourceContent = value,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter the resource content';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Resource File'),
//                 onSaved: (value) => _resourceFile = value,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter the resource file';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Resource Date'),
//                 onTap: () async {
//                   final DateTime picked = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2100),
//                   );
//                   if (picked != null && picked != _resourceDate) {
//                     setState(() {
//                       _resourceDate = picked;
//                     });
//                   }
//                 },
//                 validator: (value) {
//                   if (_resourceDate == null) {
//                     return 'Please select the resource date';
//                   }
//                   return null;
//                 },
//                 readOnly: true,
//                 controller: TextEditingController(
//                   text: _resourceDate != null
//                       ? '${_resourceDate.day}/${_resourceDate.month}/${_resourceDate.year}'
//                       : '',
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               RaisedButton(
//                 onPressed: () {
//                   if (_formKey.currentState.validate()) {
//                     _formKey.currentState.save();
//                     // Process the form data, e.g., save it to a database
//                     // or send it to an API
//                     // Access the form values using _resourceType, _resourceName, etc.
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
