import 'package:flutter_bloc/flutter_bloc.dart';

class LoginOrRegBloc extends Cubit<bool> {
  LoginOrRegBloc() : super(true);

  bool showLogin = true;

  void toggle() {
    showLogin = !showLogin;
    emit(showLogin);
  }

}