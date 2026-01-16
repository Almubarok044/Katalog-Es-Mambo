import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.press});

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: press,
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.grey),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.blueGrey; // Warna saat ditekan
              }
              return null; // Gunakan default
            }),
          ),
          child: const Text("See more"),
        ),
      ],
    );
  }
}
