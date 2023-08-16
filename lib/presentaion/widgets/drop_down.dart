import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> lst;
  final Function(String?) onChanged;
  final String? labelText;
  final String value;

  const CustomDropDown(
      {super.key,
      required this.lst,
      required this.onChanged,
      this.labelText,
      required this.value});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
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
        Text(
          widget.labelText == null ? "" : widget.labelText!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
        const SizedBox(height: 2.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color to white
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: AppColors.textFieldFillColor,
              filled: isFilled,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.lightGrayColor,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            isExpanded: true,
            value: widget.value,
            elevation: 16,
            onChanged: widget.onChanged,
            items: widget.lst.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
