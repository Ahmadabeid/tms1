// ignore_for_file: sort_child_properties_last, unused_local_variable, unnecessary_new, unused_element, depend_on_referenced_packages, use_build_context_synchronously, avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum Gender { male, female }

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final myformkey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _middleName = TextEditingController();
  final _lastName = TextEditingController();
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phoneNo = TextEditingController();
  final _placeOfBirth = TextEditingController();
  final _dateOfBirth = TextEditingController();
  final _nationality = TextEditingController();
  final _district = TextEditingController();
  final _ward = TextEditingController();
  final _employmentStatus = TextEditingController();
  final _maritalStatus = TextEditingController();
  final _disability = TextEditingController();
  final _disabilityTitle = TextEditingController();
  final _educationalStatus = TextEditingController();
  late TextEditingController _role;
  late TextEditingController _regNo;
  String gender = 'male';
  Gender? _gender = Gender.male;

  TextEditingController role = TextEditingController();
  TextEditingController regNo = TextEditingController();

  @override
  void initState() {
    _role = TextEditingController(text: 'ROLE_STUDENT');
    super.initState();
  }

  Future addUser() async {
    //======fetch data from form
    final myuserdata = {
      "firstname": _firstName.text,
      "middleName": _middleName.text,
      "lastname": _lastName.text,
      "username": _userName.text,
      "email": _email.text,
      "phoneNo": _phoneNo.text,
      "password": _password.text,
      "gender": gender,
      "role": _role.text,
      "regNo": _regNo,
      "placeOfBirth": _placeOfBirth.text,
      "dateOfBirth": _dateOfBirth.text,
      "nationality": _nationality.text,
      "district": _district.text,
      "ward": _ward.text,
      "employmentStatus": _employmentStatus.text,
      "maritalStatus": _maritalStatus.text,
      "disability": _disability.text,
      "disabilityTitle": _disabilityTitle.text,
      "educationalStatus": _educationalStatus.text,


    };

    var url = Uri.parse('http://192.168.1.121:8085/trainee/registerTrainee');
    var response = await http.post(
        Uri.parse(url as String),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(myuserdata));

    if (response.statusCode == 200) {
      if (response.body != "null") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text("Registered Successful")));
         Navigator.pushNamed(context, '/Login');
      } else {
        print("login fail try again");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("confirm your data.")));
    }
  }

  // show/hide passaword function
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              // Image.asset(
              //   'images/register.png',
              //   width: 175,
              // ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Courier',
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Form(
                  key: myformkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Enter Your first name',
                          labelText: 'First name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _middleName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter middle name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Enter Your middle name',
                          labelText: 'Middle name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Enter Your last name',
                          labelText: 'Last name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _userName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Enter Your Username',
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _email,
                        validator: (value) {
                          // Check if this field is empty
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // using regular expression
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }

                          // the email is valid
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: _isVisible ? false : true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Enter Your Password',
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _phoneNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: 'Enter Your phone number',
                          labelText: 'phoneNo',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,


                      ),
                      TextFormField(
                        controller: _placeOfBirth,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your place of Birth';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        maxLength: 2,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          hintText: 'Enter Your place of birth',
                          labelText: 'Place of Birth',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Gender'),
                            ListTile(
                              title: const Text('Male'),
                              leading: Radio(
                                value: Gender.male,
                                groupValue: _gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _gender = value;
                                    gender = 'male';
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Female'),
                              leading: Radio(
                                value: Gender.female,
                                groupValue: _gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _gender = value;
                                    gender = 'female';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      TextFormField(
                        controller: _placeOfBirth,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter place of birth';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          hintText: 'Enter Your Place of Birth',
                          labelText: 'Place of Birth',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _dateOfBirth,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter date of birth';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.date_range),
                          hintText: 'Enter Your Date of Birth',
                          labelText: 'Date of Birth',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _nationality,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter nationality';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_city),
                          hintText: 'Enter Your nationality',
                          labelText: 'Nationality',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _district,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter district';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          hintText: 'Enter Your district',
                          labelText: 'District',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _ward,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter ward';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          hintText: 'Enter Your ward',
                          labelText: 'Ward',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _employmentStatus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter employment status';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.task),
                          hintText: 'Enter Your Employment Status',
                          labelText: 'Employment Status',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _maritalStatus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter marital status';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.people),
                          hintText: 'Enter Your marital status',
                          labelText: 'Marital Status',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _disability,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter type of disability';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.people),
                          hintText: 'Enter Type of disability',
                          labelText: 'Type of Disability',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _disabilityTitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Disability name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          hintText: 'Enter Your disability name',
                          labelText: 'Disability Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _educationalStatus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter educational level';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          hintText: 'Enter Your educational level',
                          labelText: 'Educational Level',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: role,
                        readOnly: true,
                        enabled: false,
                        // decoration: const InputDecoration(
                        //   icon: Icon(Icons.wheelchair_pickup),
                        //   labelText: 'Patient',
                      ),


                      // const SizedBox(
                      //   height: 10,
                      //   width: 10,
                      // ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: regNo,
                        readOnly: true,
                        enabled: false,
                        // decoration: const InputDecoration(
                        //   icon: Icon(Icons.wheelchair_pickup),
                        //   labelText: 'Patient',
                      ),


                      // const SizedBox(
                      //   height: 10,
                      //   width: 10,
                      // ),

                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),

                      TextButton.icon(
                        onPressed: (() {
                          if (myformkey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            addUser();
                          }
                          //sign up
                        }),
                        icon: const Icon(Icons.create),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     const Text('Already have an account?'),
                      //     TextButton(
                      //       onPressed: (() {
                      //         // Navigator.pushNamed(
                      //         //   context,
                      //         //   MyRoutes.login,
                      //         // );
                      //       }),
                      //       child: const Text(
                      //         'Sign In',
                      //         style: TextStyle(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      // ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      const Text(
                        'By signing up you agree to our terms, conditions and privacy Policy.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  DateFormat(String s) {}

  DropdownButtonFormField2(
      {required InputDecoration decoration,
        required bool isExpanded,
        required Text hint,
        required Icon icon,
        required int iconSize,
        required int buttonHeight,
        required EdgeInsets buttonPadding,
        required BoxDecoration dropdownDecoration,
        required List<DropdownMenuItem<String>> items,
        required String? Function(dynamic value) validator,
        required Null Function(dynamic value) onChanged,
        required Null Function(dynamic value) onSaved}) {}
}
