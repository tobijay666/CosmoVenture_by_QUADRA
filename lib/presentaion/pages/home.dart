import 'dart:async';

import 'package:cosmoventure/domain/entities/journey_entity%20copy.dart';
import 'package:cosmoventure/main.dart';
import 'package:cosmoventure/presentaion/bloc/home/home_bloc.dart';
import 'package:cosmoventure/presentaion/pages/destination.dart';
import 'package:cosmoventure/presentaion/widgets/auto_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/feature_card.dart';
import '../widgets/feature_slider_card.dart';

class HomeScreen extends StatefulWidget {
  final String? uid;
  const HomeScreen({super.key, this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc bloc = sl<HomeBloc>();
  bool isLoading = false;

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
      body: BlocProvider(
        create: (_) => bloc..add(HomeLoading()),
        child: BlocConsumer<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              print(state.destinationCards);
              return _bodyWidget(state.destinationCards, state.journeyCards);
            }
            return const Scaffold(
              backgroundColor: AppColors.black,
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.outlineColor,
                ),
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  _bodyWidget(popularCards, JourneyCards) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AutoSliderBanner(
              network: false,
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
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: popularCards.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 20),
                      child: FeatureCard(
                        image: popularCards[index].image[0],
                        title: popularCards[index].title,
                        description: popularCards[index].description,
                        price: popularCards[index].price + ' BTC',
                        rating: popularCards[index].rating,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DestinationScreen(
                                uid: widget.uid!,
                                rating: popularCards[index].rating,
                                title: popularCards[index].title,
                                age: popularCards[index].age,
                                cTemp: popularCards[index].cTemp,
                                coordinates: popularCards[index].coordinates,
                                density: popularCards[index].density,
                                description: popularCards[index].description,
                                distance: popularCards[index].distance,
                                gravity: popularCards[index].gravity,
                                hTemp: popularCards[index].hTemp,
                                image: popularCards[index].image,
                                lTemp: popularCards[index].lTemp,
                                magnitude: popularCards[index].magnitude,
                                oxygen: popularCards[index].oxygen,
                                price: popularCards[index].price,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            index: 3,
                            uid: widget.uid!,
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
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: JourneyCards.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 20),
                      child: FeatureSliderCard(
                        image: JourneyCards[index].image,
                        title: JourneyCards[index].title,
                        date: JourneyCards[index].time.day.toString() +
                            "/" +
                            JourneyCards[index].time.month.toString() +
                            "/" +
                            JourneyCards[index].time.year.toString(),
                        time: JourneyCards[index].time.hour.toString() +
                            "." +
                            JourneyCards[index].time.minute.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
