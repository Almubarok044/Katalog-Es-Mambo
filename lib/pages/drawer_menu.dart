import 'package:esmambolasmi/pages/theme_provider.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String selectedMenu = "";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.drawerTheme.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            // === KONTEN SCROLL ===
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
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Hub: 0885693665006",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),

                  drawerItem(context, "Tentang", Icons.info_outline),

                  if (selectedMenu == "Tentang")
                    Padding(
                      padding: const EdgeInsets.all(16.0),
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
                ],
              ),
            ),

            // === FOOTER (TETAP DI BAWAH) ===
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: themeSwitcher(context),
            ),
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
