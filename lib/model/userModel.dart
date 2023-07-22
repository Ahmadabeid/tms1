// package model;
//
// class package {
//   String model = '';
// }
//
// var public; class userModel {
//   String id;
//   String username;
//   String password;
//   String email;
//   String regNo;
//   String phoneNo;
//   String gender;
//   String age;
//   String address;
//   String firstName;
//   String middleName;
//   String lastName;
//
//   userModel({
//     required this.id,
//     required this.username,
//     required this.password,
//     required this.email,
//     required this.regNo,
//     required this.phoneNo,
//     required this.gender,
//     required this.age,
//     required this.address,
//     required this.middleName,
//     required this.firstName,
//     required this.lastName,
//   });
//
//   factory userModel.fromJson(Map<String, dynamic> json) {
//     return userModel(
//       id: json['id'] as String,
//       username: json['username'] as String,
//       password: json['password'] as String,
//       email: json['email'] as String,
//       regNo: json['regNo'] as String, phoneNo: '', firstName: '', gender: '', age: '', address: '', middleName: '', lastName: '',
//     );
//   }
//   Map<String, dynamic> toJsonAdd() {
//     return {
//       "id": id,
//       "regNo": regNo,
//       "username": username,
//       "password": password,
//       "email": email,
//     };
//   }
// }
