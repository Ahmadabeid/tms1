import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_downloader/flutter_downloader.dart';


List<Document> postFromJson(String str)=>
    List<Document>.from(json.decode(str).map((x)=> Document.fromMap(x)));

class Document {
  Document(
      {
        required this.resType,
        required this.resName,
        required this.resContent,
        required this.resFile,
        required this.resDate });

  String resType;
  String resName;
  String resContent;
  String resFile;
  String resDate;

  factory Document.fromMap(Map<String, dynamic> json) => Document(
    resType: json["resType"],
    resName: json["resName"],
    resContent: json["resContent"],
    resFile: json["resFile"],
    resDate: json["resDate"],
  );
}


  dynamic resId;
  void  download() async {
    var url = 'htpp//192.168.88.73:8000/resource/addResource/${resId}';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }



class Resource extends StatefulWidget {
  const Resource({
    Key ? key,
    required String resType,
    required String resName,
    required String resContent,
    required String resFile,
    required String resDate });

  // : super(key: key);

  @override
  State<Resource> createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {
  late Future<List<Document>> futurePost;
  @override
  void initState(){
    super.initState();
    futurePost = download();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(
                width: 20,
              ),
              Text('Course List'),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Document>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) =>
                  Container(
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
                            "${snapshot.data![index].resType}",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("RESOURCE:${snapshot.data![index].resName}"),
                          SizedBox(height: 10),
                          Text("RESOURCE:${snapshot.data![index].resContent}"),
                          SizedBox(height: 10),
                          Text("RESOURCE:${snapshot.data![index].resFile}"),
                          SizedBox(height: 10),
                          Text("RESOURCE:${snapshot.data![index].resDate}"),
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

