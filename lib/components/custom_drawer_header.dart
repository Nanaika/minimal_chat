import 'package:flutter/material.dart';

import 'constants.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 15,
              bottom: MediaQuery.of(context).size.height / 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: Icon(
                    appIcon,
                    color: Theme.of(context).colorScheme.primary,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    )
        : const SizedBox.shrink();
  }
}