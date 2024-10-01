import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/theme/theme.dart';

class ThemeBloc extends Cubit<ThemeData> {
  ThemeBloc(this.isDark) : super(lightTheme) {
    if (isDark) {
      emit(darkTheme);
      setDarkSystemBars();
    } else {
      emit(lightTheme);
      setLightSystemBars();
    }
  }

  bool isDark;

  void toggleTheme() {
    isDark = !isDark;
    if (isDark) {
      emit(darkTheme);
      setDarkSystemBars();
    } else {
      emit(lightTheme);
      setLightSystemBars();
    }
  }
}
