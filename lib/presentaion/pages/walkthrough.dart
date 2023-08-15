import 'package:cosmoventure/main.dart';
import 'package:cosmoventure/utils/app_images.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_strings.dart';
import '../widgets/gradient_button.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    WalkthroughPage(
      title: 'Welcome to MyApp!',
      description: 'This is an example walkthrough screen.',
      imagePath: AppImages.walkthrough1,
    ),
    WalkthroughPage(
      title: 'Discover Features',
      description: 'Explore the amazing features of our app.',
      imagePath: AppImages.walkthrough2,
    ),
    WalkthroughPage(
      title: 'Get Started',
      description: 'Get started and enjoy using our app!',
      imagePath: AppImages.walkthrough3,
    ),
    WalkthroughPage(
      title: 'Get Started',
      description: 'Get started and enjoy using our app!',
      imagePath: AppImages.walkthrough4,
    ),
  ];

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      backgroundColor: Colors.black,
    );
  }

  _bodyWidget() {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: DotsIndicator(
              dotsCount: _pages.length,
              position: _currentPage,
              decorator: DotsDecorator(
                activeColor: Colors.blue,
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WalkthroughPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  WalkthroughPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GradientButton(
                width: MediaQuery.of(context).size.width / 3,
                isDisabled: false,
                title: AppStrings.skip,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          index: 2,
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
