import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.title, this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingH),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: defContentPaddingH),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defBorderRadius),
              ),
            ),
            side: WidgetStateProperty.all(
              BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
          child: Text(title),
        ),
      ),
    );
  }
}