import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/title.dart';

import '../../components/constants.dart';
import '../../components/custom_icon.dart';
import '../../components/custom_text_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/register_row.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView(
      {super.key,
      required this.emailController,
      required this.passController,
      this.onPress, this.toggleLogOrReg});

  final TextEditingController emailController;
  final TextEditingController passController;
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
              title: 'Welcome Back, we missed you!',
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
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextButton(
                    title: 'LOG IN',
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
              firstText: 'Not a member?',
              secondText: 'Register now',
            )
          ],
        ),
      ),
    );
  }
}
