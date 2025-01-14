import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test01/event.dart';
import 'package:test01/main.dart';

import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Admin extends StatefulWidget {
  late String userId;
  late String fullname1;

  Admin({super.key, required this.userId, required this.fullname1});

  // Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var url = 'http://localhost/test/user.php';
  List _eventList = [];

  void getDataInput() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getEvent',
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
          title: Text('Organizer Application'),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 0, 58, 82),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(
                  Icons.logout,
                ))
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 100,
              // ),
              // Text(
              //   'EVENT LIST',
              //   style: TextStyle(fontSize: 30),
              // ),
              // SizedBox(
              //   height: 100,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => Event(),
              //     ));
              //   },
              //   child: Text("WORK"),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color.fromARGB(255, 0, 58, 82),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //   ),
              // ),
              // Text(_selectedEvent),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Current Events',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 15,
                thickness: 2,
                indent: 15,
                endIndent: 3,
                color: Color.fromARGB(255, 202, 202, 202),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 30,
                  child: ListView.builder(
                    itemCount: _eventList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.event),
                          title:
                              Text(_eventList[index]['data_event'].toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_eventList[index]['data_venue'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              Text(_eventList[index]['data_date'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Event()),
                            );
                          },
                        ),
                      );
                    },
                  ))
            ],
          ),
        ));
  }
}
