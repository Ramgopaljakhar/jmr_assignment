import 'package:flutter/material.dart';
import 'package:jmr_task/utils/app_style.dart';
import 'package:jmr_task/utils/color.dart';

Widget topContainer({
  required String title,
  required String subtitle,
  required String label,
  required VoidCallback onButtonPressed,
  required String buttontitle,
  required Widget child,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8,
          offset: Offset(0, 4), // Shadow position
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: appstyle(14, Color(0xFF2F2F2F), FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: appstyle(12, Color(0xFF2F2F2F), FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: appstyle(14, Color(0xFFFA7927), FontWeight.w500),
              ),
              TextButton(
                onPressed: onButtonPressed, // Trigger the provided callback
                child: Text(buttontitle,
                    style: appstyle(12, button, FontWeight.w500).copyWith(
                        decoration: TextDecoration.underline, color: button)),
              ),
            ],
          ),
          const Divider(),
          child
        ],
      ),
    ),
  );
}
