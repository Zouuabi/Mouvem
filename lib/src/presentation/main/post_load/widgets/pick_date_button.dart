import 'package:flutter/material.dart';

import '../../../shared/show_date_picker.dart';

class PickDateButton extends StatefulWidget {
  /// the [PickDateButton] is built with Tile
  /// !  it may cause issues if it is wraped with multi children
  /// you have to explicitly set it's height and width by wrapping it with fixed size parent
  /// or with a flexible widget withing a row , column or stack
  const PickDateButton({
    super.key,
    required this.onDateChanged,
    required this.title,
  });

  final Function(String date) onDateChanged;
  final String title;

  @override
  State<PickDateButton> createState() => _PickDateButtonState();
}

class _PickDateButtonState extends State<PickDateButton> {
  String selectedDate = 'YYYY-MM-DD';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: const Icon(
          Icons.calendar_month_outlined,
        ),
        title: Text(widget.title),
        subtitle: Text(
          selectedDate,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      onTap: () async {
        DateTime? date = await pickDate(context);
        if (date != null) {
          String dateString = date.toString().substring(0, 10);
          setState(() {
            selectedDate = dateString;
          });
          widget.onDateChanged(dateString);
        }
      },
    );
  }
}
