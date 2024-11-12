import 'package:flutter/material.dart';
import 'package:jmr_task/src/common_widgets/custom_dot_divider.dart';
import 'package:jmr_task/utils/app_style.dart';
import 'package:jmr_task/utils/color.dart';

Widget flightDetailCard(
  BuildContext context, {
  required String onward,
  required String time1,
  required String aED409,
  required String imagefly,
  required String imageflight2,
  required String dot,
  required String time2,
  required String city,
  required String nextcity,
  required String totalTime,
  required String stop,
  ///Return 
     required String return1,
  required String returntime1,
  required String returnaaED359,
  required String returnimagefly,
  required String returnimageflight2,
  required String returndot,
  required String returntime2,
  required String returncity,
  required String returnnextcity,
  required String returntotalTime,
 String? returnstop = "No Stops", 
 required Widget child,
}) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(returnimagefly),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        onward,
                        style: appstyle(14, const Color(0xFF0B0B0B), FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    returnaaED359,
                    style: appstyle(16, button, FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        returntime2,
                        style: appstyle(22, const Color(0xFF0B0B0B), FontWeight.w700),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(returndot),
                          Positioned(
                            child: Image.asset(imageflight2, height: 24, width: 24),
                          ),
                        ],
                      ),
                      Text(
                        returntime1,
                        style: appstyle(22, const Color(0xFF0B0B0B), FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.002),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        returnnextcity,
                        style: appstyle(12, const Color(0xFF0B0B0B), FontWeight.w400),
                      ),
                      Text(
                        returntotalTime,
                        style: appstyle(14, const Color(0xFF0B0B0B), FontWeight.w500),
                      ),
                      Text(
                        returncity,
                        style: appstyle(12, const Color(0xFF0B0B0B), FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                   Text(
                       stop ,
                        style: appstyle(12, const Color(0xFF0B0B0B), FontWeight.w400),
                      ),
                ],
              ),
            ],
          ),
        ),

 const Divider(),

       //return section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(imagefly),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        return1,
                        style: appstyle(14, const Color(0xFF0B0B0B), FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    returnaaED359,
                    style: appstyle(16, button, FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        returntime1,
                        style: appstyle(22, const Color(0xFF0B0B0B), FontWeight.w700),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(returndot), // Background dots image
                          Positioned(
                            child: Image.asset(returnimageflight2, height: 24, width: 24),
                          ),
                        ],
                      ),
                      Text(
                        returntime2,
                        style: appstyle(22, const Color(0xFF0B0B0B), FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.002),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        returncity,
                        style: appstyle(12, const Color(0xFF0B0B0B), FontWeight.w400),
                      ),
                      Text(
                        returntotalTime,
                        style: appstyle(14, const Color(0xFF0B0B0B), FontWeight.w500),
                      ),
                      Text(
                        returnnextcity,
                        style: appstyle(12, const Color(0xFF0B0B0B), FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Text(
                  //   returnstop,
                  //   style: appstyle(12, const Color(0xFF454B50), FontWeight.w500),
                  // ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
        customDotDivider(),
        const SizedBox(height: 10),
        child
      ],
    ),
  );
}
