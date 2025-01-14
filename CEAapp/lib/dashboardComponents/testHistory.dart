import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestHistory extends StatefulWidget {
  const TestHistory({Key? key}) : super(key: key);

  @override
  _TestHistoryState createState() => _TestHistoryState();
}

class _TestHistoryState extends State<TestHistory> {
  String url = 'http://localhost/test/user.php';
  List _eventList = [];
  int score = 0;

  void getSubject() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getScore',
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
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shadowColor: Colors.transparent,
          title: Text(
            'Test History',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(40),
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
                                leading: Icon(Icons.score),
                                title: Text(_eventList[index]['result_score']
                                    .toString()),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        _eventList[index]['result_date']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  ],
                                ),
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //       builder: (context) => question()),
                                  // );
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
