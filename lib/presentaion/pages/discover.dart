import 'package:cosmoventure/presentaion/pages/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/discover_card.dart';
import '../widgets/feature_card.dart';
import '../widgets/feature_slider_card.dart';

class DiscoverScreen extends StatefulWidget {
  final String? uid;
  const DiscoverScreen({super.key, this.uid});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool leading = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        title: const Center(child: Text("Discover")),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Popular"),
              Tab(text: "Most Viewed"),
              Tab(text: "Recommend"),
            ],
          ),
        ),
      ),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return TabBarView(
      controller: _tabController,
      children: [
        _all(),
        _popular(),
        _mostViewed(),
        _recommend(),
      ],
    );
  }

  _all() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DestinationScreen(
                                    title: AppStrings.mars,
                                    rating: 4,
                                  )));
                    },
                    child: DiscoverCard(
                        image: AppImages.popular1,
                        title: AppStrings.mars,
                        description: AppStrings.marsDescription,
                        rating: "4.3"),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _popular() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                      image: AppImages.popular1,
                      title: AppStrings.mars,
                      description: AppStrings.marsDescription,
                      rating: "4.3"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _mostViewed() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                      image: AppImages.popular1,
                      title: AppStrings.mars,
                      description: AppStrings.marsDescription,
                      rating: "4.3"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _recommend() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                      image: AppImages.popular1,
                      title: AppStrings.mars,
                      description: AppStrings.marsDescription,
                      rating: "4.3"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
