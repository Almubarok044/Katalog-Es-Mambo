import 'package:esmambolasmi/features/home/homepage.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context, MenuType.home);
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        elevation: 2,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        title: Text(
          "Varian Es Mambo Lasmi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
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
          ),
        ),
      ),
    );
  }
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
        // ==== GAMBAR ====
        SizedBox(
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(img, fit: BoxFit.contain),
          ),
        ),

        const SizedBox(height: 12),

        // ==== NAMA & HARGA PRODUK ====
        Text(
          "$icon $name",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 4),

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
