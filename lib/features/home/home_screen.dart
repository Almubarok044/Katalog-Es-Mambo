import 'package:carousel_slider/carousel_slider.dart';
import 'package:esmambolasmi/features/about/about_screen.dart';
import 'package:esmambolasmi/features/products/screens/products_screen.dart';
import 'package:esmambolasmi/widgets/category_card.dart';
import 'package:esmambolasmi/widgets/drawer_menu.dart';
import 'package:esmambolasmi/widgets/footer.dart';
import 'package:esmambolasmi/widgets/hero_section.dart';
import 'package:esmambolasmi/widgets/nav_bar.dart';
import 'package:esmambolasmi/widgets/popular_products.dart';
import 'package:esmambolasmi/widgets/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum MenuType { home, product, about }

class _HomeScreenState extends State<HomeScreen> {
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

    // Munculkan tombol 'ke atas' jika sudah scroll melewati setengah halaman
    final visible = currentScroll > (maxScroll / 2);

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
          MaterialPageRoute(builder: (_) => const ProductsScreen()),
        ).then((_) {
          setState(() {
            activeMenu = MenuType.home;
          });
        });
        break;

      case MenuType.about:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AboutScreen()),
        ).then((_) {
          setState(() {
            activeMenu = MenuType.home;
          });
        });
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

      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ================= CONTENT ATAS =================
                HeroSection(),

                const SizedBox(height: 80),
                // ================= ABOUT / STORY SECTION =================
                _buildSectionHeader(
                  theme,
                  title: 'Mengapa Es Mambo Lasmi?',
                  subtitle:
                      'Dibuat dengan 100% bahan alami, tanpa pemanis buatan, menyajikan rasa klasik yang selalu dirindukan.',
                ),
                const SizedBox(height: 40),
                const Categories(),

                const SizedBox(height: 100),

                // ================= PRODUK UTAMA: ES MAMBO =================
                _buildSectionHeader(
                  theme,
                  title: 'Produk Utama: Es Mambo Lasmi',
                  subtitle:
                      'Nikmati kesegaran murni dalam setiap gigitan. Tersedia dalam berbagai varian rasa favorit.',
                ),
                const SizedBox(height: 40),
                CarouselSlider(
                  items: [
                    'assets/product/esmambo/coklat.jpg',
                    'assets/product/esmambo/tiramisu.jpg',
                    'assets/product/esmambo/taro.jpg',
                    'assets/product/esmambo/red_velvet.jpg',
                    'assets/product/esmambo/strawberry.jpg',
                    'assets/product/esmambo/green_tea.jpg',
                    'assets/product/esmambo/mangga.jpg',
                    'assets/product/esmambo/bubble_gum.jpg',
                    'assets/product/esmambo/oreo.jpg',
                    'assets/product/esmambo/blueberry.jpg',
                  ].map((path) => _buildProductCard(path)).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 350,
                    enlargeCenterPage: true,
                    viewportFraction: MediaQuery.of(context).size.width > 800
                        ? 0.3
                        : 0.6,
                  ),
                ),

                const SizedBox(height: 100),

                // ================= SPESIAL OFERS & POPULAR =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  color: theme.primaryColor.withValues(alpha: 0.05),
                  child: Column(
                    children: [
                      SpecialOffers(),
                      const SizedBox(height: 60),
                      const PopularProducts(),
                    ],
                  ),
                ),

                const SizedBox(height: 100),

                // ================= PRODUK KEDUA: HAMPERS KUE LEBARAN =================
                _buildSectionHeader(
                  theme,
                  title: 'Hampers Kue Lebaran Premium',
                  subtitle:
                      'Pilihan elegan untuk momen spesial di bulan Ramadhan. Berbagi kebahagiaan dengan rasa premium.',
                ),
                const SizedBox(height: 40),
                _buildHampersGrid(context),

                const SizedBox(height: 100),

                // ================= PRODUK KETIGA: ES JELLY =================
                _buildSectionHeader(
                  theme,
                  title: 'Kesegaran Es Jelly',
                  subtitle:
                      'Paduan kenyal dan manis yang menyegarkan dahaga Anda.',
                ),
                const SizedBox(height: 40),
                _buildEsJellyGrid(context),

                const SizedBox(height: 100),

                // ================= JAM OPERASIONAL =================
                _buildSectionHeader(
                  theme,
                  title: 'Jam Operasional',
                  subtitle: 'Kami siap melayani pesanan Anda setiap hari.',
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: theme.primaryColor.withValues(alpha: 0.2),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        'assets/icon/JamBuka.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: [const Spacer(), buildFooter(context)]),
          ),
        ],
      ),

      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isFooterVisible
            ? FloatingActionButton(
                key: const ValueKey('top'),
                tooltip: 'Kembali ke atas',
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(Icons.keyboard_arrow_up, size: 37),
              )
            : FloatingActionButton(
                key: const ValueKey('wa'),
                tooltip: 'Pesan via WhatsApp',
                backgroundColor: Colors.green,
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

  // ---------------- HELPER WIDGETS FOR WEB NATIVE LAYOUT ----------------

  Widget _buildSectionHeader(
    ThemeData theme, {
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                height: 1.6,
                color: theme.iconTheme.color?.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildHampersGrid(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final items = [
      'assets/product/kue/hampers/hamperskue1.png',
      'assets/product/kue/hampers/hamperskue2.png',
      // 'assets/product/kue/hampers/hamperskue5.png',
      'assets/product/kue/hampers/hamperskue3.png',
      'assets/product/kue/hampers/hamperskue4.png',
    ];

    return isDesktop
        ? Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: items.map((path) {
              return SizedBox(
                width: 300,
                height: 300,
                child: _buildProductCard(path),
              );
            }).toList(),
          )
        : CarouselSlider(
            items: items.map((path) => _buildProductCard(path)).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 280,
              enlargeCenterPage: true,
              viewportFraction: 0.75,
            ),
          );
  }

  Widget _buildEsJellyGrid(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final items = [
      'assets/product/esjelly/coklat1.png',
      'assets/product/esjelly/cappuccino1.png',
      'assets/product/esjelly/mangga1.png',
      'assets/product/esjelly/strawberry1.png',
      'assets/product/esjelly/melon1.png',
      'assets/product/esjelly/anggur1.png',
    ];

    return isDesktop
        ? Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: items.map((path) {
              return SizedBox(
                width: 250,
                height: 250,
                child: _buildProductCard(path),
              );
            }).toList(),
          )
        : CarouselSlider(
            items: items.map((path) => _buildProductCard(path)).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 280,
              enlargeCenterPage: true,
              viewportFraction: 0.75,
            ),
          );
  }
}
