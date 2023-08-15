import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.isWhiteGradient = false,
    this.buttonIcon,
    this.isDisabled = false,
    this.width,
  }) : super(key: key);

  final String title;
  final Function() onPress;
  final bool isWhiteGradient;
  final IconData? buttonIcon;
  final bool isDisabled;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          boxShadow: const [],
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: isDisabled ? AppColors.disabledButtonGreyColor : null,
          gradient: !isDisabled
              ? LinearGradient(
                  colors: isWhiteGradient
                      ? const [
                          AppColors.greyColor,
                          AppColors.whiteColor,
                        ]
                      : const [
                          AppColors.outlineColor,
                          AppColors.outlineColor2,
                        ],
                )
              : null),
      child: TextButton(
        onPressed: isDisabled ? null : onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: isDisabled
                        ? AppColors.disabledButtonFontGreyColor
                        : isWhiteGradient
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                  ),
            ),
            buttonIcon != null
                ? const SizedBox(
                    width: 10,
                  )
                : Container(),
            buttonIcon != null
                ? Icon(
                    buttonIcon,
                    color: isWhiteGradient
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
