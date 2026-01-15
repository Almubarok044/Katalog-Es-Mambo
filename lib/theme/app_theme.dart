import 'package:flutter/material.dart';

class AppTheme {
  // ----------------- LIGHT MODE (TEAL) -----------------
  static final tealLightTheme = ThemeData(
    brightness: Brightness.light,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.tealAccent,
      foregroundColor: Colors.black, // 🔥 INI KUNCINYA
    ),

    // Tambahan (tidak mengubah struktur lama)
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),

    iconTheme: const IconThemeData(
      color: Colors.black87, // icon light mode
    ),

    // textTheme asal kamu → putih → saya BENERKAN ke hitam untuk light mode
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black87)),
  );

  // ----------------- DARK MODE (PURPLE) -----------------
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff212D3B),
      foregroundColor: Colors.white,
    ),

    // Ini tetap seperti kode kamu (saya tidak ubah)
    colorScheme: ColorScheme.dark(primary: Colors.grey.shade500),

    // Tambahan drawer + icon
    drawerTheme: DrawerThemeData(backgroundColor: Color(0xff17212B)),

    iconTheme: const IconThemeData(
      color: Colors.white, // icon dark mode
    ),

    // textTheme asli kamu → putih → dibiarkan (benar untuk dark mode)
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),

    switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        return Colors.grey.shade500;
      }),
    ),
  );
}
