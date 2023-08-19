import 'package:cosmoventure/presentaion/widgets/drop_down.dart';
import 'package:cosmoventure/presentaion/widgets/feature_slider_card.dart';
import 'package:cosmoventure/presentaion/widgets/recent_card.dart';
import 'package:cosmoventure/presentaion/widgets/text_feild.dart';
import 'package:cosmoventure/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

class SearchScreen extends StatefulWidget {
  final String uid;
  const SearchScreen({super.key, required this.uid});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  String filterDropdownValue = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          AppStrings.search,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: CustomTextField(
                    textEditingController: searchController,
                    hintText: "Search... ",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withOpacity(0.5),
                      border: Border.all(
                        color: AppColors.outlineColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the border radius as needed
                    ),
                    child: InkWell(
                      onTap: () {
                        // Show the popup menu
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(10, 150, 0, 0),
                          items: [
                            PopupMenuItem(
                              child: Text('Option 1'),
                              value: 'Option 1',
                            ),
                            PopupMenuItem(
                              child: Text('Option 2'),
                              value: 'Option 2',
                            ),
                            PopupMenuItem(
                              child: Text('Option 3'),
                              value: 'Option 3',
                            ),
                          ],
                        );
                      },
                      child: Icon(
                        Icons.filter_list,
                        size: 30,
                        color: AppColors.outlineColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Recent",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 8.0, // Adjust the spacing between items
              runSpacing: 8.0, // Adjust the run spacing
              children: const [
                RecentCard(
                  text: "Mars",
                ),
                RecentCard(
                  text: "Venus",
                ),
                RecentCard(
                  text: "Jupiter",
                ),
                RecentCard(
                  text: "Neptune",
                ),
                RecentCard(
                  text: "Mercury",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Search Suggestions",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.outlineColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.popular1,
                              height: 100,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Mars',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.outlineColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.popular2,
                              height: 100,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Venus',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.outlineColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.slider2,
                              height: 100,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Jupiter ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.outlineColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.slider3,
                              height: 100,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Neptune',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
