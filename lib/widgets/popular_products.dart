import 'package:esmambolasmi/features/products/esmambo.dart';
import 'package:esmambolasmi/features/products/esmambo_card.dart';
import 'package:esmambolasmi/features/products/products.dart';
import 'package:esmambolasmi/widgets/section_title.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Products()),
              );
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length, (index) {
                if (demoProducts[index].isPopular) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: EsmamboCard(
                      product: demoProducts[index],
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EsMambo(),
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox.shrink(); // here by default width and height is 0
              }),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
