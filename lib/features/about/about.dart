import 'package:esmambolasmi/features/social%20media/social_media.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      key: key, // ⬅️ INI PENTING
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: theme.appBarTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// =====================
          /// TOP SECTION
          /// =====================
          Image.asset(
            'assets/flutter/lockup_built-w-flutter/lockup_built-w-flutter_wht.png',
            height: 50,
          ),

          const SizedBox(height: 10),

          Divider(
            color: theme.appBarTheme.foregroundColor ?? theme.iconTheme.color,
            thickness: 1,
            indent: 90, // jarak dari kiri
            endIndent: 90, // jarak dari kanan
          ),

          const SizedBox(height: 10),

          /// =====================
          /// BOTTOM SECTION
          /// =====================
          Text(
            "Butuh website atau aplikasi?",
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            "Hubungi saya melalui social media di bawah ini",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
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
    );
  }
}
