import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/home/data.dart';

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
            backgroundColor: Colors.transparent,
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
          
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 1.81,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: largeImages.length,
                    itemBuilder: (context, index) => Image.asset(
                      largeImages[index],
                    ),
                  ),
                  Positioned
                  (
                    bottom: defaultPadding,
                    right: defaultPadding,
                    child: Container(
                                  height: 4,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                ),
                  ),
                ],
              ),
              
            ),
          ),
          ];
        }, body: Container(),
      ),
    );
  }
}
