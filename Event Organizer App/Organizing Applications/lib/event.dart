import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Event extends StatefulWidget {
  Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  String url = 'http://localhost/test/user.php';
  final TextEditingController _eventStepsController = TextEditingController();
  final TextEditingController _eventStatusController = TextEditingController();

  Future<void> eventStatus() async {
    if (_eventStepsController.text == '' || _eventStatusController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields cannot be empty!"),
        ),
      );
    } else {
      Map<String, String> jsonData = {
        'name': _eventStepsController.text,
        'payment': _eventStatusController.text,
      };
      Map<String, String> requestBody = {
        'operation': 'userStatus',
        'json': jsonEncode(jsonData)
      };

      var response = await http.post(Uri.parse(url), body: requestBody);

      if (response.body != '0') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Submitted Successfully!"),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error occured, please try again!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 58, 82),
        ),
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'USER INFORMATION',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _eventStepsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: "Fullname",
                  hintText: "Enter fullname",
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _eventStatusController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: "Payment Method",
                  hintText: "Enter payment method",
                  prefixIcon: const Icon(Icons.payment),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    eventStatus();
                  },
                  child: Text("SUBMIT"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 58, 82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
