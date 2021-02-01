import 'package:flutter/material.dart';
import 'package:my_todo/pages/home_page.dart';
import 'package:my_todo/pages/profile_page.dart';
import 'package:my_todo/pages/project_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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