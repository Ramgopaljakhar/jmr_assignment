import 'package:flutter/material.dart';

Widget customTextFild({
   String? title,
   bool? isEnabled,
  TextEditingController? controller,
  Border? border
}) {
  // Initialize the controller if not provided
  controller ??= TextEditingController();

  return TextFormField(
    
    controller: controller,
    enabled: isEnabled,
    keyboardType: TextInputType.number, // To accept numeric input for number of passengers
    onChanged: (value) {
      // Update the field with "Passenger" suffix automatically
      if (value.isNotEmpty && !value.contains('Passenger')) {
        controller!.text = '$value Passenger';
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length - 9), // Keep cursor in the right position
        );
      }
    },
    decoration: InputDecoration(
      hintText: title, // Show hint like "Passenger"
    contentPadding:const EdgeInsets.only(left:10),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Metropolis',
        color: isEnabled! ? Colors.black : Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isEnabled ? Colors.black : Colors.grey,
        ),
      ),
    ),
  );
}
