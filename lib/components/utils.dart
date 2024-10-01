import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(defBorderRadius),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: defContentPaddingV, horizontal: defContentPaddingH),
          children: [
            CupertinoActivityIndicator(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        );
      });
}

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    // behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
    ),
    duration: const Duration(seconds: 5),
    backgroundColor: Colors.redAccent,
    action: SnackBarAction(
      label: gotItText,
      textColor: Theme.of(context).colorScheme.onErrorContainer,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Route createRoute(Widget page) {
  return PageRouteBuilder(transitionsBuilder: (ctx, anim1, anim2, widget) {
    const curve = Curves.easeInOut;
    final slideTween = Tween<Offset>(
        begin: const Offset(1.0, 0.0), end: Offset.zero
    ).chain(CurveTween(curve: curve));

    final fadeTween = Tween<double>(
        begin: 0.0, end: 1.0
    ).chain(CurveTween(curve: curve));

    final offsetAnim = anim1.drive(slideTween);
    final fadeAnim = anim1.drive(fadeTween);

    return SlideTransition(position: offsetAnim, child: FadeTransition(opacity: fadeAnim, child: widget,),);
  }, pageBuilder: (ctx, anim1, anim2) {
    return page;
  });
}
