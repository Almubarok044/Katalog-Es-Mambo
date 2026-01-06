import 'package:carousel_slider/carousel_slider.dart';
import 'package:esmambolasmi/pages/drawer_menu.dart';
import 'package:esmambolasmi/pages/footer.dart';
import 'package:esmambolasmi/pages/nav_bar.dart';
import 'package:esmambolasmi/pages/product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey footerKey = GlobalKey();

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
    if (footerKey.currentContext == null) return;

    final RenderBox box =
        footerKey.currentContext!.findRenderObject() as RenderBox;

    final Offset footerOffset = box.localToGlobal(Offset.zero);
    final double screenHeight = MediaQuery.of(context).size.height;

    final bool visible = footerOffset.dy < screenHeight - 80;

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

  String activeMenu = "Home";

  void setActive(String menu) {
    setState(() {
      activeMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveNavbar(),
      drawer: DrawerMenu(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const SizedBox(height: 40),
              // ================= CAROUSEL =================
              CarouselSlider(
                items: [
                  Image.asset('assets/product/coklat.jpg', fit: BoxFit.cover),
                  Image.asset('assets/product/tiramisu.jpg', fit: BoxFit.cover),
                  Image.asset('assets/product/taro.jpg', fit: BoxFit.cover),
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
                  Image.asset('assets/product/mangga.jpg', fit: BoxFit.cover),
                  Image.asset(
                    'assets/product/bubble_gum.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset('assets/product/oreo.jpg', fit: BoxFit.cover),
                  Image.asset(
                    'assets/product/blueberry.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  height: 200,
                  viewportFraction: 2.0,
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  productCard(
                    "Coklat",
                    "🍫",
                    "Coklat Rasa klasik yang tak pernah salah! Manisnya coklat bikin nagih dari hisapan pertama.",
                    "assets/product/coklat.jpg",
                  ),
                  productCard(
                    "Tiramisu",
                    "☕",
                    "Tiramisu Kombinasi kopi ringan dan krim manis ala Italia, pas banget buat kamu yang suka rasa elegan dan unik.",
                    "assets/product/tiramisu.jpg",
                  ),
                  productCard(
                    "Taro",
                    "🌸",
                    "Taro Rasa manis lembut dari talas ungu yang khas, bikin suasana ngemil lebih seru dan berwarna.",
                    "assets/product/taro.jpg",
                  ),
                  productCard(
                    "Red Velvet",
                    "🍰",
                    "Red Velvet Manis gurih dengan sentuhan creamy, kini hadir dalam bentuk es mambo yang segar.",
                    "assets/product/red_velvet.jpg",
                  ),
                  productCard(
                    "Strawberry",
                    "🍓",
                    "Strawberry Asam manis buah stroberi segar, bikin setiap gigitan terasa menyegarkan dan ceria.",
                    "assets/product/strawberry.jpg",
                  ),
                  productCard(
                    "Green Tea",
                    "🍵",
                    "Green Tea Segarnya teh hijau dengan aroma khas yang menenangkan, cocok untuk pecinta rasa oriental.",
                    "assets/product/green_tea.jpg",
                  ),
                  productCard(
                    "Mangga",
                    "🥭",
                    "Mangga Rasa tropis mangga yang manis dan juicy, sempurna untuk dinikmati di siang yang panas.",
                    "assets/product/mangga.jpg",
                  ),
                  productCard(
                    "Bubble Gum",
                    "🍬",
                    " Bubble Gum Manisnya permen karet dalam bentuk es mambo, warna-warni ceria dengan rasa yang bikin nostalgia.",
                    "assets/product/bubble_gum.jpg",
                  ),
                  productCard(
                    "Oreo",
                    "🍪",
                    "Oreo Crunchy dan creamy ala biskuit oreo yang legendaris, berpadu dengan lembutnya es mambo.",
                    "assets/product/oreo.jpg",
                  ),
                  productCard(
                    "Blueberry",
                    "🍇",
                    "Rasa segar buah blueberry dengan sentuhan manis-asam yang pas, bikin lidah langsung jatuh cinta.",
                    "assets/product/blueberry.jpg",
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // ================= JAM BUKA =================
              const Text(
                'Jam Operasional',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Setiap Hari\n07.00 - 20.00',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 40),
              // ================= FOOTER COPYRIGHT =================
              buildFooter(key: footerKey, context),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isFooterVisible
            ? FloatingActionButton(
                key: const ValueKey('top'),
                tooltip: 'Kembali ke atas',
                splashColor: Colors.blueAccent,
                backgroundColor: Colors.blueGrey,
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
                splashColor: Colors.greenAccent,
                backgroundColor: Colors.green,
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
