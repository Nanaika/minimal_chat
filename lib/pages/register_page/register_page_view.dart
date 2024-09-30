import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/custom_icon.dart';
import '../../../components/custom_text_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/register_row.dart';
import '../../../components/title.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView(
      {super.key,
      required this.emailController,
      required this.passController,
      this.onPress,
      this.toggleLogOrReg,
      required this.confPassController});

  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confPassController;
  final void Function()? onPress;
  final void Function()? toggleLogOrReg;

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
              controller: emailController,
              hintText: emailHintText,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: passController,
              hintText: passwordHintText,
              isObscured: true,
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: confPassController,
              hintText: confirmPasswordHintText,
              isObscured: true,
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextButton(
                    title: 'REGISTER',
                    onPressed: onPress,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterRow(
              onPress: toggleLogOrReg,
              firstText: 'Already have an account?',
              secondText: 'Login now',
            )
          ],
        ),
      ),
    );
  }
}
