import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';

class CommentsCard extends StatelessWidget {
  const CommentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "@HnneMary1256",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "3 days go",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.greyColor,
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "It's amazing to fly somewhere between earth and space.A dream come true only for those who think they can...",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      "200",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.thumb_down_outlined,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      "20",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
