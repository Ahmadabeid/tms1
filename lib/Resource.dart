// import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_downloader/flutter_downloader.dart';

class Resource extends StatefulWidget {
  dynamic username;
  dynamic password;
  Resource({Key? key, required this.username, required this.password}) : super(key: key);


  @override
  State<Resource> createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {
  // late Future<List<Document>> futurePost;
  // @override
  // void initState(){
  //   super.initState();
  //   futurePost = download();
  // }
  dynamic resId;
  void  download() async {
    var url = 'htpp//192.168.1.227:8085/resource/addResource/${resId}';
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

  Future fetch_resource() async {
    var urls = 'http://192.168.1.227:8085/resource/getResource';
    var username = widget.username;
    var password = widget.password;

    // Combine username and password with a colon and encode them in Base64
    var basicAuth = 'Basic QWhtYWQ6MTIz' + base64Encode(utf8.encode('$username:$password'));

    var res = await http.get(
      Uri.parse(urls),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
    );

    if (res.statusCode == 200) {
      var datas = jsonDecode(res.body);
      print(datas);
      return datas;
    } else {
      print('${res.statusCode}');
    }
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
              Text('Resource'),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetch_resource(),
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
                      child:Row(
                        children: [
                          Container(
                            child:Column(
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
                                Text("${snapshot.data![index].resName}"),
                                SizedBox(height: 10),
                                Text("${snapshot.data![index].resContent}"),

                                SizedBox(height: 10),
                                Text("RESOURCE:${snapshot.data![index].resDate}"),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                resId =snapshot.data![index].resId;
                              });
                            },
                            child:   Container(
                              width:20,
                              height: 20,
                              decoration:BoxDecoration(
                                  color:Colors.grey,
                                  borderRadius: BorderRadius.circular(50)

                              ),
                              child:Icon(Icons.download),
                            ),

                          ),

                        ],
                      )



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

