import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/theme_bloc.dart';
import 'package:minimal_chat_app/components/constants.dart';
import 'package:minimal_chat_app/components/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: CustomAppBar(
              title: settingsText,
              icon: CupertinoIcons.chevron_back,
              showActions: false,
              onLeadingPress: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          const DarkModeTile()
        ],
      ),
    );
  }
}

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddingH),
      padding: const EdgeInsets.all(defContentPaddingH),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(defBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dark mode',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          CupertinoSwitch(
              value: context.read<ThemeBloc>().isDark,
              onChanged: (value) {
                context.read<ThemeBloc>().toggleTheme();
              }),
        ],
      ),
    );
  }
}
