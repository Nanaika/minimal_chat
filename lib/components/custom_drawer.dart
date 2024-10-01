import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.onHomePress,
    required this.onSettingsPress,
    required this.onLogOutPress,
  });

  final void Function() onHomePress;
  final void Function() onSettingsPress;
  final void Function() onLogOutPress;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const CustomDrawerHeader(),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text(
                    homeText.toUpperCase(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: defaultPaddingH),
                    child: Icon(
                      CupertinoIcons.house_alt_fill,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    onHomePress.call();
                  },
                ),
                ListTile(
                  title: Text(
                    settingsText.toUpperCase(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: defaultPaddingH),
                    child: Icon(
                      CupertinoIcons.gear_alt_fill,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    onSettingsPress.call();
                  } ,
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    logOutText.toUpperCase(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: defaultPaddingH),
                    child: Icon(
                      CupertinoIcons.square_arrow_left_fill,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: onLogOutPress,
                ),
                const SizedBox(
                  height: 54,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
