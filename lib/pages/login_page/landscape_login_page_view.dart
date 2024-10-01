import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/title.dart';

import '../../components/constants.dart';
import '../../components/custom_icon.dart';
import '../../components/custom_text_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/register_row.dart';

class LandscapeLoginPageView extends StatelessWidget {
  const LandscapeLoginPageView(
      {super.key,
      this.onPress,
      required this.emailController,
      required this.passController, this.toggleLogOrReg});

  final TextEditingController emailController;
  final TextEditingController passController;
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
                    title: welcomeText,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomIcon(
                    icon: appIcon,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RegisterRow(
                    onPress: toggleLogOrReg,
                    firstText: notMemberText,
                    secondText: registerNowText,
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
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          title: logInCapsText,
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
