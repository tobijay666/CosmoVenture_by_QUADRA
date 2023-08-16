import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomDateSelector extends StatefulWidget {
  final String labelText;

  final Function(DateTime? selectedDate) onDateSelected;

  const CustomDateSelector(
      {super.key, required this.onDateSelected, required this.labelText});

  @override
  _CustomDateSelectorState createState() => _CustomDateSelectorState();
}

class _CustomDateSelectorState extends State<CustomDateSelector> {
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onDateSelected(selectedDate);
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
          child: ListTile(
            title: Text(
              "${selectedDate?.toLocal()}".split(' ')[0],
            ),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
      ],
    );

    // Row(
    //   children: <Widget>[
    //     Expanded(
    //       child: ListTile(
    //         title: Text("Selected Date:"),
    //         subtitle: Text(
    //           "${selectedDate?.toLocal()}".split(' ')[0],
    //         ),
    //         trailing: Icon(Icons.keyboard_arrow_down),
    //         onTap: () {
    //           _selectDate(context);
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
