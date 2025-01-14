import 'dart:convert';
import 'package:test01/admin.dart';
import 'package:test01/adminlog.dart';
import 'package:test01/register.dart';
import 'package:http/http.dart' as http;
import 'package:test01/mainpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Event Organizer Application',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String url = 'http://localhost/test/user.php';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    if (_usernameController.text == '' || _passwordController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Both fields cannot be empty!"),
        ),
      );
    } else {
      Map<String, String> jsonData = {
        'adminUsr': _usernameController.text,
        'adminPass': _passwordController.text
      };

      Map<String, String> requestBody = {
        'operation': 'Adminlogin',
        'json': jsonEncode(jsonData)
      };

      var response = await http.post(Uri.parse(url), body: requestBody);

      if (response.body != '0') {
        var user = jsonDecode(response.body);

        if (_usernameController.text == '' && _passwordController.text == '') {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => Admin(
                      userId: user['usr_id'].toString(),
                      fullname1: user['username'].toString(),
                    )),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => Mainpage(
                    userId: user['admin_id'].toString(),
                    fullname: user['admin_usr'].toString())),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid username or password, please try again!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/image/uns.jpg"), fit: BoxFit.cover)),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ADMIN LOGIN ',
              style: TextStyle(
                  fontSize: 40, color: Color.fromARGB(255, 0, 58, 82)),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipOval(
              child: Image.asset(
                'assets/image/hehe.jpg',
                width: 210,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // const Text(
            //   'LOGIN',
            //   style: TextStyle(fontSize: 20, color: Colors.black),
            // ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Password",
                hintText: "Input password",
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 58, 82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("LOGIN"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 58, 82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("Register"),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AdminPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 58, 82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("UserLogin"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
