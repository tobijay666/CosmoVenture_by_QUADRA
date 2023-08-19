import 'package:cosmoventure/presentaion/pages/booking.dart';
import 'package:cosmoventure/presentaion/pages/user_Comments.dart';
import 'package:cosmoventure/presentaion/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/auto_slider.dart';
import '../widgets/discover_card.dart';

class DestinationScreen extends StatefulWidget {
  final String? title;
  final String? description;
  final List<String>? image;
  final String? price;
  final String? coordinates;
  final num? rating;
  final num? age;
  final num? density;
  final num? gravity;
  final num? magnitude;
  final num? oxygen;
  final num? distance;
  final num? hTemp;
  final num? cTemp;
  final num? lTemp;
  DestinationScreen(
      {super.key,
      this.title,
      this.rating,
      this.description,
      this.image,
      this.price,
      this.coordinates,
      this.age,
      this.density,
      this.gravity,
      this.magnitude,
      this.oxygen,
      this.distance,
      this.hTemp,
      this.cTemp,
      this.lTemp});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  bool showFullText = false;

  void toggleTextVisibility() {
    setState(() {
      showFullText = !showFullText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AutoSliderBanner(
              network: true,
              text: false,
              imageUrls: [
                widget.image![0],
                widget.image![1],
                widget.image![2],
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                widget.title!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        widget.rating.toString() + ".0",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                          children:
                              generateRatingIcons(widget.rating!.toInt(), 5)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.device_thermostat_outlined,
                            color: Colors.red,
                          ),
                          Text(
                            widget.hTemp!.toString() + " f",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "to",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.lTemp!.toString() + " f",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.outlineColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.ac_unit_outlined,
                              color: AppColors.outlineColor,
                            ),
                            Text(
                              widget.cTemp!.toString() + " f",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.outlineColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Age:",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.age!.toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Density:",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.density!.toString() + " g/cm³",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Distance from earth:",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.distance!.toString() + " million km",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Gravity:",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.gravity!.toString() + " m/s²",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Apparent Magnitude (v):",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.magnitude!.toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Oxygen level:",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.oxygen!.toString() + "%",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Coordinates:",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.coordinates!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.description!.substring(0, 40),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                ),
                                if (showFullText)
                                  Text(
                                    widget.description!.substring(
                                      40,
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: AppColors.whiteColor,
                                        ),
                                  ),
                                TextButton(
                                  onPressed: toggleTextVisibility,
                                  child: Text(
                                    showFullText ? 'See Less' : 'See More',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: AppColors.outlineColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "User Comments",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: 5, // Number of times to display the widget
                itemBuilder: (context, index) => CommentsCard(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserCommentsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "see more",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.outlineColor,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price 500 BTC",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.yellow,
                        ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.yellow),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Book Now",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  // Function to generate rating icons dynamically
  List<Widget> generateRatingIcons(int rating, int maxRating) {
    List<Widget> icons = [];

    for (int i = 0; i < rating; i++) {
      icons.add(
        Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
      );
    }

    for (int i = rating; i < maxRating; i++) {
      icons.add(
        Icon(
          Icons.star_outline,
          color: Colors.white,
        ),
      );
    }

    return icons;
  }
}
