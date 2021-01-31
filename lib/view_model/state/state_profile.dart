import 'package:equatable/equatable.dart';
import 'package:my_todo/models/Profile.dart';

class StateProfile extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialProfileState extends StateProfile {}

class LoadingProfileState extends StateProfile {}

class SuccessProfileState extends StateProfile {
  final List<Profile> profiles;

  SuccessProfileState(this.profiles);
}

class FailProfileState extends StateProfile {
  final String error;

  FailProfileState(this.error);
}
