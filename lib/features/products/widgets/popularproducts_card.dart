import 'package:flutter/material.dart';

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  });

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: const EdgeInsets.all(12),
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
                  child: Image.asset(product.images[0]),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                product.subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.iconTheme.color?.withValues(alpha: 0.7),
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp.${product.price}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? theme.primaryColor
                            : const Color(0xFF979797),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          product.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final int id, price;
  final String title, subtitle, category;
  final List<String> images;
  final List<Color> colors;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.price,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/product/esmambo/red_velvet.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Red Velvet",
    subtitle: "Manis lembut, favorit sepanjang masa!",
    category: "Es Mambo",
    price: 1000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: ["assets/product/esjelly/coklat.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Coklat Classic",
    subtitle: "Cokelat asli, rasa paling juara!",
    category: "Es Jelly",
    price: 5000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: ["assets/product/esmambo/mangga.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Mangga Tropis",
    subtitle: "Segarnya mangga, bikin mood ceria!",
    category: "Es Mambo",
    price: 1000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: ["assets/product/esjelly/cappuccino.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cappuccino",
    subtitle: "Aroma kopi, nikmat setiap tegukan!",
    category: "Es Jelly",
    price: 5000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 5,
    images: ["assets/product/esmambo/bubble_gum.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Bubble Gum",
    subtitle: "Tekstur permen karet, pecah di mulut!",
    category: "Es Mambo",
    price: 1000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: ["assets/product/esjelly/melon.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Melon Segar",
    subtitle: "Kesegaran melon, dinginnya tiada tanding!",
    category: "Es Jelly",
    price: 5000,
    isFavourite: true,
    isPopular: true,
  ),
];
