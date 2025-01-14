import 'dart:convert';
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
        'username': _usernameController.text,
        'password': _passwordController.text
      };

      Map<String, String> requestBody = {
        'operation': 'login',
        'json': jsonEncode(jsonData)
      };

      var response = await http.post(Uri.parse(url), body: requestBody);
      if (response.body != '0') {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Mainpage()),
        );
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
              'LOGIN ',
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
                suffixIcon: const Icon(Icons.check),
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
                prefixIcon: const Icon(Icons.password),
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: const Text(
                  "click Here to Register",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 0, 58, 82),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
