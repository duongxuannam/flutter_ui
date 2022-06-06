import 'package:flutter/material.dart';
import 'package:food_store/constants.dart';
import 'package:food_store/demoData.dart';
import 'package:food_store/screens/home/components/image_carousel.dart';
import 'package:food_store/screens/home/components/medium_card.dart';
import 'package:food_store/screens/home/components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                "Delivery to".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: kActiveColor),
              ),
              const Text(
                "Binh Duong",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child:
                    const Text("Filter", style: TextStyle(color: Colors.black)))
          ],
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          sliver: SliverToBoxAdapter(
            child: ImageCarousel(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
            child: SectionTitle(
              title: "Feature partners",
              press: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  demoMediumCardData.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: MediumCard(
                          title: demoMediumCardData[index]['name'],
                          location: demoMediumCardData[index]['location'],
                          image: demoMediumCardData[index]['image'],
                          rating: demoMediumCardData[index]['rating'],
                          deliveryTime: demoMediumCardData[index]
                              ['delivertTime'],
                          press: () {},
                        ),
                      )),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
            child: Image.asset("assets/images/Banner.png"),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
            child: SectionTitle(
              title: "Best pick",
              press: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  demoMediumCardData.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: MediumCard(
                          title: demoMediumCardData[index]['name'],
                          location: demoMediumCardData[index]['location'],
                          image: demoMediumCardData[index]['image'],
                          rating: demoMediumCardData[index]['rating'],
                          deliveryTime: demoMediumCardData[index]
                              ['delivertTime'],
                          press: () {},
                        ),
                      )),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: defaultPadding * 2),
        )
      ],
    ));
  }
}
