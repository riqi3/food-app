import '../../../constants.dart';
import 'package:flutter/material.dart';

import '../data.dart';

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
      aspectRatio: 1.91,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            child: PageView.builder(
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
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))),
    );
  }
}
