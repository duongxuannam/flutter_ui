import 'package:flutter/material.dart';
import 'package:ui_flutter/screens/detail/detail_screen.dart';
import 'package:ui_flutter/screens/home/components/section_title.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: title,
          press: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  demo_product.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: ProductCard(
                          image: demo_product[index].image,
                          title: demo_product[index].title,
                          price: demo_product[index].price,
                          press: () {
                            print("hello");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          product: demo_product[index],
                                        )));
                          },
                          bgColor: const Color(0xFFEFEFF2),
                        ),
                      ))),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.bgColor,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final Color bgColor;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius))),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultPadding))),
              child: Image.asset(
                image,
                height: 132,
              ),
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      Text(title, style: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  width: defaultPadding / 4,
                ),
                Text(
                  '\$ ${price.toString()}',
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
