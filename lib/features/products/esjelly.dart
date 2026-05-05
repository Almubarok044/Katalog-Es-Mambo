import 'package:flutter/material.dart';

class EsJelly extends StatefulWidget {
  const EsJelly({super.key});

  @override
  State<EsJelly> createState() => _EsJellyState();
}

class _EsJellyState extends State<EsJelly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
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
          "Varian Es Jelly Lasmi",
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
                  "Strawberry",
                  "🍓",
                  "Jelly stroberi dengan sensasi kenyal yang seru di setiap tegukan. Perpaduan manis dan asam segarnya bikin adem dan nagih!",
                  "assets/product/esjelly/strawberry.png",
                ),

                productCard(
                  "Melon",
                  "🍈",
                  "Jelly melon yang lembut dan dingin, kenyalnya pas dengan aroma harum yang menenangkan. Segarnya terasa sampai akhir!",
                  "assets/product/esjelly/melon.png",
                ),

                productCard(
                  "Coklat",
                  "🍫",
                  "Jelly cokelat creamy dengan tekstur kenyal yang unik. Manisnya lembut, nikmat diminum langsung dari botol!",
                  "assets/product/esjelly/coklat.png",
                ),

                productCard(
                  "Mangga",
                  "🥭",
                  "Jelly mangga dengan rasa tropis yang juicy dan segar. Kenyalnya bikin setiap tegukan terasa lebih seru!",
                  "assets/product/esjelly/mangga.png",
                ),

                productCard(
                  "Capuccino",
                  "☕",
                  "Jelly cappuccino dengan perpaduan kopi ringan dan krim manis. Sensasi kenyalnya lembut dan bikin beda dari minuman biasa!",
                  "assets/product/esjelly/capuccino.png",
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
          height: 160,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(img, fit: BoxFit.contain),
          ),
        ),

        const SizedBox(height: 8),
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
