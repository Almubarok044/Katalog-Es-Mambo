import 'package:esmambolasmi/main.dart';
import 'package:flutter/material.dart';

class ResponsiveNavbar extends StatefulWidget implements PreferredSizeWidget {
  const ResponsiveNavbar({super.key});

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  String activeMenu = "Home";

  void setActive(String menu) {
    setState(() => activeMenu = menu);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return AppBar(
      elevation: 2,
      centerTitle: false,

      title: Text(
        "Es Mambo Lasmi",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),

      actions: isMobile
          ? [
              _themeSwitcher(), // tetap ditampilkan di mobile
              const SizedBox(width: 8),
            ]
          : [
              navbarButton("Home"),
              navbarButton("Produk"),
              navbarButton("Kontak"),
              navbarButton("Tentang"),
              const SizedBox(width: 20),

              // 🌞 SWITCH MODE
              _themeSwitcher(),

              const SizedBox(width: 20),
            ],
    );
  }

  Widget navbarButton(String title) {
    bool isActive = (title == activeMenu);
    final Color themeBarColor =
        Theme.of(context).appBarTheme.backgroundColor ??
        Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => setActive(title),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          backgroundColor: isActive ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            // teks aktif ikut warna AppBar (teal di light, purple di dark)
            color: isActive ? themeBarColor : Colors.white,
          ),
        ),
      ),
    );
  }

  // ===== THEME SWITCHER (SUN - SWITCH - MOON) =====
  Widget _themeSwitcher() {
    return Row(
      children: [
        const Icon(Icons.wb_sunny_outlined, size: 22),

        const SizedBox(width: 6),

        DarkModeSwitch(),

        const SizedBox(width: 6),

        const Icon(Icons.nights_stay_outlined, size: 22),
      ],
    );
  }
}
