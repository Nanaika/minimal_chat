import 'package:flutter/material.dart';

import 'constants.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({
    super.key,
    this.onPress,
    required this.firstText,
    required this.secondText,
  });

  final Function()? onPress;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defBorderRadius),
              ),
            ),
          ),
          onPressed: onPress,
          child: Text(
            secondText,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
