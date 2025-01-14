import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test01/question.dart';

import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class testType extends StatefulWidget {
  // late String userId;
  // late String fullname1;

  // testType({super.key, required this.userId, required this.fullname1});

  testType({Key? key}) : super(key: key);

  @override
  _testTypeState createState() => _testTypeState();
}

class _testTypeState extends State<testType> {
  var url = 'http://localhost/test/user.php';
  List _eventList = [];

  void getDataInput() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getTest',
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
    getDataInput();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shadowColor: const Color.fromARGB(0, 255, 255, 255),
          title: Text(
            'Test Type',
            style: TextStyle(color: Colors.black),
          ),
        ),
        // drawer: createDrawer(context),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
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
                              color: Colors.grey.shade200,
                              shadowColor: Colors.black,
                              child: Container(
                                decoration: BoxDecoration(
                                    // color: Colors.grey.shade200,
                                    // image: DecorationImage(
                                    //   fit: BoxFit.cover,
                                    //   image: AssetImage(
                                    //     'assets/image/bg1.jpg',
                                    //   ),
                                    // ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  visualDensity:
                                      VisualDensity(vertical: 4, horizontal: 4),
                                  contentPadding: EdgeInsets.all(30),
                                  leading: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 44,
                                      minHeight: 44,
                                      maxWidth: 64,
                                      maxHeight: 64,
                                    ),
                                    child: Image.asset(
                                        'assets/image/examlogo.png',
                                        fit: BoxFit.cover),
                                  ),

                                  title: Text(
                                    _eventList[index]['test_type'].toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  // subtitle: Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(_eventList[index]['data_venue'].toString(),
                                  //         style: TextStyle(
                                  //             fontSize: 20,
                                  //             color: Color.fromARGB(255, 0, 0, 0))),
                                  //     Text(_eventList[index]['data_date'].toString(),
                                  //         style: TextStyle(
                                  //             fontSize: 20,
                                  //             color: Color.fromARGB(255, 0, 0, 0))),
                                  //   ],
                                  // ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => question()),
                                    );
                                  },
                                ),
                              ));
                        },
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
