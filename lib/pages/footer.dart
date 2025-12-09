import 'package:flutter/material.dart';

Widget buildFooter(BuildContext context) {
  final theme = Theme.of(context);

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    color: theme.appBarTheme.backgroundColor,
    child: Text(
      "© 2025 Mohamad Almubarok — All Rights Reserved",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: theme.appBarTheme.foregroundColor ?? Colors.white,
      ),
    ),
  );
}
