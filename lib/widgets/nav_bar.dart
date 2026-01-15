import 'package:flutter/material.dart';
import '../features/home/homepage.dart';

class ResponsiveNavbar extends StatelessWidget implements PreferredSizeWidget {
  final MenuType activeMenu;
  final Function(MenuType) onMenuSelected;

  const ResponsiveNavbar({
    super.key,
    required this.activeMenu,
    required this.onMenuSelected,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      elevation: 2,
      centerTitle: false,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      title: Text(
        "Es Mambo Lasmi",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: isMobile
          ? []
          : [
              navbarButton(context, MenuType.home, "Home"),
              navbarButton(context, MenuType.product, "Product"),
              navbarButton(context, MenuType.about, "About"),
              const SizedBox(width: 20),
            ],
    );
  }

  Widget navbarButton(BuildContext context, MenuType menu, String label) {
    final theme = Theme.of(context);
    final bool isActive = menu == activeMenu;
    final Color themeBarColor =
        Theme.of(context).appBarTheme.backgroundColor ??
        Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => onMenuSelected(menu), // 🔥 FIX
        style: TextButton.styleFrom(
          backgroundColor: isActive
              ? theme.textTheme.bodyMedium!.color
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? themeBarColor : theme.textTheme.bodyMedium!.color,
          ),
        ),
      ),
    );
  }
}
