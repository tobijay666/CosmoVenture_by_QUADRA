import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/comment_card.dart';

class UserCommentsScreen extends StatefulWidget {
  const UserCommentsScreen({super.key});

  @override
  State<UserCommentsScreen> createState() => _UserCommentsScreenState();
}

class _UserCommentsScreenState extends State<UserCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Comments",
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
          children: [
            Stack(children: [
              Image(
                image: AssetImage(AppImages.comments),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160.0, right: 16, left: 16),
                child: Expanded(
                  child: Text(
                    "See Their Thoughts & Add your own ...",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                  ),
                ),
              ),
            ]),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20, // Number of times to display the widget
              itemBuilder: (context, index) => CommentsCard(),
            ),
          ],
        ),
      ),
    );
  }
}
