import 'package:esmambolasmi/features/products/products_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // =============== WA FUNCTION ES MAMBO ===============
  void openWhatsAppEsMambo() async {
    const String message = "Halo, saya ingin pesan ....";

    final Uri url = Uri.parse(
      "https://wa.me/6285693665006?text=${Uri.encodeComponent(message)}",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak dapat membuka WhatsApp");
    }
  }

  String selectedCategory = "Semua";

  final List<String> categories = [
    "Semua",
    "Es Mambo",
    "Es Jelly",
    "Kue Nastar",
  ];

  // ================= FILTER LOGIC =================
  List<Product> get filteredProducts {
    if (selectedCategory == "Semua") {
      return demoProducts;
    }

    return demoProducts
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        title: const Text(
          "Produk Kami",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // ================= CATEGORY FILTER =================
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: categories.map((category) {
                  final isSelected = selectedCategory == category;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FilterChip(
                      label: Text(
                        category,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      backgroundColor: Colors.grey[200],
                      selectedColor: Colors.blueGrey,
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // ================= PRODUCTS GRID =================
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = (constraints.maxWidth / 220).floor();

                if (crossAxisCount < 1) crossAxisCount = 1;

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ProductsCard(
                          product: filteredProducts[index],
                          onPress: () {},
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // ⬇️ PINDAHKAN KE SINI
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          key: const ValueKey('wa'),
          tooltip: 'Pesan via WhatsApp',
          backgroundColor: Colors.green,
          splashColor: Colors.greenAccent,
          elevation: 10,
          onPressed: openWhatsAppEsMambo,
          child: const FaIcon(
            FontAwesomeIcons.whatsapp,
            color: Colors.white,
            size: 37,
          ),
        ),
      ),
    );
  }
}
