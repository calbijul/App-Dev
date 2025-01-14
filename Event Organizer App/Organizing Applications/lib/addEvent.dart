// ignore: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  // final String username;

  // const AddEvent({Key? key, required this.username}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String url = 'http://localhost/test/user.php';
  // final TextEditingController _usernameController =
  //     TextEditingController(text: 'user');

  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> dataInput() async {
    if (_eventController.text == '' ||
        _venueController.text == '' ||
        _dateController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields cannot be empty!"),
        ),
      );
    } else {
      Map<String, String> jsonData = {
        // 'data_usrId': _usernameController.text,
        'event': _eventController.text,
        'venue': _venueController.text,
        'date': _dateController.text
      };
      Map<String, String> requestBody = {
        'operation': 'input',
        'json': jsonEncode(jsonData)
      };

      var response = await http.post(Uri.parse(url), body: requestBody);
      print(response.body);
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'ADD EVENT',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _eventController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Event",
                hintText: "Enter event",
                prefixIcon: const Icon(Icons.event_available),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _venueController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Venue",
                hintText: "Enter venue",
                prefixIcon: const Icon(Icons.place),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Date",
                hintText: "Enter date",
                prefixIcon: const Icon(Icons.date_range),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dataInput();
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
