import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const fontFamily = 'oswald';

final lightTheme = ThemeData(
  fontFamily: fontFamily,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ),
);

final darkTheme = ThemeData(
  fontFamily: fontFamily,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade800,
    tertiary: Colors.black,
    inversePrimary: Colors.grey.shade100,
  ),
);

void setLightSystemBars() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(1, 1, 1, 1),
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark
  ));
}

void setDarkSystemBars() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromARGB(1, 1, 1, 1),
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light
  ));
}