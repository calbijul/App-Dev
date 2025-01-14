import 'package:flutter/material.dart';
import 'package:test01/login_auth.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login(),
    );
  }
}
