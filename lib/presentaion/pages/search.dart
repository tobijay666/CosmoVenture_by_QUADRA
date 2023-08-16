import 'package:cosmoventure/presentaion/widgets/drop_down.dart';
import 'package:cosmoventure/presentaion/widgets/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
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
            )
          ],
        ),
      ),
    ));
  }
}
