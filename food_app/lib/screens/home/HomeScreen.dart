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
              child: imageCarousel(),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}

class imageCarousel extends StatefulWidget {
  const imageCarousel({
    super.key,
  });

  @override
  State<imageCarousel> createState() => _imageCarouselState();
}

class _imageCarouselState extends State<imageCarousel> {
  int _currentPosition = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: largeImages.length,
            onPageChanged:(value) {
              setState(() {
                _currentPosition = value;
              });
            },
            itemBuilder: (context, index) => Image.asset(
              largeImages[index],
            ),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
                children: List.generate(
                    largeImages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(
                              left: defaultPadding / 4),
                          child: indicatorDots(
                            isActive: index == _currentPosition,
                          ),
                        ))),
          ),
        ],
      ),
    );
  }
}

class indicatorDots extends StatelessWidget {
  const indicatorDots({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
