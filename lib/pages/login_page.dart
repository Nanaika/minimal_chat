import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/login_or_reg_bloc.dart';
import 'package:minimal_chat_app/components/title.dart';
import 'package:minimal_chat_app/main.dart';

import '../components/constants.dart';
import '../components/custom_icon.dart';
import '../components/custom_text_button.dart';
import '../components/custom_textfield.dart';
import '../components/register_row.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomIcon(
              icon: Icons.chat_rounded,
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTitle(
              title: 'Welcome Back, we missed you!',
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              controller: mailController,
              hintText: emailHintText,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: passController,
              hintText: passwordHintText,
              isObscured: true,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
              title: 'LOG IN',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterRow(
              onPress: () {
                context.read<LoginOrRegBloc>().toggle();
              },
              firstText: 'Not a member?',
              secondText: 'Register now',
            )
          ],
        ),
      ),
    );
  }
}
