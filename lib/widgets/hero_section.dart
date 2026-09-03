import 'package:esmambolasmi/features/products/screens/products_screen.dart';
import 'package:material_ui/material_ui.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60 : 30,
              vertical: isDesktop ? 80 : 50,
            ),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: theme.primaryColor.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _buildCopywriting(context, theme),
                      ),
                      const SizedBox(width: 60),
                      Expanded(flex: 5, child: _buildImage()),
                    ],
                  )
                : Column(
                    children: [
                      _buildImage(),
                      const SizedBox(height: 40),
                      _buildCopywriting(context, theme),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCopywriting(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Manisnya Kenangan, Segarnya Hari Ini.',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Nikmati kelezatan klasik Es Mambo Lasmi yang membawa kembali memori indah masa kecil Anda. '
          'Serta lengkapi momen spesial Anda dengan Hampers Kue Lebaran Premium dari kami.',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            height: 1.5,
            color: theme.iconTheme.color?.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductsScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
          ),
          child: const Text(
            'Lihat Produk Kami',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/product/esmambo/klasiktapiasik.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
