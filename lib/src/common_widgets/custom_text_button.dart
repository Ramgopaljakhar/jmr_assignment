import 'package:flutter/material.dart';
import 'package:jmr_task/utils/app_style.dart';

Widget customTextButton({
  required String title,
  VoidCallback? onpress,
  TextStyle? style, // Custom text style for the title
  String? imagePath, // Path to the image
  bool imageAfterText = false, // Set to true if you want the image after the text
  bool border = false, // Set to true if you want a border
  Color? bordercolor, // Border color (can be null for default)
  double? width, // Custom width for the button
  double? height, // Custom height for the button
  double? borderWidth = 1, // Custom border width (default is 1)
  BorderRadius? borderRadius, // Border radius for the button
  Color? imageColor, // Optional: Image color (for tinting the image)
}) {
  return TextButton(
    style: TextButton.styleFrom(
      side: border
          ? BorderSide(color: bordercolor ?? const Color(0xFF434343), width: borderWidth!) // Use custom border width if provided
          : BorderSide.none, // No border if 'border' is false
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8), // Optional: Add border radius if needed
      ),
      minimumSize: Size(width ?? 100, height ?? 40), // Set custom width and height
    ),
    onPressed: onpress,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: imagePath != null
          ? imageAfterText
              ? [
                  Text(
                    title,
                    style: style ?? appstyle(14, const Color(0xFF434343), FontWeight.w600), // Apply custom style if provided
                  ),
                  const SizedBox(width: 8), // Space between text and image
                  Image.asset(
                    imagePath,
                    width: 16,
                    height: 16,
                    color: imageColor, // Apply color to the image if provided
                  ), // Display the image
                ]
              : [
                  Image.asset(
                    imagePath,
                    width: 16,
                    height: 16,
                    color: imageColor, // Apply color to the image if provided
                  ), // Display the image
                  const SizedBox(width: 8), // Space between image and text
                  Text(
                    title,
                    style: style ?? appstyle(14, const Color(0xFF434343), FontWeight.w600), // Apply custom style if provided
                  ),
                ]
          : [
              Text(
                title,
                style: style ?? appstyle(14, const Color(0xFF434343), FontWeight.w600), // Apply custom style if provided
              ),
            ],
    ),
  );
}
