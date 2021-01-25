import 'package:flutter/material.dart';
import 'package:my_todo/Pages/home_page.dart';
import 'package:my_todo/Pages/profile_page.dart';
import 'package:my_todo/Pages/project_details.dart';

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      initialRoute: '/home',
      routes: {
        '/home':(context) => Home(),
        '/profile':(context) => ProfilePage(ModalRoute.of(context).settings.arguments),
        '/project':(context) => ProjectPage(ModalRoute.of(context).settings.arguments)
      },
    );
  }
}