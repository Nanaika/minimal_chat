import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/auth_bloc.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/pages/register_page/register_page.dart';

import '../bloc/login_or_reg_bloc.dart';
import '../components/utils.dart';
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
              checkState(state, context);
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
                FocusScope.of(context).unfocus();
                context.read<AuthBloc>().signInWithEmailPass(
                    loginEmailController.text, loginPassController.text);
              },
              toggleLogOrReg: () {
                context.read<LoginOrRegBloc>().toggle();
              },
            ),
          )
        : BlocListener<AuthBloc, AuthState>(
            listener: (BuildContext context, state) {
              checkState(state, context);
            },
            child: RegisterPage(
              emailController: regEmailController,
              passController: regPassController,
              confPassController: regConfPassController,
              onPress: () {

                if (regEmailController.text.isEmpty) {
                  showSnackBar(context, emailEmptyText);
                  return;
                }
                if (regPassController.text.isEmpty) {
                  showSnackBar(context, passwordEmptyText);
                  return;
                }
                if (regConfPassController.text.isEmpty) {
                  showSnackBar(context, confPasswordEmptyText);
                  return;
                }
                if (regConfPassController.text != regPassController.text) {
                  showSnackBar(context, confPasswordNotMatchText);
                  return;
                }
                FocusScope.of(context).unfocus();
                context.read<AuthBloc>().registerWithEmailAndPass(
                    regEmailController.text, regPassController.text);
              },
              toggleLogOrReg: () {
                context.read<LoginOrRegBloc>().toggle();
              },
            ),
          );
  }

  void checkState(AuthState state, BuildContext context) {
    if (state is AuthError) {
      showSnackBar(context, state.message);
    }
    if (state is AuthLoading) {
      showLoadingDialog(context);
    } else {
      Navigator.of(context).pop();
    }
  }
}

