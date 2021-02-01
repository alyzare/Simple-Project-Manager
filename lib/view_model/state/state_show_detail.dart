import 'package:equatable/equatable.dart';

class StateShowDetail extends Equatable {
  final bool isShow;
  StateShowDetail(this.isShow);

  @override
  List<Object> get props => [this.isShow];
}

class ShowDetailState extends StateShowDetail {
  ShowDetailState(bool isShow) : super(isShow);
}

class ChangeDetailState extends StateShowDetail {
  ChangeDetailState(bool isShow) : super(isShow);
}