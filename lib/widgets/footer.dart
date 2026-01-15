import 'package:flutter/material.dart';

Widget buildFooter(BuildContext context, {Key? key}) {
  final theme = Theme.of(context);

  return Container(
    key: key, // ⬅️ INI PENTING
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    color: theme.appBarTheme.backgroundColor,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// =====================
        /// TOP SECTION
        /// =====================
        Text(
          "© 2025 Mohamad Almubarok — All Rights Reserved",
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall,
        ),

        const SizedBox(height: 5),

        Divider(
          color: theme.appBarTheme.foregroundColor ?? theme.iconTheme.color,
          thickness: 1,
          indent: 90, // jarak dari kiri
          endIndent: 90, // jarak dari kanan
        ),
      ],
    ),
  );
}
