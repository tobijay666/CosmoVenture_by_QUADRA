
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import 'gradient_button.dart';

class MsgDialog extends StatelessWidget {
  const MsgDialog(
    BuildContext context, {
    Key? key,
    required this.title,
    this.description,
    required this.buttonTitle,
    required this.imagePath,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final String? description;
  final String buttonTitle;
  final String imagePath;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Wrap(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 60,
                  height: 70,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.black,
                      ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.textLabelGreyColor,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GradientButton(
                  title: buttonTitle,
                  onPress: onPress,
                  width: 133,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
