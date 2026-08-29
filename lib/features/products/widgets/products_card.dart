import 'package:flutter/material.dart';

class ProductsCard extends StatefulWidget {
  const ProductsCard({super.key, required this.product, required this.onPress});

  final Product product;
  final VoidCallback onPress;

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  // Logic: 0 = 250g / Kecil, 1 = 500g / Besar
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Logic: Jika 500g/Besar dipilih, gunakan priceLarge jika ada, jika tidak ada baru dikali 2
    final double currentPrice = _selectedOption == 1
        ? (widget.product.priceLarge?.toDouble() ?? widget.product.price * 2.0)
        : widget.product.price.toDouble();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPress,
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
                child: Image.asset(widget.product.images[0]),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // FITUR SATUAN (Logic UI)
            if (widget.product.isGram || widget.product.isPcs) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  _buildSizeChip(0, widget.product.isGram ? "250g" : "Kecil"),
                  const SizedBox(width: 8),
                  _buildSizeChip(1, widget.product.isGram ? "500g" : "Besar"),
                ],
              ),
            ],

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rp ${currentPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF7643),
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: widget.product.isFavourite
                        ? const Color(0xFFFF7643)
                        : const Color(0xFF979797).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      widget.product.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 14,
                      color: widget.product.isFavourite
                          ? Colors.white
                          : const Color(0xFF979797),
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

  Widget _buildSizeChip(int index, String label) {
    bool isSelected = _selectedOption == index;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.primaryColor
              : theme.primaryColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor
                : theme.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? Colors.white
                : theme.iconTheme.color?.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}

//
// ================= PRODUCT MODEL =================
//

class Product {
  final int id, price;
  final int? priceLarge;
  final String title;
  final List<String> images;
  final String category;
  final bool isFavourite, isPopular;
  final bool isGram, isPcs;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.price,
    this.priceLarge,
    required this.category,
    this.isFavourite = false,
    this.isPopular = false,
    this.isGram = false,
    this.isPcs = false,
  });
}

//
// ================= DEMO PRODUCTS =================
//

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/product/esmambo/blueberry.png"],
    title: "Es Mambo Blueberry",
    price: 1000,
    category: "Es Mambo",
    isFavourite: false,
  ),
  Product(
    id: 2,
    images: ["assets/product/esmambo/bubble_gum.png"],
    title: "Es Mambo Bubble Gum",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 3,
    images: ["assets/product/esmambo/coklat.png"],
    title: "Es Mambo Chocolate",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 4,
    images: ["assets/product/esmambo/green_tea.png"],
    title: "Es Mambo Green Tea",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: ["assets/product/esmambo/mangga.png"],
    title: "Es Mambo Mangga",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 6,
    images: ["assets/product/esmambo/oreo.png"],
    title: "Es Mambo Oreo",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 7,
    images: ["assets/product/esmambo/red_velvet.png"],
    title: "Es Mambo Red Velvet",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 8,
    images: ["assets/product/esmambo/strawberry.png"],
    title: "Es Mambo Strawberry",
    price: 1000,
    category: "Es Mambo",
    isFavourite: false,
  ),
  Product(
    id: 9,
    images: ["assets/product/esmambo/taro.png"],
    title: "Es Mambo Taro",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 10,
    images: ["assets/product/esmambo/tiramisu.png"],
    title: "Es Mambo Tiramisu",
    price: 1000,
    category: "Es Mambo",
    isFavourite: true,
  ),
  Product(
    id: 11,
    images: ["assets/product/esjelly/anggur.png"],
    title: "Es Jelly Anggur",
    price: 5000,
    category: "Es Jelly",
    isFavourite: false,
  ),
  Product(
    id: 12,
    images: ["assets/product/esjelly/cappuccino.png"],
    title: "Es Jelly Cappuccino",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 13,
    images: ["assets/product/esjelly/coklat.png"],
    title: "Es Jelly Chocolate",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 14,
    images: ["assets/product/esjelly/mangga.png"],
    title: "Es Jelly Mangga",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 15,
    images: ["assets/product/esjelly/melon.png"],
    title: "Es Jelly Melon",
    price: 5000,
    category: "Es Jelly",
    isFavourite: true,
  ),
  Product(
    id: 16,
    images: ["assets/product/esjelly/strawberry.png"],
    title: "Es Jelly Strawberry",
    price: 5000,
    category: "Es Jelly",
    isFavourite: false,
  ),
  Product(
    id: 17,
    images: ["assets/product/kue/bombolonigreentea/bombolonigreentea.png"],
    title: "Bomboloni Green Tea",
    price: 40000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 18,
    images: ["assets/product/kue/kacang/kacangbijiwijen.png"],
    title: "Kacang Biji Wijen",
    price: 30000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 19,
    images: ["assets/product/kue/kastengel/kastengel.png"],
    title: "Kastengel",
    price: 45000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 20,
    images: ["assets/product/kue/nastar/nastargreentea.png"],
    title: "Nastar Green Tea",
    price: 40000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 21,
    images: ["assets/product/kue/nastar/nastarkeju.png"],
    title: "Nastar Keju",
    price: 45000,
    priceLarge: 85000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 22,
    images: ["assets/product/kue/nastar/nastaroriginal.png"],
    title: "Nastar Original",
    price: 40000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 23,
    images: ["assets/product/kue/nastar/nastaroriginaldenganwadahhitam.png"],
    title: "Nastar Original Wadah Hitam",
    price: 40000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 24,
    images: ["assets/product/kue/nastar/nastargulunguksedang.png"],
    title: "Nastar Wijsman Gulung",
    price: 45000,
    priceLarge: 85000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 25,
    images: ["assets/product/kue/palmcheese/palmcheese.png"],
    title: "Palm Cheese",
    price: 35000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 26,
    images: ["assets/product/kue/putrisalju/putrisalju.png"],
    title: "Putri Salju",
    price: 35000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 27,
    images: ["assets/product/kue/redvelvet/redvelvet.png"],
    title: "Red Velvet",
    price: 35000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
  Product(
    id: 28,
    images: ["assets/product/kue/sagukeju/sagukeju.png"],
    title: "Sagu Keju",
    price: 40000,
    category: "Kue Kering",
    isFavourite: true,
    isGram: true,
  ),
];
