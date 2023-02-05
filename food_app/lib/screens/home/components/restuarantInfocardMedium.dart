import 'package:flutter/material.dart';

import '../../../constants.dart';

class RestaurantInfocardMedium extends StatelessWidget {
  const RestaurantInfocardMedium({
    super.key,
    required this.title,
    required this.image,
    required this.location,
    required this.deliverTime,
    required this.rating, 
    required this.press,
  });

  final String title, image, location;
  final int deliverTime;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      onTap: press,
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Image.asset(image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding / 2),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: bodyTextColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding / 2),
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2,
                              vertical: defaultPadding / 8),
                          decoration: BoxDecoration(
                              color: activeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(defaultBorderRadius))),
                          child: Text(
                            rating.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        Text('$deliverTime min'),
                        Spacer(),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: bodyTextColor,
                        ),
                        Spacer(),
                        Text('Free Delivery')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
