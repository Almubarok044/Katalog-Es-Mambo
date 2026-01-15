import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
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
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              textAlign: TextAlign.start,
              product.title,
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rp.${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? const Color(0xFFFF7643)
                          : const Color(0xFF979797),
                      shape: BoxShape.circle,
                    ),
                    child: FaIcon(
                      product.isFavourite
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final int id, price;
  final String title;
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
    required this.price,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/product/coklat.jpg"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Coklat Rasa Klasik yang Enak.",
    price: 1000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: ["assets/product/mangga.jpg"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Buah Tropis Mangga yang Manis.",
    price: 1000,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: ["assets/product/oreo.jpg"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Oreo Crunchy dan Creamy.",
    price: 1000,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: ["assets/product/bubble_gum.jpg"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Rasa BubbleGum yang Segar.",
    price: 1000,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: 5,
    images: ["assets/product/red_velvet.jpg"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Red Velvet Krim Lembut dan Gurih.",
    price: 1000,
    isFavourite: true,
    isPopular: true,
  ),
];
