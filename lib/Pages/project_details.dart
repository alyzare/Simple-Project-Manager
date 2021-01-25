import 'package:flutter/material.dart';
import 'package:my_todo/models/Project.dart';

class ProjectPage extends StatelessWidget {

  Project _currentProject;

  ProjectPage(Project project) {
    _currentProject = project;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_currentProject.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('details: ${_currentProject.details}'),
          ],
        ),
      ),
    );
  }

}
