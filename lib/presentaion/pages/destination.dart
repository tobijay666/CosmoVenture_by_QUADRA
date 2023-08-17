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
  final String title;
  final String rating;
  DestinationScreen({super.key, required this.title, required this.rating});

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
              text: false,
              imageUrls: [
                AppImages.slider1,
                AppImages.slider2,
                AppImages.slider3,
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                widget.title,
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
                        widget.rating,
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
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_outline,
                            color: Colors.white,
                          ),
                        ],
                      ),
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
                            "70 f",
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
                            "-255 f",
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
                              "32 f",
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
                            "23",
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
                            "3.93 g/cm³",
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
                            "4.6 million km",
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
                            "43.71 m/s²",
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
                            "-2.91",
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
                            "0.2%",
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
                            "RA 11h 26m 49s | Dec +4° 27′ 48",
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
                                  "Mars is the fourth planet and the furthest terrestrial planet from the Sun. ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                ),
                                if (showFullText)
                                  Text(
                                    "The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname 'the Red Planet'. Mars's radius is second smallest among the planets in the Solar System at 3,389.5 km.",
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
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
