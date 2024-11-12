import 'package:flutter/material.dart';
import 'package:jmr_task/utils/app_style.dart';
import 'package:jmr_task/utils/color.dart';

Widget flightButton(BuildContext context, {
  String? title, 
  String? subtitle,
  bool isSelected = false
  }) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: isSelected ? button : Color(0xFFc8c8c8),),
        borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical:screenHeight * 0.012,horizontal:screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            title!,
            textAlign: TextAlign.center,
            style: appstyle(12, const Color(0xFF434343), FontWeight.w600),
          ),
          //SizedBox(height: screenHeight * 0.001),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: appstyle(12, Color(0xFF434343), FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
