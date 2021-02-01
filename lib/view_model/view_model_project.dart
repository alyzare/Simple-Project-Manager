import 'package:bloc/bloc.dart';
import 'package:my_todo/api/Service.dart';
import 'state/state_project.dart';

export 'state/state_project.dart';

class ViewModelProject extends Cubit<StateProject> {
  ViewModelProject() : super(InitialProjectState());

  Service service = Service();

  void getProject() async {
    emit(LoadingProjectState());
    try {
      var result = await service.getProjects();
      emit(SuccessProjectState(result));
    } catch (e) {
      emit(FailProjectState(e));
    }
  }
}
