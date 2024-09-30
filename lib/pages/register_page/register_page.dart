import 'package:flutter/material.dart';
import 'package:minimal_chat_app/pages/register_page/landscape_register_page_view.dart';
import 'package:minimal_chat_app/pages/register_page/register_page_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage(
      {super.key,
      required this.emailController,
      required this.passController,
      required this.confPassController,
      this.onPress,
      this.toggleLogOrReg});

  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confPassController;
  final void Function()? onPress;
  final void Function()? toggleLogOrReg;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return LandscapeRegisterPageView(
            onPress: onPress,
            emailController: emailController,
            passController: passController,
            toggleLogOrReg: toggleLogOrReg,
            confPassController: confPassController,
          );
        } else {
          return RegisterPageView(
            onPress: onPress,
            emailController: emailController,
            passController: passController,
            toggleLogOrReg: toggleLogOrReg,
            confPassController: confPassController,
          );
        }
      },
    );
  }
}
