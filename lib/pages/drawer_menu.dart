import 'package:esmambolasmi/pages/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  // =============== WA FUNCTION ===============
  void openWhatsApp() async {
    final Uri url = Uri.parse(
      "https://wa.me/6285693665006?text=Halo%20saya%20ingin%20pesan%20Es%20Mambo%20Lasmi",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak dapat membuka WhatsApp");
    }
  }

  String selectedMenu = "";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Drawer(
      backgroundColor: theme.drawerTheme.backgroundColor,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            // === SCROLL AREA ===
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: theme.appBarTheme.backgroundColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/EsMamboLasmi.png', height: 75),
                        const SizedBox(height: 10),
                        const Text(
                          "Es Mambo Lasmi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    color: theme.iconTheme.color,
                    indent: 16,
                    endIndent: 16,
                  ),

                  drawerItem(context, "Home", Icons.home_outlined),
                  drawerItem(context, "Produk", Icons.local_mall_outlined),
                  drawerItem(context, "Kontak", Icons.call_outlined),

                  if (selectedMenu == "Kontak")
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: theme.textTheme.bodyMedium!.color,
                          backgroundColor:
                              Colors.transparent, // kalau mau transparan
                        ),
                        onPressed: () {
                          // Ganti dengan nomor WA customer
                          openWhatsApp();
                        },
                        icon: FaIcon(FontAwesomeIcons.whatsapp),
                        label: Text(
                          'Hubungi kami di WhatsApp',
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ),
                    ),

                  drawerItem(context, "Tentang", Icons.info_outline),

                  if (selectedMenu == "Tentang")
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "✨ Es Mambo Aneka Rasa – Segar, Nikmat, dan Bikin Nostalgia! ✨ Dibuat dari bahan pilihan dengan cita rasa manis, segar, dan lembut di mulut, cocok dinikmati semua kalangan.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),

                  Divider(
                    color: theme.iconTheme.color,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // ✅ LANDSCAPE: switch ikut scroll
                  if (isLandscape) themeSwitcher(context),
                ],
              ),
            ),

            // ✅ PORTRAIT: switch nempel bawah
            if (!isLandscape) themeSwitcher(context),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: theme.iconTheme.color, // AUTO light/dark
      ),
      title: Text(
        title,
        style: TextStyle(
          color: theme.textTheme.bodyMedium!.color, // AUTO light/dark
        ),
      ),
      onTap: () {
        setState(() {
          selectedMenu = title;
        });
      },
    );
  }
}
