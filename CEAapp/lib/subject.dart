import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test01/components/drawer.dart';
import 'dart:convert';

import 'package:test01/testType.dart';

// ignore: must_be_immutable
class Subject extends StatefulWidget {
  // Subject({Key? key}) : super(key: key);
  late String userId;
  late String fullname1;

  Subject({super.key, required this.userId, required this.fullname1});
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  String url = 'http://localhost/test/user.php';
  List _eventList = [];
  List colors = [Colors.amber, Colors.red, Colors.blue, Colors.grey];

  void getSubject() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getSubject',
      'json': jsonEncode(jsonData)
    };

    var response = await http.post(Uri.parse(url), body: json);
    if (response.statusCode == 200) {
      setState(() {
        _eventList = jsonDecode(response.body);
        print(_eventList);
      });
    } else {
      throw Exception('Failed to load service');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'CEA Reviewer Application',
            style: TextStyle(
                color: Color.fromARGB(255, 58, 58, 58),
                fontWeight: FontWeight.bold),
          ),
        ),
        drawer: createDrawer(context),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome back!',
                            style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.fullname1,
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/image/hehe.jpg',
                              width: 115,
                              height: 115,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: const Color.fromARGB(255, 70, 69, 69),
                    ),
                  ),
                  Expanded(
                      flex: 30,
                      child: ListView.builder(
                        itemCount: _eventList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: colors[index % colors.length],
                            shadowColor: Color.fromARGB(247, 33, 33, 33),
                            child: Container(
                              decoration: BoxDecoration(

                                  // color: Colors.grey.shade100
                                  // image: DecorationImage(
                                  //   fit: BoxFit.cover,
                                  //   image: AssetImage(
                                  //     'assets/image/.jpg',
                                  //   ),
                                  // ),
                                  ),
                              child: ListTile(
                                visualDensity:
                                    VisualDensity(vertical: 4, horizontal: 4),
                                contentPadding: EdgeInsets.all(30),
                                leading: Icon(Icons.subject),
                                title: Text(_eventList[index]['subject_code']
                                    .toString()),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        _eventList[index]['subject_name']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => testType()),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
