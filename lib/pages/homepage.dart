import 'package:carousel_slider/carousel_slider.dart';
import 'package:esmambolasmi/pages/drawer_menu.dart';
import 'package:esmambolasmi/pages/footer.dart';
import 'package:esmambolasmi/pages/nav_bar.dart';
import 'package:esmambolasmi/pages/product_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // =============== WA FUNCTION ===============
  void openWhatsApp() async {
    final Uri url = Uri.parse(
      "https://wa.me/6285693665006?text=Halo%20saya%20ingin%20pesan%20Es%20Mambo%20Lasmi",
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
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // ================= CAROUSEL =================
              CarouselSlider(
                items: [
                  Image.asset('assets/coklat.jpg', fit: BoxFit.cover),
                  Image.asset('assets/tiramisu.jpg', fit: BoxFit.cover),
                  Image.asset('assets/taro.jpg', fit: BoxFit.cover),
                  Image.asset('assets/red_velvet.jpg', fit: BoxFit.cover),
                  Image.asset('assets/strawberry.jpg', fit: BoxFit.cover),
                  Image.asset('assets/green_tea.jpg', fit: BoxFit.cover),
                  Image.asset('assets/mangga.jpg', fit: BoxFit.cover),
                  Image.asset('assets/bubble_gum.jpg', fit: BoxFit.cover),
                  Image.asset('assets/oreo.jpg', fit: BoxFit.cover),
                  Image.asset('assets/blueberry.jpg', fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  height: 200,
                  viewportFraction: 1.0,
                ),
              ),
              const SizedBox(height: 20),
              // ================= PRODUCT GRID =================
              const Text(
                'Katalog Rasa',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  productCard(
                    "Coklat",
                    "🍫",
                    "Coklat Rasa klasik yang tak pernah salah! Manisnya coklat bikin nagih dari hisapan pertama.",
                    "assets/coklat.jpg",
                  ),
                  productCard(
                    "Tiramisu",
                    "☕",
                    "Tiramisu Kombinasi kopi ringan dan krim manis ala Italia, pas banget buat kamu yang suka rasa elegan dan unik.",
                    "assets/tiramisu.jpg",
                  ),
                  productCard(
                    "Taro",
                    "🌸",
                    "Taro Rasa manis lembut dari talas ungu yang khas, bikin suasana ngemil lebih seru dan berwarna.",
                    "assets/taro.jpg",
                  ),
                  productCard(
                    "Red Velvet",
                    "🍰",
                    "Red Velvet Manis gurih dengan sentuhan creamy, kini hadir dalam bentuk es mambo yang segar.",
                    "assets/red_velvet.jpg",
                  ),
                  productCard(
                    "Strawberry",
                    "🍓",
                    "Strawberry Asam manis buah stroberi segar, bikin setiap gigitan terasa menyegarkan dan ceria.",
                    "assets/strawberry.jpg",
                  ),
                  productCard(
                    "Green Tea",
                    "🍵",
                    "Green Tea Segarnya teh hijau dengan aroma khas yang menenangkan, cocok untuk pecinta rasa oriental.",
                    "assets/green_tea.jpg",
                  ),
                  productCard(
                    "Mangga",
                    "🥭",
                    "Mangga Rasa tropis mangga yang manis dan juicy, sempurna untuk dinikmati di siang yang panas.",
                    "assets/mangga.jpg",
                  ),
                  productCard(
                    "Bubble Gum",
                    "🍬",
                    " Bubble Gum Manisnya permen karet dalam bentuk es mambo, warna-warni ceria dengan rasa yang bikin nostalgia.",
                    "assets/bubble_gum.jpg",
                  ),
                  productCard(
                    "Oreo",
                    "🍪",
                    "Oreo Crunchy dan creamy ala biskuit oreo yang legendaris, berpadu dengan lembutnya es mambo.",
                    "assets/oreo.jpg",
                  ),
                  productCard(
                    "Blueberry",
                    "🍇",
                    "Rasa segar buah blueberry dengan sentuhan manis-asam yang pas, bikin lidah langsung jatuh cinta.",
                    "assets/blueberry.jpg",
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // ================= WA BUTTON =================
              ElevatedButton(
                onPressed: openWhatsApp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Pesan via WhatsApp',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              // ================= JAM BUKA =================
              const Text(
                'Jam Operasional',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const Text(
                'Setiap Hari\n07.00 - 20.00',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              // ================= FOOTER COPYRIGHT =================
              buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }
}
