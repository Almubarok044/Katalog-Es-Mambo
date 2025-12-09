import 'package:esmambolasmi/pages/theme_provider.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.appBarTheme.backgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HEADER
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.transparent),
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
            const Divider(color: Colors.white, indent: 16, endIndent: 16),
            // Menu
            drawerItem(context, "Home", Icons.home_outlined),
            drawerItem(context, "Produk", Icons.local_mall_outlined),
            drawerItem(context, "Kontak", Icons.call_outlined),
            drawerItem(context, "Tentang", Icons.info_outline),

            const Spacer(),

            const Divider(color: Colors.white),
            themeSwitcher(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // tutup drawer
      },
    );
  }
}
