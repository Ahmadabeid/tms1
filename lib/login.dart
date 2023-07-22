import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tms1/cindex.dart';
import 'package:tms1/register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();



  @override
  State<Login> createState()=>_LoginState();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(50.0, 150.0, 0.0, 0.0),
                      child: const Text('USER',
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(50.0, 190.0, 0.0, 0.0),
                      child: const Text('LOGIN',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(150.0, 190.0, 0.0, 0.0),
                      child: const Text('.',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                          labelText: 'NAME',
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    Container(
                      height: 8,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                          labelText: 'PASSWORD',
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: const InkWell(
                        child: Text(
                          'Forgot Password..',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      width: 500.0,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          child: Text("Register"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      width: 500.0,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          child: Text("login"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cindex()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



