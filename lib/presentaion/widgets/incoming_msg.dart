import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';

class incomingMsg extends StatelessWidget {
  const incomingMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.outlineColor.withOpacity(0.5),
            borderRadius:
                BorderRadius.circular(5), // Adjust the radius as needed
          ),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hi how are you ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                  ),
                  Text(
                    "4.00",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
