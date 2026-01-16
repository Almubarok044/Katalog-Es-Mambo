import 'package:carousel_slider/carousel_slider.dart';
import 'package:esmambolasmi/widgets/category_card.dart';
import 'package:esmambolasmi/features/home/hero_section.dart';
import 'package:esmambolasmi/features/home/popular_products.dart';
import 'package:esmambolasmi/features/about/about.dart';
import 'package:esmambolasmi/widgets/drawer_menu.dart';
import 'package:esmambolasmi/widgets/footer.dart';
import 'package:esmambolasmi/widgets/nav_bar.dart';
import 'package:esmambolasmi/features/products/products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum MenuType { home, product, about }

class _HomePageState extends State<HomePage> {
  MenuType activeMenu = MenuType.home;
  final ScrollController scrollController = ScrollController();

  bool isFooterVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(handleScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(handleScroll);
    scrollController.dispose();
    super.dispose();
  }

  void handleScroll() {
    if (!scrollController.hasClients) return;

    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    // Jika scroll sudah dekat ke bawah (footer)
    final visible = currentScroll > maxScroll - 200;

    if (visible != isFooterVisible) {
      setState(() => isFooterVisible = visible);
    }
  }

  // =============== WA FUNCTION ES MAMBO ===============
  void openWhatsAppEsMambo() async {
    const String message = "Halo, saya ingin pesan Es Mambo Lasmi";

    final Uri url = Uri.parse(
      "https://wa.me/6285693665006?text=${Uri.encodeComponent(message)}",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak dapat membuka WhatsApp");
    }
  }

  void onDrawerMenuSelected(MenuType menu) {
    setState(() => activeMenu = menu);
    Navigator.pop(context); // pasti drawer
    handleMenu(menu);
  }

  void onNavbarMenuSelected(MenuType menu) {
    setState(() => activeMenu = menu);
    handleMenu(menu);
  }

  void handleMenu(MenuType menu) {
    switch (menu) {
      case MenuType.home:
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
        break;

      case MenuType.product:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Products()),
        );
        break;

      case MenuType.about:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const About()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: ResponsiveNavbar(
        onMenuSelected: onNavbarMenuSelected,
        activeMenu: activeMenu,
      ),
      drawer: DrawerMenu(
        onMenuSelected: onDrawerMenuSelected,
        activeMenu: activeMenu,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),

            child: SingleChildScrollView(
              controller: scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ================= CONTENT ATAS =================
                    HeroSection(),
                    const Categories(),
                    const SizedBox(height: 20),
                    // ================= CAROUSEL =================
                    CarouselSlider(
                      items: [
                        Image.asset(
                          'assets/product/coklat.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/tiramisu.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/taro.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/red_velvet.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/strawberry.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/green_tea.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/mangga.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/bubble_gum.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/oreo.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/product/blueberry.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 250,
                        viewportFraction: 2.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const PopularProducts(),
                    const SizedBox(height: 20),
                    Text(
                      'Jam Operasional',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: 180, // sesuaikan
                        height: 180,
                        child: Image.asset(
                          'assets/icon/JamBuka.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ================= FOOTER =================
                    buildFooter(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // ⬇️ PINDAHKAN KE SINI
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isFooterVisible
            ? FloatingActionButton(
                key: const ValueKey('top'),
                tooltip: 'Kembali ke atas',
                backgroundColor: Colors.blueGrey,
                splashColor: Colors.blueAccent,
                elevation: 10,
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 37,
                ),
              )
            : FloatingActionButton(
                key: const ValueKey('wa'),
                tooltip: 'Pesan via WhatsApp',
                backgroundColor: Colors.green,
                splashColor: Colors.greenAccent,
                elevation: 10,
                onPressed: openWhatsAppEsMambo,
                child: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                  size: 37,
                ),
              ),
      ),
    );
  }
}
