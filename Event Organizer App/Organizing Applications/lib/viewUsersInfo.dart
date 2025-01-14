import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewUsersInfo extends StatefulWidget {
  const ViewUsersInfo({Key? key}) : super(key: key);

  @override
  _ViewUsersInfoState createState() => _ViewUsersInfoState();
}

class _ViewUsersInfoState extends State<ViewUsersInfo> {
  var url = 'http://localhost/test/user.php';
  List _viewUsers = [];

  Future<void> getEvent() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getUserInfo',
      'json': jsonEncode(jsonData)
    };
    var response = await http.post(Uri.parse(url), body: json);
    if (response.statusCode == 200) {
      setState(() {
        _viewUsers = jsonDecode(response.body);
        print(_viewUsers);
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
        backgroundColor: const Color.fromARGB(255, 0, 58, 82),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Users info',
              style: TextStyle(fontSize: 20),
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
                    itemCount: _viewUsers.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                          child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: const Icon(Icons.person),
                        title: Text(
                          _viewUsers[index]['user_gender'].toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        subtitle: Text(
                          _viewUsers[index]['user_mobile'].toString(),
                        ),

                        // subtitle: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(_viewUsers[index]['data_venue'].toString(),
                        //         style: TextStyle(
                        //             fontSize: 20,
                        //             color: Color.fromARGB(255, 0, 0, 0))),
                        //     Text(_viewUsers[index]['data_date'].toString(),
                        //         style: TextStyle(
                        //             fontSize: 20,
                        //             color: Color.fromARGB(255, 0, 0, 0))),
                        //   ],
                        // ),
                        // onTap: () {
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => ViewUsers()),
                        //   );
                        // },
                      ));
                    }))
          ],
        ),
      ),
    );
  }
}
