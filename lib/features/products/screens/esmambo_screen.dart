import 'package:esmambolasmi/widgets/footer.dart';
import 'package:flutter/material.dart';

class EsMamboScreen extends StatefulWidget {
  const EsMamboScreen({super.key});

  @override
  State<EsMamboScreen> createState() => _EsMamboScreenState();
}

class _EsMamboScreenState extends State<EsMamboScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Varian Es Mambo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // ================= MINI HERO HEADER =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.05),
                    border: Border(
                      bottom: BorderSide(
                        color: theme.primaryColor.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Es Mambo Klasik",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Nostalgia rasa masa kecil dengan 100% bahan alami yang menyegarkan.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          color: theme.iconTheme.color?.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ================= PRODUCTS GRID =================
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 30,
                        runSpacing: 30,
                        children: [
                          _buildProductCard(
                            context,
                            "Coklat",
                            "🍫",
                            "Coklat Rasa klasik yang tak pernah salah! Manisnya coklat bikin nagih dari hisapan pertama.",
                            "assets/product/esmambo/coklat.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Tiramisu",
                            "☕",
                            "Kombinasi kopi ringan dan krim manis ala Italia, cocok buat kamu yang suka rasa elegan dan unik.",
                            "assets/product/esmambo/tiramisu.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Taro",
                            "🌸",
                            "Rasa manis lembut dari talas ungu yang khas, bikin suasana ngemil lebih seru dan berwarna.",
                            "assets/product/esmambo/taro.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Red Velvet",
                            "🍰",
                            "Manis gurih dengan sentuhan creamy, kini hadir dalam bentuk es mambo yang segar.",
                            "assets/product/esmambo/red_velvet.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Strawberry",
                            "🍓",
                            "Asam manis buah stroberi segar, bikin setiap gigitan terasa menyegarkan dan ceria.",
                            "assets/product/esmambo/strawberry.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Green Tea",
                            "🍵",
                            "Segarnya teh hijau dengan aroma khas yang menenangkan, cocok untuk pecinta rasa oriental.",
                            "assets/product/esmambo/green_tea.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Mangga",
                            "🥭",
                            "Rasa tropis mangga yang manis dan juicy, sempurna untuk dinikmati di siang yang panas.",
                            "assets/product/esmambo/mangga.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Bubble Gum",
                            "🍬",
                            "Manisnya permen karet dalam bentuk es mambo, warna-warni ceria yang bikin nostalgia.",
                            "assets/product/esmambo/bubble_gum.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Oreo",
                            "🍪",
                            "Crunchy dan creamy ala biskuit oreo yang legendaris, berpadu dengan lembutnya es mambo.",
                            "assets/product/esmambo/oreo.jpg",
                          ),
                          _buildProductCard(
                            context,
                            "Blueberry",
                            "🍇",
                            "Rasa segar buah blueberry dengan sentuhan manis-asam yang pas, bikin lidah langsung jatuh cinta.",
                            "assets/product/esmambo/blueberry.jpg",
                          ),
                        ],
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
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String name,
    String icon,
    String desc,
    String img,
  ) {
    final theme = Theme.of(context);

    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.primaryColor.withValues(alpha: 0.15),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ==== GAMBAR ====
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: SizedBox(
              height: 250,
              child: Image.asset(img, fit: BoxFit.contain),
            ),
          ),

          // ==== TEXT CONTENT ====
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "$icon $name",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.iconTheme.color?.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
