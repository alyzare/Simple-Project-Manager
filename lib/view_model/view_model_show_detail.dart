import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_todo/view_model/state/state_show_detail.dart';

export 'state/state_show_detail.dart';

class ViewModelShowDetail extends Cubit<StateShowDetail> {
  ViewModelShowDetail() : super(ShowDetailState(true));

  void showDetail({@required bool isShow}) async {
    emit(ShowDetailState(!isShow));
  }
}