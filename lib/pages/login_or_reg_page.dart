import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/auth_bloc.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/pages/register_page/register_page.dart';

import '../bloc/login_or_reg_bloc.dart';
import 'login_page/login_page.dart';

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
        ? BlocListener<AuthBloc, AuthState>(
            listener: (BuildContext context, state) {
              if (state is AuthError) {
                showSnackBar(context, state.message);
              }
              if (state is AuthLoading) {
                showLoadingDialog(context);
              } else {
                Navigator.of(context).pop();
              }
              print('STATE fromLISTEN ----------------------  ${state}');
            },
            child: LoginPage(
              emailController: loginEmailController,
              passController: loginPassController,
              onPress: () async {
                if (loginEmailController.text.isEmpty) {
                  showSnackBar(context, emailEmptyText);
                  return;
                }
                if (loginPassController.text.isEmpty) {
                  showSnackBar(context, passwordEmptyText);
                  return;
                }
                context.read<AuthBloc>().signInWithEmailPass(
                    loginEmailController.text, loginPassController.text);
              },
              toggleLogOrReg: () {
                context.read<LoginOrRegBloc>().toggle();
              },
            ),
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

//TODO 1: reg page all  2: loading dialog
void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    // behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
    ),
    duration: const Duration(seconds: 5),
    backgroundColor: Colors.redAccent,
    action: SnackBarAction(
      label: gotItText,
      textColor: Theme.of(context).colorScheme.onErrorContainer,
      onPressed: () {
        // Perform some action
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(defBorderRadius),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          // contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          content: CupertinoActivityIndicator(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        );
      });
}
