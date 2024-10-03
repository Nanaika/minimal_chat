import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    super.key,
    this.onPress,
  });

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: const Icon(CupertinoIcons.pencil),
    );
  }
}