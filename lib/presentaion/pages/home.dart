import 'dart:async';

import 'package:cosmoventure/main.dart';
import 'package:cosmoventure/presentaion/widgets/auto_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/feature_card.dart';
import '../widgets/feature_slider_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool leading = false;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
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
              text: true,
              title: [AppStrings.sliderText1, "", ""],
              description: [
                AppStrings.sliderSubText1,
                AppStrings.sliderSubText2,
                AppStrings.sliderSubText3
              ],
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
                AppStrings.popularDestinations,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20.0),
            const FeatureCard(
                image: AppImages.popular1,
                title: AppStrings.mars,
                description: AppStrings.marsDescription,
                price: "500BTC"),
            const SizedBox(height: 16.0),
            const FeatureCard(
                image: AppImages.popular2,
                title: AppStrings.venus,
                description: AppStrings.venusDescription,
                price: "500BTC"),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            index: 3,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    AppStrings.seeAll,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.outlineColor,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                AppStrings.upcomingJourneys,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 320.0,
              child: ListView(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  FeatureSliderCard(
                    image: AppImages.popular2,
                    title: AppStrings.venus,
                    date: "07/10/2023",
                    time: "1.00 PM",
                  ),
                  FeatureSliderCard(
                    image: AppImages.popular2,
                    title: AppStrings.venus,
                    date: "07/10/2023",
                    time: "1.00 PM",
                  ),
                  FeatureSliderCard(
                    image: AppImages.popular2,
                    title: AppStrings.venus,
                    date: "07/10/2023",
                    time: "1.00 PM",
                  ),
                  FeatureSliderCard(
                    image: AppImages.popular2,
                    title: AppStrings.venus,
                    date: "07/10/2023",
                    time: "1.00 PM",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
