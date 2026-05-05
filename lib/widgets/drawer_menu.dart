import 'package:esmambolasmi/features/home/homepage.dart';
import 'package:esmambolasmi/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final MenuType activeMenu;
  final Function(MenuType) onMenuSelected;

  const DrawerMenu({
    super.key,
    required this.activeMenu,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        Image.asset('assets/icon/EsMamboLasmi.png', height: 75),
                        const SizedBox(height: 10),
                        Text(
                          "Es Mambo Lasmi",
                          style: TextStyle(
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
                  drawerItem(
                    context,
                    MenuType.home,
                    "Home",
                    Icons.home_outlined,
                  ),
                  drawerItem(
                    context,
                    MenuType.product,
                    "Product",
                    Icons.local_mall_outlined,
                  ),
                  drawerItem(
                    context,
                    MenuType.about,
                    "About",
                    Icons.info_outline,
                  ),
                ],
              ),
            ),
            // ✅ LANDSCAPE: switch ikut scroll
            if (isLandscape) themeSwitcher(context),

            // ✅ PORTRAIT: switch nempel bawah
            if (!isLandscape) themeSwitcher(context),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(
    BuildContext context,
    MenuType menu,
    String label,
    IconData icon,
  ) {
    final bool isActive = menu == activeMenu;
    final theme = Theme.of(context);

    return ListTile(
      selected: isActive,
      splashColor: Colors.blueGrey,
      leading: Icon(
        icon,
        color: theme.iconTheme.color, // AUTO light/dark
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: theme.textTheme.bodyMedium!.color, // AUTO light/dark
        ),
      ),
      onTap: () => onMenuSelected(menu),
    );
  }
}
