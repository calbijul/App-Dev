import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test01/subject.dart';
import 'dart:convert';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String url = 'http://localhost/test/user.php';

  Future<void> Adminlogin() async {
    if (_usernameController.text == '' || _passwordController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Both fields cannot be empty!"),
        ),
      );
    } else {
      Map<String, String> jsonData = {
        'studUsr': _usernameController.text,
        'studPass': _passwordController.text
      };

      Map<String, String> requestBody = {
        'operation': 'studentLogin',
        'json': jsonEncode(jsonData)
      };

      // print(user['stud_fname'].toString());
      try {
        // http.Response response = await http
        //     .get(Uri.parse(url).replace(queryParameters: requestBody));

        var response = await http.post(Uri.parse(url), body: requestBody);
        var user = jsonDecode(response.body);

        if (response.body != '0') {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => Subject(
                      userId: user['subject_id'].toString(),
                      fullname1: user['stud_fname'].toString(),
                    )),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid username or password, please try again!"),
            ),
          );
        }
      } catch (error) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image/cealogo.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  ' Welcome! ',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 51, 51, 51)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 189, 189, 189),
                        )),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: "Username",
                    hintText: "Input username",
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: "Password",
                    hintText: "Input password",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Adminlogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("LOGIN"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'No account yet? Please procceed to faculty office.',
                  style: TextStyle(color: Color.fromARGB(255, 41, 40, 40)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
