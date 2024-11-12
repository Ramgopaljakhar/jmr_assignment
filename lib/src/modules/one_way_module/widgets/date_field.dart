import 'package:flutter/material.dart';

Widget customDateField(
  BuildContext context, {
  required DateTime date,
  required String title,
  required bool isEnabled,
  required Function(DateTime) onDateSelected,
  DateTime? minDate, // Optional minimum date parameter
  DateTime? initialDate, // Add initialDate as a parameter here
}) {
  return GestureDetector(
    onTap: isEnabled
        ? () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: initialDate ?? date, // Use initialDate if provided
              firstDate: minDate ?? DateTime.now(),
              lastDate: DateTime(2100),
            );
            if (selectedDate != null) {
              onDateSelected(selectedDate);
            }
          }
        : null,
    child: AbsorbPointer(
      child: TextFormField(
        enabled: isEnabled,
        decoration: InputDecoration(
          labelText: title,
          suffixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(
          text: '${date.year}-${date.month}-${date.day}',
        ),
      ),
    ),
  );
}
