import 'package:esmambolasmi/features/home/home_screen.dart';
import 'package:esmambolasmi/theme/theme_provider.dart';
import 'package:material_ui/material_ui.dart';

class DrawerMenu extends StatelessWidget {
  final MenuType activeMenu;
  final void Function(MenuType) onMenuSelected;

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
                    "Beranda",
                    Icons.home_outlined,
                  ),
                  drawerItem(
                    context,
                    MenuType.product,
                    "Produk",
                    Icons.local_mall_outlined,
                  ),
                  drawerItem(
                    context,
                    MenuType.about,
                    "Tentang",
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
    final primaryColor = theme.primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Material(
        color: isActive
            ? primaryColor.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: primaryColor.withValues(alpha: 0.2),
          highlightColor: primaryColor.withValues(alpha: 0.1),
          onTap: () => onMenuSelected(menu),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive ? primaryColor : theme.iconTheme.color,
                ),
                const SizedBox(width: 20),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive
                        ? primaryColor
                        : theme.textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
