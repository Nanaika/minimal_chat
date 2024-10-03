import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.email, this.onPress});

  final String email;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        CupertinoIcons.profile_circled,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(email),
      onTap: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
      ),
      tileColor: Theme.of(context).colorScheme.secondary,
      textColor: Theme.of(context).colorScheme.primary,
    );
  }
}
