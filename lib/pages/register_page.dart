import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/components/title.dart';

import '../bloc/login_or_reg_bloc.dart';
import '../components/constants.dart';
import '../components/custom_icon.dart';
import '../components/custom_text_button.dart';
import '../components/custom_textfield.dart';
import '../components/register_row.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

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
              title: 'Lets create an account for you',
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
              height: 10,
            ),
            CustomTextField(
              controller: confirmPassController,
              hintText: confirmPasswordHintText,
              isObscured: true,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
              title: 'REGISTER',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterRow(
              onPress: () {
                context.read<LoginOrRegBloc>().toggle();
              },
              firstText: 'Already have an account?',
              secondText: 'Login now',
            )
          ],
        ),
      ),
    );
  }
}
