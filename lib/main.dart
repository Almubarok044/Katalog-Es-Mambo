import 'package:carousel_slider/carousel_slider.dart';
import 'package:esmambolasmi/pages/app_theme.dart';
import 'package:esmambolasmi/pages/nav_bar.dart';
import 'package:esmambolasmi/pages/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    final appThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemeState.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light,
      home: HomePage(),
    );
  }
}

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

  Widget productCard(String name, String icon, String desc, String img) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ==== GAMBAR TINGGI (TIDAK TERPOTONG) ====
          SizedBox(
            height: 250, // Tinggi cukup untuk gambar es mambo
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                img,
                fit: BoxFit.contain, // Tidak memotong gambar
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ==== JUDUL ====
          Text(
            "$icon $name",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 6),

          // ==== DESKRIPSI ====
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // ================= DRAWER ITEM =================
  Widget _drawerItem({required String title, required IconData icon}) {
    bool isActive = title == activeMenu;

    // gunakan warna teks putih selalu agar kontras terhadap gradient
    const Color normalTextColor = Colors.white;

    // highlight background untuk item aktif (sesuaikan brightness)
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final Color activeTileColor = isLight
        ? Colors
              .white10 // ringan pada theme terang
        : Colors.black12; // sedikit lebih gelap pada theme gelap

    return ListTile(
      leading: Icon(icon, color: normalTextColor),
      title: Text(
        title,
        style: TextStyle(
          color: normalTextColor, // tetap putih (tidak berubah saat ganti mode)
          fontSize: 18,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: isActive ? activeTileColor : Colors.transparent,
      onTap: () {
        setActive(title);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveNavbar(),
      // Drawer otomatis muncul saat mode mobile
      // ====== DRAWER (gantikan yang lama) ======
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: Theme.of(context).brightness == Brightness.light
                  ? [Colors.teal.shade700, Colors.teal.shade300]
                  : [Colors.deepPurple.shade700, Colors.deepPurple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/EsMamboLasmi.png',
                        height: 75,
                        width: 75,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Es Mambo Lasmi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(color: Colors.white70, indent: 16, endIndent: 16),
                const SizedBox(height: 8),

                // menu items
                _drawerItem(title: 'Home', icon: Icons.home_outlined),
                _drawerItem(title: 'Produk', icon: Icons.local_mall_outlined),
                _drawerItem(title: 'Kontak', icon: Icons.call_outlined),
                _drawerItem(title: 'Tentang', icon: Icons.info_outline),

                const SizedBox(height: 16),
                const Divider(color: Colors.white70, indent: 16, endIndent: 16),
              ],
            ),
          ),
        ),
      ),
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

class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Switch(
      value: appThemeState.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}

Widget buildFooter(BuildContext context) {
  final theme = Theme.of(context);

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    color: theme.appBarTheme.backgroundColor, // WARNA IKUT APPBAR
    child: Text(
      "© 2025 Mohamad Almubarok — All Rights Reserved",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: theme.appBarTheme.foregroundColor ?? Colors.white,
      ),
    ),
  );
}
