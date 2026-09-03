import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:esmambolasmi/features/home/home_screen.dart';
import 'package:esmambolasmi/features/products/screens/products_screen.dart';
import 'package:esmambolasmi/features/about/about_screen.dart';

Widget buildFooter(BuildContext context, {Key? key}) {
  final theme = Theme.of(context);
  final isDesktop = MediaQuery.of(context).size.width > 800;

  return Container(
    key: key,
    width: double.infinity,
    padding: const EdgeInsets.only(top: 60, bottom: 20, left: 40, right: 40),
    color: theme.appBarTheme.backgroundColor ?? const Color(0xFF1A1410),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 4, child: _buildBrandSection(theme)),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: _buildQuickLinks(context, theme),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: _buildContactSection(theme),
                      ),
                    ),
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBrandSection(theme),
                  const SizedBox(height: 40),
                  _buildQuickLinks(context, theme),
                  const SizedBox(height: 40),
                  _buildContactSection(theme),
                ],
              ),

            const SizedBox(height: 60),
            Divider(
              color: theme.appBarTheme.foregroundColor?.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 20),

            // Bottom Copyright
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "© 2026 Mohamad Almubarok — All Rights Reserved",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.appBarTheme.foregroundColor?.withValues(
                      alpha: 0.7,
                    ),
                    fontSize: 14,
                  ),
                ),
                if (isDesktop)
                  Row(
                    children: [
                      _buildHoverLink(context, "Privacy Policy", theme, () {}),
                      const SizedBox(width: 20),
                      _buildHoverLink(
                        context,
                        "Terms of Service",
                        theme,
                        () {},
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBrandSection(ThemeData theme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Es Mambo Lasmi",
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.appBarTheme.foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      const SizedBox(height: 15),
      Text(
        "Mengembalikan memori manis masa kecil Anda dengan es mambo kualitas premium yang dibuat dari 100% bahan alami.",
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.appBarTheme.foregroundColor?.withValues(alpha: 0.8),
          height: 1.5,
        ),
      ),
      const SizedBox(height: 25),
      Row(
        children: [
          _buildSocialIcon(
            FontAwesomeIcons.instagram,
            theme,
            "https://instagram.com",
          ),
          const SizedBox(width: 15),
          _buildSocialIcon(
            FontAwesomeIcons.tiktok,
            theme,
            "https://tiktok.com",
          ),
          const SizedBox(width: 15),
          _buildSocialIcon(
            FontAwesomeIcons.mapLocationDot,
            theme,
            "https://maps.app.goo.gl/QDkJ6eXnyDc7CcdJ7",
          ),
        ],
      ),
    ],
  );
}

Widget _buildQuickLinks(BuildContext context, ThemeData theme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Tautan Cepat",
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.appBarTheme.foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 20),
      _buildHoverLink(context, "Beranda", theme, () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false,
        );
      }),
      const SizedBox(height: 10),
      _buildHoverLink(context, "Produk", theme, () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const ProductsScreen()));
      }),
      const SizedBox(height: 10),
      _buildHoverLink(context, "Tentang", theme, () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const AboutScreen()));
      }),
    ],
  );
}

Widget _buildContactSection(ThemeData theme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Hubungi Kami",
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.appBarTheme.foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 20),
      _buildContactItem(
        Icons.location_on,
        "Cibinong, Bogor, Jawa Barat, Indonesia",
        theme,
      ),
      const SizedBox(height: 15),
      _buildContactItem(Icons.phone, "+62 856-9366-5006", theme),
      const SizedBox(height: 15),
      _buildContactItem(Icons.email, "esmambolasmi@gmail.com", theme),
    ],
  );
}

Widget _buildHoverLink(
  BuildContext context,
  String text,
  ThemeData theme,
  VoidCallback onTap,
) {
  return InkWell(
    onTap: onTap,
    hoverColor: Colors.transparent,
    child: Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.appBarTheme.foregroundColor?.withValues(alpha: 0.8),
      ),
    ),
  );
}

Widget _buildContactItem(IconData icon, String text, ThemeData theme) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: theme.appBarTheme.foregroundColor?.withValues(alpha: 0.8),
        size: 20,
      ),
      const SizedBox(width: 15),
      Expanded(
        child: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.appBarTheme.foregroundColor?.withValues(alpha: 0.8),
            height: 1.4,
          ),
        ),
      ),
    ],
  );
}

Widget _buildSocialIcon(FaIconData icon, ThemeData theme, String url) {
  return InkWell(
    onTap: () async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    },
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.appBarTheme.foregroundColor?.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: FaIcon(icon, color: theme.appBarTheme.foregroundColor, size: 20),
    ),
  );
}
