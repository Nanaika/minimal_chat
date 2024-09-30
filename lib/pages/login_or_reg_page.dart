import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/pages/login_page/login_page.dart';
import 'package:minimal_chat_app/pages/register_page/register_page.dart';

import '../bloc/login_or_reg_bloc.dart';

class LoginOrRegPage extends StatefulWidget {
  const LoginOrRegPage({super.key, required this.showLogin});

  final bool showLogin;

  @override
  State<LoginOrRegPage> createState() => _LoginOrRegPageState();
}

class _LoginOrRegPageState extends State<LoginOrRegPage> {
  final loginEmailController = TextEditingController();
  final loginPassController = TextEditingController();

  final regEmailController = TextEditingController();
  final regPassController = TextEditingController();
  final regConfPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.showLogin
        ? LoginPage(
            emailController: loginEmailController,
            passController: loginPassController,
            onPress: () {},
            toggleLogOrReg: () {
              context.read<LoginOrRegBloc>().toggle();
            },
          )
        : RegisterPage(
            emailController: regEmailController,
            passController: regPassController,
            confPassController: regConfPassController,
            onPress: () {},
            toggleLogOrReg: () {
              context.read<LoginOrRegBloc>().toggle();
            },
          );
  }
}
