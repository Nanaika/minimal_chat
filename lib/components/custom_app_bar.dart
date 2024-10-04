import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showActions = true,
    this.showLeading = true,
    this.icon = CupertinoIcons.bars,
    this.onLeadingPress,
  });

  final String title;
  final bool showActions;
  final bool showLeading;
  final IconData icon;
  final void Function()? onLeadingPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 54,
          child: Row(
            children: [
              if (showLeading)
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                    onLeadingPress?.call();
                  },
                  icon: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              if (showActions)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ThemeBloc>().toggleTheme();
                      },
                      icon: Icon(
                        CupertinoIcons.sun_min_fill,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }
}
