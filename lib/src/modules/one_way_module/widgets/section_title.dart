import 'package:flutter/material.dart';
import 'package:jmr_task/utils/app_style.dart';


  Widget sectionTitle({
    required String title,
    String? trailing
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: appstyle(16, const Color(0xFF2D2D2D), FontWeight.w600),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: appstyle(16, const Color(0xFF2D2D2D), FontWeight.w600),
          ),
      ],
    );
  }

