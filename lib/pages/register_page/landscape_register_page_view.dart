import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/title.dart';

import '../../components/constants.dart';
import '../../components/custom_icon.dart';
import '../../components/custom_text_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/register_row.dart';

class LandscapeRegisterPageView extends StatelessWidget {
  const LandscapeRegisterPageView(
      {super.key,
      this.onPress,
      required this.emailController,
      required this.passController,
      this.toggleLogOrReg, required this.confPassController});

  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confPassController;
  final void Function()? onPress;
  final void Function()? toggleLogOrReg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTitle(
                    title: 'Lets create an account for you',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomIcon(
                    icon: Icons.chat_rounded,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RegisterRow(
                    onPress: toggleLogOrReg,
                    firstText: 'Already have an account?',
                    secondText: 'Login now',
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    height: 25,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
