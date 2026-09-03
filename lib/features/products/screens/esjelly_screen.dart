import 'package:esmambolasmi/widgets/footer.dart';
import 'package:material_ui/material_ui.dart';

class EsJellyScreen extends StatefulWidget {
  const EsJellyScreen({super.key});

  @override
  State<EsJellyScreen> createState() => _EsJellyScreenState();
}

class _EsJellyScreenState extends State<EsJellyScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Varian Es Jelly",
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
                        "Es Jelly Kenyal & Segar",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Sensasi kenyal yang seru dipadukan dengan manisnya varian rasa kekinian.",
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
                            "Anggur",
                            "🍇",
                            "Jelly anggur dengan perpaduan rasa buah yang segar dan manis alami. Sensasi minuman ini lebih istimewa!",
                            "assets/product/esjelly/anggur.png",
                          ),
                          _buildProductCard(
                            context,
                            "Cappuccino",
                            "☕",
                            "Jelly cappuccino dengan perpaduan kopi ringan dan krim manis. Beda dari minuman biasa!",
                            "assets/product/esjelly/cappuccino.png",
                          ),
                          _buildProductCard(
                            context,
                            "Chocolate",
                            "🍫",
                            "Jelly cokelat creamy dengan tekstur kenyal yang unik. Manisnya lembut, nikmat diminum langsung dari botol!",
                            "assets/product/esjelly/coklat.png",
                          ),
                          _buildProductCard(
                            context,
                            "Mangga",
                            "🥭",
                            "Jelly mangga dengan rasa tropis yang juicy dan segar. Kenyalnya terasa lebih seru!",
                            "assets/product/esjelly/mangga.png",
                          ),
                          _buildProductCard(
                            context,
                            "Melon",
                            "🍈",
                            "Jelly melon yang lembut dan dingin, kenyalnya pas dengan aroma harum yang menyegarkan.",
                            "assets/product/esjelly/melon.png",
                          ),
                          _buildProductCard(
                            context,
                            "Strawberry",
                            "🍓",
                            "Jelly stroberi dengan sensasi kenyal yang seru, perpaduan manis dan asam segarnya bikin nagih!",
                            "assets/product/esjelly/strawberry.png",
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
              height: 230,
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
