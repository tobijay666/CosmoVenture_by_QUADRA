import 'package:cosmoventure/presentaion/bloc/discover/discover_bloc.dart';
import 'package:cosmoventure/presentaion/pages/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
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
  final DiscoverBloc bloc = sl<DiscoverBloc>();
  bool isLoading = false;
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
      body: BlocProvider(
        create: (_) => bloc..add(DiscoverLoading()),
        child: BlocConsumer<DiscoverBloc, DiscoverState>(
          builder: (context, state) {
            if (state is DiscoverLoaded) {
              return _bodyWidget(state.destinationCards);
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

  _bodyWidget(cards) {
    return TabBarView(
      controller: _tabController,
      children: [
        _all(cards),
        _popular(cards),
        _mostViewed(cards),
        _recommend(cards),
      ],
    );
  }

  _all(cards) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                    image: cards[index].image[0],
                    title: cards[index].title,
                    rating: cards[index].rating.toString() + "0",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(
                            uid: widget.uid!,
                            rating: cards[index].rating,
                            title: cards[index].title,
                            age: cards[index].age,
                            cTemp: cards[index].cTemp,
                            coordinates: cards[index].coordinates,
                            density: cards[index].density,
                            description: cards[index].description,
                            distance: cards[index].distance,
                            gravity: cards[index].gravity,
                            hTemp: cards[index].hTemp,
                            image: cards[index].image,
                            lTemp: cards[index].lTemp,
                            magnitude: cards[index].magnitude,
                            oxygen: cards[index].oxygen,
                            price: cards[index].price,
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
      ],
    );
  }

  _popular(cards) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                    image: cards[index].image[0],
                    title: cards[index].title,
                    rating: cards[index].rating.toString() + "0",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(
                            uid: widget.uid!,
                            rating: cards[index].rating,
                            title: cards[index].title,
                            age: cards[index].age,
                            cTemp: cards[index].cTemp,
                            coordinates: cards[index].coordinates,
                            density: cards[index].density,
                            description: cards[index].description,
                            distance: cards[index].distance,
                            gravity: cards[index].gravity,
                            hTemp: cards[index].hTemp,
                            image: cards[index].image,
                            lTemp: cards[index].lTemp,
                            magnitude: cards[index].magnitude,
                            oxygen: cards[index].oxygen,
                            price: cards[index].price,
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
      ],
    );
  }

  _mostViewed(cards) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                    image: cards[index].image[0],
                    title: cards[index].title,
                    rating: cards[index].rating.toString() + "0",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(
                            uid: widget.uid!,
                            rating: cards[index].rating,
                            title: cards[index].title,
                            age: cards[index].age,
                            cTemp: cards[index].cTemp,
                            coordinates: cards[index].coordinates,
                            density: cards[index].density,
                            description: cards[index].description,
                            distance: cards[index].distance,
                            gravity: cards[index].gravity,
                            hTemp: cards[index].hTemp,
                            image: cards[index].image,
                            lTemp: cards[index].lTemp,
                            magnitude: cards[index].magnitude,
                            oxygen: cards[index].oxygen,
                            price: cards[index].price,
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
      ],
    );
  }

  _recommend(cards) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 20),
                  child: DiscoverCard(
                    image: cards[index].image[0],
                    title: cards[index].title,
                    rating: cards[index].rating.toString() + "0",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(
                            uid: widget.uid!,
                            rating: cards[index].rating,
                            title: cards[index].title,
                            age: cards[index].age,
                            cTemp: cards[index].cTemp,
                            coordinates: cards[index].coordinates,
                            density: cards[index].density,
                            description: cards[index].description,
                            distance: cards[index].distance,
                            gravity: cards[index].gravity,
                            hTemp: cards[index].hTemp,
                            image: cards[index].image,
                            lTemp: cards[index].lTemp,
                            magnitude: cards[index].magnitude,
                            oxygen: cards[index].oxygen,
                            price: cards[index].price,
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
      ],
    );
  }
}
