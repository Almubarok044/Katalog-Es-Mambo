import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ----------------- LIGHT MODE (EARTHY PASTEL) -----------------
  static final tealLightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFF8E7), // Warm cream background
    primaryColor: const Color(0xFFD4A373), // Earthy tan
    cardColor: Colors.white, // Distinct card background

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFD4A373), // Warm tan
      foregroundColor: Colors.white, // White text on appbar
      elevation: 2,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFFFFF8E7),
    ),

    iconTheme: const IconThemeData(
      color: Color(0xFF5D4037), // Dark brown icons
    ),

    textTheme: GoogleFonts.outfitTextTheme(
      const TextTheme(
        bodyMedium: TextStyle(color: Color(0xFF4E342E)), // Dark brown text for better readability
        titleLarge: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold),
      ),
    ),
    
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFBC6C25), // Deeper earthy tone
      foregroundColor: Colors.white,
    ),
  );

  // ----------------- DARK MODE (ELEGANT EARTHY) -----------------
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF2C241B), // Dark earthy brown
    primaryColor: const Color(0xFFD4A373),
    cardColor: const Color(0xFF3E2723), // Distinct dark card background

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1410),
      foregroundColor: Color(0xFFE6CCB2), // Soft pastel text
      elevation: 2,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    ),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFD4A373),
      secondary: Color(0xFFFAEDCD),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF1E1814),
    ),

    iconTheme: const IconThemeData(
      color: Color(0xFFE6CCB2),
    ),

    textTheme: GoogleFonts.outfitTextTheme(
      const TextTheme(
        bodyMedium: TextStyle(color: Color(0xFFE6CCB2)),
        titleLarge: TextStyle(color: Color(0xFFFAEDCD), fontWeight: FontWeight.bold),
      ),
    ),

    switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        return const Color(0xFFD4A373);
      }),
    ),
    
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFD4A373),
      foregroundColor: Color(0xFF1A1410),
    ),
  );
}
