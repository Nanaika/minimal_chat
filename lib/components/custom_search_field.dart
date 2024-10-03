import 'package:flutter/material.dart';

import 'constants.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscured = false,
    required this.textInputType,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isObscured;
  final TextInputType textInputType;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddingH),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defBorderRadius),
          color: Theme.of(context).colorScheme.secondary),
      child: TextField(
        onSubmitted: (text) {},
        textInputAction: TextInputAction.search,
        keyboardType: textInputType,
        obscureText: isObscured,
        controller: controller,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: defContentPaddingV, horizontal: defContentPaddingH),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(defBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(defBorderRadius),
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
