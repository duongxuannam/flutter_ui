import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/constants.dart';

import '../../models/Product.dart';
import 'components/color_dot.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: product.bgColor,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset("assets/icons/Heart.svg", height: 20),
              ),
            ),
          ]),
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
              child: Container(
            padding: const EdgeInsets.fromLTRB(defaultPadding,
                defaultPadding * 2, defaultPadding, defaultPadding),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    Text(
                      '\$ ${product.price.toString()}',
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "Day la cai De scas dfafj fjksldj fksjf jsfkldsj ds ay la cai De scas dfafj fjksldj fksjf jsfkldsj ds  ay la cai De scas dfafj fjksldj fksjf jsfkldsj ds ",
                    )),
                const Text(
                  "Colors",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    ColorDot(
                      color: const Color(0xFFBEE8EA),
                      press: () {},
                      isActive: false,
                    ),
                    ColorDot(
                      color: const Color(0xFF141B4A),
                      press: () {},
                      isActive: true,
                    ),
                    ColorDot(
                      color: const Color(0xFFF4E5C3),
                      press: () {},
                      isActive: false,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding * 1.5),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: StadiumBorder(),
                        ),
                        child: Text("Add to cart")),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
