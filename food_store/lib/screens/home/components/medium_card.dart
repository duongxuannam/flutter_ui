import 'package:flutter/material.dart';
import 'package:food_store/constants.dart';

class MediumCard extends StatelessWidget {
  const MediumCard({
    Key? key,
    required this.title,
    required this.image,
    required this.deliveryTime,
    required this.rating,
    required this.press,
    required this.location,
  }) : super(key: key);
  final String title, image, location;
  final int deliveryTime;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      onTap: press,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              location,
              style: const TextStyle(color: kBodyTextColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.black, fontSize: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2,
                      vertical: defaultPadding / 8,
                    ),
                    decoration: const BoxDecoration(
                        color: kActiveColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  Text(deliveryTime.toString()),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 2,
                    backgroundColor: Color(0xFF868686),
                  ),
                  const Spacer(),
                  const Text("Free delivery"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
