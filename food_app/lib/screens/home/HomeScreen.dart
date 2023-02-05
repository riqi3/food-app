import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/home/data.dart';

import 'components/imageCarousel.dart';
import 'components/restuarantInfocardMedium.dart';
import 'components/sectionTitle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    'delivery to'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: activeColor),
                  ),
                  Text(
                    'Minglanilla',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Filter',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            
          ];
        }, body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: imageCarousel(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'Featured Partners',
                  press: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    mediumCardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding),
                      child: RestaurantInfocardMedium(
                        title: mediumCardData[index]['name'],
                        location: mediumCardData[index]['location'],
                        image: mediumCardData[index]['image'],
                        deliverTime: mediumCardData[index]['deliverTime'],
                        rating: mediumCardData[index]['rating'],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(defaultBorderRadius)),
                    child: Image.asset('assets/images/food-app-banner2.jpg')),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'Best Picks',
                  press: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    mediumCardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding),
                      child: RestaurantInfocardMedium(
                        title: mediumCardData[index]['name'],
                        location: mediumCardData[index]['location'],
                        image: mediumCardData[index]['image'],
                        deliverTime: mediumCardData[index]['deliverTime'],
                        rating: mediumCardData[index]['rating'],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
