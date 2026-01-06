import 'package:esmambolasmi/pages/social_media.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        Column(
          children: [
            Image.asset(
              'assets/flutter/lockup_built-w-flutter/lockup_built-w-flutter_wht.png',
              height: 50,
            ),
            const SizedBox(height: 15),
            Text(
              "© 2025 Mohamad Almubarok — All Rights Reserved",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.appBarTheme.foregroundColor ?? Colors.white,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Divider(
          color: theme.appBarTheme.foregroundColor ?? Colors.white,
          thickness: 1,
        ),

        const SizedBox(height: 10),

        /// =====================
        /// BOTTOM SECTION
        /// =====================
        Column(
          children: [
            Text(
              "Butuh website atau aplikasi?",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.appBarTheme.foregroundColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Hubungi saya melalui social media di bawah ini",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.appBarTheme.foregroundColor ?? Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 16,
              alignment: WrapAlignment.center,
              children: [
                socialIcon(
                  icon: FontAwesomeIcons.whatsapp,
                  backgroundColor: const Color(0xFF25D366),
                  splashColor: Colors.greenAccent,
                  onTap: openWhatsApp,
                ),
                socialIcon(
                  icon: FontAwesomeIcons.instagram,
                  backgroundColor: const Color(0xFFE4405F),
                  splashColor: Colors.pinkAccent,
                  onTap: openInstagram,
                ),
                socialIcon(
                  icon: FontAwesomeIcons.github,
                  backgroundColor: Colors.black,
                  splashColor: Colors.grey,
                  onTap: openGitHub,
                ),
                socialIcon(
                  icon: FontAwesomeIcons.linkedin,
                  backgroundColor: const Color(0xFF0A66C2),
                  splashColor: Colors.blueAccent,
                  onTap: openLinkedIn,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget socialIcon({
  required IconData icon,
  required VoidCallback onTap,
  Color backgroundColor = Colors.grey,
  Color splashColor = Colors.white24,
  Color iconColor = Colors.white,
  double size = 56, // default FAB size
  double elevation = 8,
}) {
  return Material(
    color: backgroundColor,
    elevation: elevation,
    shape: const CircleBorder(),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      splashColor: splashColor,
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: FaIcon(icon, size: size * 0.5, color: iconColor),
        ),
      ),
    ),
  );
}
