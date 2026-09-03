import 'package:esmambolasmi/features/social_media/social_media.dart';
import 'package:esmambolasmi/widgets/footer.dart';
import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Tentang Kami',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ===== HEADER SECTION =====
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icon/EsMamboLasmi.png',
                              height: 120,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.icecream, size: 100),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Manisnya Kenangan, Segarnya Hari Ini.',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: theme.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),

                      // ===== TENTANG KAMI =====
                      Text(
                        'Es Mambo Lasmi',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          letterSpacing: 0.2,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Es Mambo Lasmi hadir untuk mengembalikan memori indah masa kecil Anda melalui sajian es mambo klasik yang otentik. Kami berkomitmen untuk selalu menghadirkan produk berkualitas tinggi dengan cita rasa terbaik, cocok dinikmati dalam segala suasana, baik bersama keluarga maupun teman-teman terdekat.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                          fontSize: 16,
                          color: theme.iconTheme.color?.withValues(alpha: 0.8),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 30),

                      // ===== KEUNGGULAN KAMI =====
                      Text(
                        'Keunggulan Kami',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _featureItem(
                        context,
                        Icons.eco,
                        '100% Bahan Alami',
                        'Dibuat menggunakan bahan baku alami pilihan tanpa pemanis buatan maupun pengawet.',
                      ),
                      const SizedBox(height: 16),
                      _featureItem(
                        context,
                        Icons.clean_hands,
                        'Proses Higienis',
                        'Diproduksi dengan standar kebersihan tinggi untuk memastikan kualitas dan keamanan konsumsi.',
                      ),
                      const SizedBox(height: 16),
                      _featureItem(
                        context,
                        Icons.star,
                        'Kualitas Premium',
                        'Rasa yang otentik, mewah, dan menyegarkan dalam setiap gigitan.',
                      ),
                      const SizedBox(height: 35),

                      // ===== PRODUK KAMI =====
                      Text(
                        'Produk Utama Kami',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _productCard(
                        context,
                        'assets/product/esmambo/esmamboanekarasa.png',
                        'Es Mambo Berbagai Rasa',
                      ),
                      _productCard(
                        context,
                        'assets/product/kue/hampers/hamperskue5.png',
                        'Hampers Kue Lebaran Premium',
                      ),
                      _productCard(
                        context,
                        'assets/product/esjelly/esjellyanekarasa1.png',
                        'Es Jelly Segar',
                      ),
                      const SizedBox(height: 50),

                      // ===== INFORMASI DEVELOPER & PROMOSI =====
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: theme.primaryColor.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/flutter/lockup_built-w-flutter/lockup_built-w-flutter_solid.png',
                              height: 50,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Ingin Bisnis Anda Go-Digital?",
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Tingkatkan profesionalisme, kepercayaan pelanggan, dan omzet penjualan bisnis Anda dengan memiliki website atau aplikasi modern seperti ini.\n\nButuh website portofolio, e-commerce, atau aplikasi kasir custom? Kami siap mewujudkan visi digital Anda!",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                                fontSize: 15,
                                color: theme.iconTheme.color?.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Layanan Jasa IT & Maintenance",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            _serviceInfoItem(
                              context,
                              Icons.speed,
                              "Upgrade Performa",
                              "Tambah/ganti RAM & SSD agar laptop/PC Anda kembali ngebut.",
                            ),
                            const SizedBox(height: 12),
                            _serviceInfoItem(
                              context,
                              Icons.cleaning_services,
                              "Maintenance Rutin",
                              "Cleaning & repasta processor untuk mencegah overheat pada PC/Laptop.",
                            ),
                            const SizedBox(height: 12),
                            _serviceInfoItem(
                              context,
                              Icons.games,
                              "Isi Game PS",
                              "Jasa pengisian game PlayStation terbaru dengan koleksi lengkap.",
                            ),
                            const SizedBox(height: 12),
                            _serviceInfoItem(
                              context,
                              Icons.computer,
                              "Software & OS",
                              "Jasa install ulang OS (Windows/Linux) dan instalasi berbagai aplikasi.",
                            ),
                            const SizedBox(height: 12),
                            _serviceInfoItem(
                              context,
                              Icons.build,
                              "Service Lainnya",
                              "Solusi perbaikan hardware & software lainnya sesuai kebutuhan Anda.",
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              color: theme.primaryColor.withValues(alpha: 0.3),
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Hubungi saya melalui media sosial di bawah ini:",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: theme.iconTheme.color?.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.center,
                              children: [
                                socialIcon(
                                  icon: FontAwesomeIcons.whatsapp,
                                  backgroundColor: const Color(0xFF25D366),
                                  splashColor: Colors.greenAccent,
                                  onTap: openWhatsApp,
                                ),
                                socialIcon(
                                  icon: FontAwesomeIcons.instagram,
                                  backgroundColor: const Color(0xFFE4405F),
                                  splashColor: Colors.pinkAccent,
                                  onTap: openInstagram,
                                ),
                                socialIcon(
                                  icon: FontAwesomeIcons.github,
                                  backgroundColor: Colors.black,
                                  splashColor: Colors.grey,
                                  onTap: openGitHub,
                                ),
                                socialIcon(
                                  icon: FontAwesomeIcons.linkedin,
                                  backgroundColor: const Color(0xFF0A66C2),
                                  splashColor: Colors.blueAccent,
                                  onTap: openLinkedIn,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
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

  Widget _featureItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: theme.primaryColor.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: theme.primaryColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: theme.textTheme.titleLarge?.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    color: theme.iconTheme.color?.withValues(alpha: 0.7),
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

  Widget _productCard(BuildContext context, String imagePath, String name) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.primaryColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.image, size: 50, color: theme.primaryColor),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: theme.textTheme.titleLarge?.color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceInfoItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: theme.primaryColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.iconTheme.color?.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
