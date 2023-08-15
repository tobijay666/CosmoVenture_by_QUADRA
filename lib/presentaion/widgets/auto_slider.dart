import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import 'gradient_button.dart';

class AutoSliderBanner extends StatefulWidget {
  final List<String> imageUrls;

  const AutoSliderBanner({super.key, required this.imageUrls});

  @override
  // ignore: library_private_types_in_public_api
  _AutoSliderBannerState createState() => _AutoSliderBannerState();
}

class _AutoSliderBannerState extends State<AutoSliderBanner> {
  final CarouselController _controller = CarouselController();
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.imageUrls
              .map((url) => Image.asset(
                    url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.4,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, _) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
        ),
        if (_currentSlide == 0)
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.sliderText1,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.sliderText2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ],
            ),
          ),
        if (_currentSlide == 1)
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        if (_currentSlide == 2)
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        Positioned(
          bottom: 10.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageUrls.map((url) {
              int index = widget.imageUrls.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentSlide == index
                      ? AppColors.outlineColor
                      : Colors.white,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
