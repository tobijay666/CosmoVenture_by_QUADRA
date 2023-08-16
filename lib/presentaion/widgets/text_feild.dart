import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.labelText,
    this.obscureText = false,
    required this.textEditingController,
    this.textInputAction,
    this.initialValue,
    this.lines,
    this.hintText,
    this.keyboardType,
    this.color,
    this.textAlign,
  }) : super(key: key);

  final String? labelText;
  final bool obscureText;
  final String? color;
  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final String? hintText;
  final int? lines;

  final TextInputType? keyboardType;
  final TextAlign? textAlign;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  bool isFilled = false;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    //widget.textEditingController.dispose();
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        isFilled = true;
      });
    } else {
      setState(() {
        isFilled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(
                widget.labelText!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: widget.color == null
                          ? AppColors.whiteColor
                          : AppColors.black,
                    ),
              )
            : Container(),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
          ),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            initialValue: widget.initialValue,
            controller: widget.textEditingController,
            textInputAction: widget.textInputAction,
            focusNode: _focusNode,
            textAlignVertical: TextAlignVertical.center,
            textAlign: widget.textAlign ?? TextAlign.start,
            obscureText: widget.obscureText && !isVisible,
            maxLines: widget.lines,
            cursorColor: AppColors.black,
            style: Theme.of(context).textTheme.headlineSmall,
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: Colors.white,
              filled: isFilled,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.outlineColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // Set the background color to white for enabled border

                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.outlineColor,
                ),
                gapPadding: 0, // Adjust this value if needed
              ),
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.outlineColor),
              ),
              suffixIcon: widget.obscureText
                  ? Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: SvgPicture.asset(
                          isVisible
                              ? AppImages.iconVisibilityShow
                              : AppImages.iconVisibilityHide,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
