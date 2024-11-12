import 'package:flutter/material.dart';
import 'package:jmr_task/src/common_widgets/custom_dot_divider.dart';
import 'package:jmr_task/src/common_widgets/custom_text_button.dart';
import 'package:jmr_task/src/modules/search_module/widgets/button.dart';
import 'package:jmr_task/src/modules/search_module/widgets/flight_detail_card.dart';
import 'package:jmr_task/src/modules/search_module/widgets/top_widget.dart';
import 'package:jmr_task/utils/app_style.dart';
import 'package:jmr_task/utils/color.dart';
import 'package:jmr_task/utils/image.dart';
import 'package:jmr_task/utils/string.dart';

class SearchScreen extends StatefulWidget {
  final String fromLocation;
  final String toLocation;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final String selectedCabinClass;

  const SearchScreen({
    super.key,
    required this.fromLocation,
    required this.toLocation,
    this.departureDate,
    this.returnDate,
    required this.selectedCabinClass,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Format the departure and return dates
    String departureFormatted = widget.departureDate != null
        ? widget.departureDate!.toLocal().toString().split(' ')[0]
        : 'Not selected';
    String returnFormatted = widget.returnDate != null
        ? widget.returnDate!.toLocal().toString().split(' ')[0]
        : 'Not selected';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: appbarbackcolor,
        title: Text(
          'Ezy Travel',
          style: appstyle(18, appbartitle, FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top section with details
              topContainer(
                buttontitle: 'Modify Search',
                title: '${widget.fromLocation} to ${widget.toLocation}',
                label: '(Round Trip)',
                subtitle: 'Departure: $departureFormatted - Return: $returnFormatted',
                onButtonPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customTextButton(
                      imagePath: arrowdown,
                      title: sort,
                      imageAfterText: true,
                      onpress: () {},
                    ),
                    customTextButton(
                      title: nonStop,
                      onpress: () {},
                    ),
                    customTextButton(
                      imagePath: filter_1,
                      title: Filter,
                      imageAfterText: true,
                      onpress: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Date container
              SizedBox(
                height: screenHeight * 0.09,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: flightButton(
                          context,
                          title: 'Mar 22 - Mar 23',
                          subtitle: 'From AED 741',
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  totalflight,
                  style: appstyle(15, const Color(0xFF2F2F2F), FontWeight.w500),
                ),
              ),
              const SizedBox(height: 16),

              // Flight details list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: flightDetailCard(
                      context,
                      onward: onward,
                      aED409: aED409,
                      city: 'BLR - Bengaluru',
                      dot: dot,
                      imageflight2: flight_2,
                      imagefly: fly,
                      nextcity: 'DXB - Dubai',
                      stop: '2 Stops',
                      time1: '14:35',
                      time2: '21:55',
                      totalTime: '4h 30m',

                      // Return flight details
                      return1: 'Return - Garuda Indonesia',
                      returnaaED359: aED359,
                      returncity: 'DXB - Dubai',
                      returndot: dot,
                      returnimageflight2: flight_2,
                      returnimagefly: fly,
                      returnnextcity: 'BLR - Bengaluru',
                      returntime1: '21:55',
                      returntime2: '14:35',
                      returnstop: '2',
                      returntotalTime: '4h 30m',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                customTextButton(
                                  borderRadius: BorderRadius.circular(20),
                                  height: 15,
                                  border: true,
                                  bordercolor: button,
                                  style: appstyle(9, button, FontWeight.w500),
                                  title: 'Cheapest',
                                  imageAfterText: true,
                                  onpress: () {},
                                ),
                                const SizedBox(width: 6),
                                customTextButton(
                                  borderRadius: BorderRadius.circular(20),
                                  height: 15,
                                  border: true,
                                  bordercolor: const Color(0xFF428EE7),
                                  style: appstyle(9, const Color(0xFF428EE7),
                                      FontWeight.w500),
                                  title: 'Refundable',
                                  imageAfterText: true,
                                  onpress: () {},
                                ),
                              ],
                            ),
                            customTextButton(
                              imagePath: arrowdown,
                              title: "Flight Details",
                              style: appstyle(
                                  12, const Color(0xFFFA7927), FontWeight.w600),
                              imageAfterText: true,
                              onpress: () {},
                              imageColor: const Color(0xFFFA7927),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
