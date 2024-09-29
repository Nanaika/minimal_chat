import 'package:flutter_bloc/flutter_bloc.dart';

class LoginOrRegBloc extends Cubit<bool> {
  LoginOrRegBloc() : super(false);

  bool showReg = false;

  void toggle() {
    showReg = !showReg;
    emit(showReg);
  }

}