import 'package:flutter/material.dart';
import 'package:minimal_chat_app/pages/login_page/landscape_login_page_view.dart';
import 'package:minimal_chat_app/pages/login_page/login_page_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.emailController,
    required this.passController,
    this.onPress,
    this.toggleLogOrReg,
  });

  final TextEditingController emailController;
  final TextEditingController passController;
  final void Function()? onPress;
  final void Function()? toggleLogOrReg;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return LandscapeLoginPageView(
            onPress: onPress,
            emailController: emailController,
            passController: passController,
            toggleLogOrReg: toggleLogOrReg,
          );
        } else {
          return LoginPageView(
            onPress: onPress,
            emailController: emailController,
            passController: passController,
            toggleLogOrReg: toggleLogOrReg,
          );
        }
      },
    );
  }
}
