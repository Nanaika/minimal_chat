import 'package:flutter/material.dart';

class LoadingBlock extends StatelessWidget {
  const LoadingBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'Loading ...',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
