import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test01/main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String url = 'http://localhost/test/user.php';
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bdayController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  Future<void> register() async {
    if (_firstNameController.text == '' ||
        _lastNameController.text == '' ||
        _usernameController.text == '' ||
        _passwordController.text == '' ||
        _genderController.text == '' ||
        _bdayController.text == '' ||
        _addressController.text == '' ||
        _mobileController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields cannot be empty!"),
        ),
      );
    } else {
      Map<String, String> jsonData = {
        'firstname': _firstNameController.text,
        'lastname': _lastNameController.text,
        'username': _usernameController.text,
        'password': _passwordController.text,
        'gender': _genderController.text,
        'bday': _bdayController.text,
        'address': _addressController.text,
        'mobile': _mobileController.text
      };
      Map<String, String> requestBody = {
        'operation': 'signup',
        'json': jsonEncode(jsonData)
      };

      var response = await http.post(Uri.parse(url), body: requestBody);

      if (response.body != '0') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration Complete!"),
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
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: "Firstname",
                          hintText: "Enter firstname",
                          prefixIcon: const Icon(Icons.people),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: "Lastname",
                          hintText: "Enter lastname",
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Username",
                hintText: "Enter username",
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
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Password",
                hintText: "Enter password",
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Gender",
                hintText: "Enter gender",
                prefixIcon: const Icon(Icons.people),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _bdayController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Date of Birth",
                hintText: "Enter birthday",
                prefixIcon: const Icon(Icons.event),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Address",
                hintText: "Enter address",
                prefixIcon: const Icon(Icons.location_city),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _mobileController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Phone Number",
                hintText: "Enter phone number",
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text("REGISTER"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 58, 82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
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
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 58, 82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
