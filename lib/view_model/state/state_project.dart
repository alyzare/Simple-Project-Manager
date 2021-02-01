import 'package:equatable/equatable.dart';
import 'package:my_todo/models/Project.dart';

class StateProject extends Equatable{
  @override
  List<Object> get props => [];
}

class InitialProjectState extends StateProject {}

class LoadingProjectState extends StateProject {}

class SuccessProjectState extends StateProject {
  final List<Project> projects;

  SuccessProjectState(this.projects);
}

class FailProjectState extends StateProject {
  final String error;

  FailProjectState(this.error);
}