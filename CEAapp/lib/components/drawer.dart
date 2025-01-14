import 'package:flutter/material.dart';
import 'package:test01/dashboardComponents/testHistory.dart';
import 'package:test01/main.dart';
import 'package:test01/subject.dart';

Widget createDrawer(BuildContext context) {
  return Drawer(
    width: 250,
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/quizbg.jpg"),
              fit: BoxFit.fill,
            ),
            color: Color.fromARGB(255, 1, 70, 49),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/image/cealogo.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.subject_outlined),
          title: const Text('Subjects'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => Subject(
                        userId: ['stud_id'].toString(),
                        fullname1: ['stud_fname'].toString(),

                        // username: widget.username,
                      )),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: const Text('History'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => TestHistory(
                      // userId: ['stud_id'].toString(),
                      // fullname1: ['stud_id'].toString(),
                      // username: widget.username,
                      )),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: const Text('Setting'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 220,
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => HomePage(
                      // userId: ['stud_id'].toString(),
                      // fullname1: ['stud_id'].toString(),
                      // username: widget.username,
                      )),
            );
          },
        ),
      ],
    ),
  );
}
