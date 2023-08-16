import 'package:flutter/material.dart';

class CustomDateSelector extends StatefulWidget {
  final Function(DateTime? selectedDate) onDateSelected;

  CustomDateSelector({required this.onDateSelected});

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
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text("Selected Date:"),
            subtitle: Text(
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
  }
}
