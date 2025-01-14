import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class question extends StatefulWidget {
  const question({Key? key}) : super(key: key);

  @override
  _questionState createState() => _questionState();
}

class _questionState extends State<question> {
  int score = 0;
  var url = 'http://localhost/test/user.php';
  List _viewUsers = [];
  List colors = [
    Color.fromARGB(255, 7, 169, 222),
    Color.fromARGB(255, 12, 209, 127),
    Color.fromARGB(255, 138, 18, 213),
    Color.fromARGB(255, 210, 11, 167),
    Color.fromARGB(255, 222, 75, 7),
    Color.fromARGB(255, 12, 209, 199),
    Color.fromARGB(255, 213, 18, 60),
    Color.fromARGB(255, 210, 11, 167)
  ];

  Future<void> getEvent() async {
    Map<String, String> jsonData = {};
    Map<String, String> json = {
      'operation': 'getQuestions',
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

  void getScore() {
    setState(() {
      score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  'Question',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              width: 230,
            ),
            Column(
              children: [
                Text(
                  'Score: $score',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            )
          ],
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(0, 255, 255, 255),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('Score : $score'),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _viewUsers.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                            shadowColor: Colors.transparent,
                            child: Container(
                              height: 512,
                              // decoration: BoxDecoration(

                              //   // image: DecorationImage(
                              //   //   image: AssetImage("assets/image/quizbg.jpg"),
                              //   //   fit: BoxFit.fill,
                              //   // ),
                              //   // color: Color.fromARGB(255, 40, 180, 255),
                              // ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 450,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colors[index % colors.length],
                                    ),
                                    child: ListTile(
                                      visualDensity: VisualDensity(
                                          vertical: 4, horizontal: 4),
                                      // contentPadding: EdgeInsets.all(10),
                                      // leading: const Icon(Icons.question_answer),

                                      title: Container(
                                        padding: EdgeInsets.all(20),
                                        width: 100,
                                        decoration: BoxDecoration(
                                          // color: const Color.fromARGB(
                                          //     255, 151, 238, 154),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          _viewUsers[index]['question_text']
                                              .toString(),
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      ),

                                      subtitle: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 80,
                                            ),
                                            InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  // padding: EdgeInsets.all(20),
                                                  width: 400,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Text(
                                                    _viewUsers[index]
                                                            ['question_optionA']
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {},
                                                onHover: (val) {}),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 400,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Text(
                                                    _viewUsers[index]
                                                            ['question_optionB']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                onTap: () {},
                                                onHover: (val) {}),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 400,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Text(
                                                  _viewUsers[index]
                                                          ['question_answer']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 25, 17, 17)),
                                                ),
                                              ),
                                              onTap: () {
                                                getScore();
                                                // const snackBar = SnackBar(
                                                //     content: Text(
                                                //         'Your answer is correct!'));

                                                // ScaffoldMessenger.of(context)
                                                //     .showSnackBar(snackBar);

                                                // AlertDialog(
                                                //   actions: [
                                                //     TextButton(
                                                //         onPressed: () {
                                                //           Navigator.of(
                                                //                   context)
                                                //               .pop();
                                                //         },
                                                //         child: const Text(
                                                //             'Your answer is correct!'))
                                                //   ],
                                                // );
                                                // const SnackBar(
                                                //   content: Text(
                                                //       "You got the correct answer!"),
                                                // );
                                              },
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 400,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Text(
                                                    _viewUsers[index]
                                                            ['question_optionD']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                onTap: () {},
                                                onHover: (val) {}),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
