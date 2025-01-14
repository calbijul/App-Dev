import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test01/addEvent.dart';
import 'package:test01/main.dart';
import 'package:test01/viewUsers.dart';

// ignore: must_be_immutable
class Mainpage extends StatefulWidget {
  // const Mainpage({Key? key}) : super(key: key);
  late String userId;
  late String fullname;
  // late String username;

  Mainpage({super.key, required this.userId, required this.fullname});

  @override
  // ignore: library_private_types_in_public_api
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var url = 'http://localhost/test/user.php';
  List _viewEvent = [];

  Future<void> getEvent() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getEvent',
      'json': jsonEncode(jsonData)
    };
    var response = await http.post(Uri.parse(url), body: json);
    if (response.statusCode == 200) {
      setState(() {
        _viewEvent = jsonDecode(response.body);
        print(_viewEvent);
      });
    } else {
      throw Exception('Failed to load service');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 0, 58, 82),
          title: Text(widget.fullname)),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
              child: IconButton(
                hoverColor: const Color.fromARGB(255, 0, 58, 82),
                iconSize: null,
                padding: EdgeInsets.all(0.0),
                // color: Color.fromARGB(255, 255, 255, 255),
                icon: const Icon(
                  Icons.add,
                  size: 20,
                  weight: 30,
                  color: Color.fromARGB(255, 123, 128, 130),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AddEvent(
                            // username: widget.username,
                            )),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 15,
              thickness: 2,
              indent: 15,
              endIndent: 3,
              color: Color.fromARGB(255, 202, 202, 202),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _viewEvent.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                          child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: const Icon(Icons.event),
                        title: Text(
                          _viewEvent[index]['data_event'],
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_viewEvent[index]['data_venue'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            Text(_viewEvent[index]['data_date'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ViewUsers()),
                          );
                        },
                      ));
                    }))
          ],
        ),
      ),
    );
  }
}
