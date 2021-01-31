import 'package:bloc/bloc.dart';
import 'package:my_todo/api/Service.dart';
import 'package:my_todo/models/Profile.dart';
import 'state/state_profile.dart';

export 'state/state_profile.dart';

class ViewModelProfile extends Cubit<StateProfile> {
  ViewModelProfile() : super(InitialProfileState());

  Service service = Service();
  bool checkProfile = false;
  Profile currentProfile = Profile();

  void getProfile() async {
    emit(LoadingProfileState());
    try {
      var result = await service.getProfiles();
      checkProfile = result != null && result.length > 0;
      if (checkProfile) currentProfile = result[0];
      emit(SuccessProfileState(result));
    } catch (e) {
      emit(FailProfileState(e.toString()));
    }
  }
}
