import 'package:flutter/material.dart';
import 'package:test01/responsive/mobileScreen.dart';
import 'package:test01/responsive/responsive_layout.dart';
import 'package:test01/responsive/tabletScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Comprehensive Reviewer App',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: responsiveLayout(
          mobileScreen: MobileScreen(),
          tabletScreen: TabletScreen(),
        ));
  }
}
