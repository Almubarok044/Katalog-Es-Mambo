import 'package:material_ui/material_ui.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.icecream, "text": "Es Mambo"},
      {"icon": Icons.bakery_dining, "text": "Kue Kering"},
      {"icon": Icons.bubble_chart, "text": "Es Jelly"},
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              Text(
                "Kategori Produk",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Kami memiliki 3 kategori produk unggulan yang siap menemani hari Anda, mulai dari kesegaran es klasik hingga pilihan kue premium yang lezat.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  height: 1.6,
                  color: theme.iconTheme.color?.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 12,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: isDark ? theme.cardColor : const Color(0xFFFFECDF),
            borderRadius: BorderRadius.circular(16),
            border: isDark
                ? Border.all(color: theme.primaryColor.withValues(alpha: 0.2))
                : null,
          ),
          child: Icon(
            icon,
            color: isDark ? theme.primaryColor : Colors.orange,
            size: 40,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
