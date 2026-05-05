import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key, required this.product, required this.onPress});

  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
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
          Text(product.title, style: theme.textTheme.bodyMedium, maxLines: 2),
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
              Container(
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
            ],
          ),
        ],
      ),
    );
  }
}

//
// ================= PRODUCT MODEL =================
//

class Product {
  final int id, price;
  final String title;
  final List<String> images;
  final String category;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    // required this.colors,
    required this.title,
    required this.price,
    required this.category,
    this.isFavourite = false,
    this.isPopular = false,
  });
}

//
// ================= DEMO PRODUCTS =================
//

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/product/esmambo/coklat.jpg"],
    title: "Es Mambo Coklat",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 2,
    images: ["assets/product/esmambo/tiramisu.jpg"],
    title: "Es Mambo Tiramisu",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 1,
    images: ["assets/product/esmambo/taro.jpg"],
    title: "Es Mambo Taro",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 2,
    images: ["assets/product/esmambo/red_velvet.jpg"],
    title: "Es Mambo Red Velvet",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 1,
    images: ["assets/product/esmambo/strawberry.jpg"],
    title: "Es Mambo Strawberry",
    price: 1000,
    category: "Es Mambo",
    isFavourite: false,
  ),
  Product(
    id: 2,
    images: ["assets/product/esmambo/green_tea.jpg"],
    title: "Es Mambo Green Tea",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 1,
    images: ["assets/product/esmambo/mangga.jpg"],
    title: "Es Mambo Mangga",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 2,
    images: ["assets/product/esmambo/bubble_gum.jpg"],
    title: "Es Mambo Bubble Gum",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 1,
    images: ["assets/product/esmambo/oreo.jpg"],
    title: "Es Mambo Oreo",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 2,
    images: ["assets/product/esmambo/blueberry.jpg"],
    title: "Es Mambo Blueberry",
    price: 1000,
    category: "Es Mambo",
    isFavourite: false,
  ),
  Product(
    id: 3,
    images: ["assets/product/esjelly/strawberry.png"],
    title: "Es Jelly Strawberry",
    price: 5000,
    category: "Es Jelly",
  ),
  Product(
    id: 3,
    images: ["assets/product/esjelly/melon.png"],
    title: "Es Jelly Melon",
    price: 5000,
    category: "Es Jelly",
  ),
  Product(
    id: 3,
    images: ["assets/product/esjelly/coklat.png"],
    title: "Es Jelly Coklat",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 3,
    images: ["assets/product/esjelly/mangga.png"],
    title: "Es Jelly Mangga",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 3,
    images: ["assets/product/esjelly/capuccino.png"],
    title: "Es Jelly Capuccino",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 4,
    images: ["assets/product/kue/kuenastar1.png"],
    title: "Kue Nastar",
    price: 0,
    category: "Kue Nastar",
    isFavourite: true,
  ),
];
