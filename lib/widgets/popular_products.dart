import 'package:esmambolasmi/features/products/screens/esjelly_screen.dart';
import 'package:esmambolasmi/features/products/screens/esmambo_screen.dart';
import 'package:esmambolasmi/features/products/widgets/popularproducts_card.dart';
import 'package:esmambolasmi/features/products/screens/products_screen.dart';
import 'package:esmambolasmi/widgets/section_title.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionTitle(
                title: "Popular Products",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductsScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                ...List.generate(demoProducts.length, (index) {
                  if (demoProducts[index].isPopular) {
                    return PopularProductCard(
                      product: demoProducts[index],
                      onPress: () {
                        if (demoProducts[index].category == "Es Mambo") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EsMamboScreen(),
                            ),
                          );
                        } else if (demoProducts[index].category == "Es Jelly") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EsJellyScreen(),
                            ),
                          );
                        }
                      },
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
