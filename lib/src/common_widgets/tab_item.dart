import 'package:flutter/material.dart';
import 'package:jmr_task/utils/app_style.dart';

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,style:appstyle(12, const Color(0xFF2D2D2D), FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
