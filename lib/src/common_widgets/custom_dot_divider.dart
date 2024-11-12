import 'package:flutter/material.dart';

Widget customDotDivider (

){
  return Row(
  children: [
    Container(
      width: 4, // Adjust the width for the left solid line
      height: 24, // Height of the left solid line
      //color: Colors.purple, // Adjust color as needed
    ),
    Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                (constraints.constrainWidth() / 8).floor(), // Adjust spacing
                (index) => Container(
                  width: 4, // Width of each dash
                  height: 1, // Height of each dash
                  color: Colors.grey, // Adjust color as needed
                ),
              ),
            );
          },
        ),
      ),
    ),
  ],
);

}