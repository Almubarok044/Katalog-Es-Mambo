import 'package:esmambolasmi/widgets/footer.dart';
import 'package:material_ui/material_ui.dart';

class KueScreen extends StatefulWidget {
  const KueScreen({super.key});

  @override
  State<KueScreen> createState() => _KueScreenState();
}

class _KueScreenState extends State<KueScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Varian Kue Kering",
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
                        "Kue Kering Premium",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Dibuat dengan bahan-bahan pilihan untuk menemani momen spesial Anda.",
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
                            "Bomboloni Green Tea",
                            "🥯",
                            "Kue lembut dengan topping green tea yang lumer di mulut.",
                            "assets/product/kue/bombolonigreentea/bombolonigreentea.png",
                          ),
                          _buildProductCard(
                            context,
                            "Kacang Biji Wijen",
                            "🥨",
                            "Camilan renyah dengan balutan biji wijen yang gurih dan manis.",
                            "assets/product/kue/kacang/kacangbijiwijen.png",
                          ),
                          _buildProductCard(
                            context,
                            "Kastengel",
                            "🧀",
                            "Kue kering keju premium yang renyah dan gurih.",
                            "assets/product/kue/kastengel/kastengel.png",
                          ),
                          _buildProductCard(
                            context,
                            "Nastar Green Tea",
                            "🍵",
                            "Nastar lembut dengan aroma green tea dan isian selai nanas segar.",
                            "assets/product/kue/nastar/nastargreentea.png",
                          ),
                          _buildProductCard(
                            context,
                            "Nastar Keju",
                            "🧀",
                            "Perpaduan nastar klasik dengan parutan keju di atasnya.",
                            "assets/product/kue/nastar/nastarkeju.png",
                          ),
                          _buildProductCard(
                            context,
                            "Nastar Original",
                            "🍍",
                            "Kue nastar klasik dengan selai nanas asli yang manis dan legit.",
                            "assets/product/kue/nastar/nastaroriginal.png",
                          ),
                          _buildProductCard(
                            context,
                            "Nastar Original Wadah Hitam",
                            "🎁",
                            "Nastar original dalam kemasan eksklusif, cocok untuk hantaran.",
                            "assets/product/kue/nastar/nastaroriginaldenganwadahhitam.png",
                          ),
                          _buildProductCard(
                            context,
                            "Nastar Wijsman Gulung",
                            "🧈",
                            "Nastar premium dengan butter Wijsman, bentuk gulung yang cantik.",
                            "assets/product/kue/nastar/nastargulunguksedang.png",
                          ),
                          _buildProductCard(
                            context,
                            "Palm Cheese",
                            "🌴",
                            "Kue kering dengan balutan gula palem dan keju yang unik dan lezat.",
                            "assets/product/kue/palmcheese/palmcheese.png",
                          ),
                          _buildProductCard(
                            context,
                            "Putri Salju",
                            "❄️",
                            "Kue lembut dengan taburan gula halus yang dingin dan manis.",
                            "assets/product/kue/putrisalju/putrisalju.png",
                          ),
                          _buildProductCard(
                            context,
                            "Red Velvet",
                            "🍰",
                            "Kue kering rasa red velvet yang trendy dengan tekstur yang renyah.",
                            "assets/product/kue/redvelvet/redvelvet.png",
                          ),
                          _buildProductCard(
                            context,
                            "Sagu Keju",
                            "🥯",
                            "Kue sagu keju yang lumer di lidah, manis dan gurihnya pas.",
                            "assets/product/kue/sagukeju/sagukeju.png",
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
