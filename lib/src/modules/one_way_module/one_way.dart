// ignore_for_file: library_private_types_in_public_api
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:jmr_task/src/common_widgets/custom_textfromfild.dart';
import 'package:jmr_task/src/modules/one_way_module/widgets/date_field.dart';
import 'package:jmr_task/src/modules/one_way_module/widgets/horizontal_list_view.dart';
import 'package:jmr_task/src/modules/one_way_module/widgets/section_title.dart';
import 'package:jmr_task/src/modules/search_module/search_screen.dart';
import 'package:jmr_task/utils/app_style.dart';
import 'package:jmr_task/utils/color.dart';
import 'package:jmr_task/utils/image.dart';

class OneWay extends StatefulWidget {
  const OneWay({super.key});

  @override
  _OneWayState createState() => _OneWayState();
}

class _OneWayState extends State<OneWay> {

  // Define controllers for "From" and "To" text fields
TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  bool isSwapped = false; // A flag to keep track of swap state
   List<String> _locationResults = []; // Location results list
  bool _isLoading = false; // Loading state
  Timer? _debounce; // Timer for debounce

   /// Debounce function for location input
    /// Debounce function for location input
  void _onLocationSearchChanged(String query, TextEditingController controller) {
    if (_debounce?.isActive ?? false) _debounce?.cancel(); // Correct usage of isActive and cancel
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        _fetchLocationResults(query, controller);
      }
    });
  }

  /// Fetch location results using geocoding
  Future<void> _fetchLocationResults(String query, TextEditingController controller) async {
    setState(() {
      _isLoading = true;
      _locationResults.clear(); // Clear previous search results
    });

    try {
      List<Location> locations = await locationFromAddress(query);

      List<String> locationNames = [];
      for (var loc in locations) {
        List<Placemark> placemarks = await placemarkFromCoordinates(loc.latitude, loc.longitude);
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          locationNames.add("${place.locality}, ${place.administrativeArea}, ${place.country}");
        }
      }

      setState(() {
        _locationResults = locationNames; // Update search results
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _locationResults = [];
        _isLoading = false;
      });
      print("Error fetching locations: $e");
    }
  }

  /// Select a location from the suggestions
  void _selectLocation(String location, TextEditingController controller) {
    setState(() {
      controller.text = location; // Update the respective controller
      _locationResults = []; // Clear suggestions
    });
  }

 

  ///Selection Date Function
  DateTime? departureDate; // Variable to store the selected departure date
  DateTime? returnDate; // Variable to store the selected return date
  bool isReturnEnabled = false;
   void handleDepartureDateSelected(DateTime selectedDate) {
    setState(() {
      departureDate = selectedDate;
      isReturnEnabled = true; // Enable the Return date field
      returnDate = null; // Reset return date when a new departure date is selected
    });
  }

  void handleReturnDateSelected(DateTime selectedDate) {
    setState(() {
      returnDate = selectedDate;
    });
  }

  // Define the list of cabin classes
  List<String> cabinClasses = [
    'Economy Class',
    'Business Class',
    'First Class'
  ];

  // Define the selected value for the dropdown
  String selectedCabinClass = 'Economy Class';

// List of travel inspiration items
    final List<Map<String, String>> travelInspirations = [
      {
        'image': saudi,
        'title': 'From AED867',
        'subtitle': 'Economy round trip',
        'country': 'Saudi Arabia',
      },
      {
        'image': kuwait,
        'title': 'From AED867',
        'subtitle': 'Economy round trip',
        'country': 'Kuwait',
      },
      // Add more items if needed
    ];

    // List of flight and hotel package items
    final List<Map<String, String>> flightHotelPackages = [
      {
        'image': hotel,
        'title': 'Build your vacation!',
        'subtitle': 'Unbeatable prices!',
      },
      // Add more items if needed
    ];

  // Method to swap "From" and "To" field values
  void swapFromToControllers() {
    setState(() {
      // Toggle the isSwapped flag
      isSwapped = !isSwapped;
    });
  }  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: screenHeight *
            0.02, // Adjust vertical padding based on screen height
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Flight search container
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(screenHeight * 0.01),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              
          ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  isSwapped ? 'assets/images/location.png' : 'assets/images/flight.png',
                ),
                title: TextField(
                  controller: isSwapped ? toController : fromController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: isSwapped ? 'To' : 'From',
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  onChanged: (value) => _onLocationSearchChanged(value, fromController),
                ),
              ),
              if (_isLoading) const Center(child: CircularProgressIndicator()),
              if (_locationResults.isNotEmpty && (isSwapped ? toController : fromController).text.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _locationResults.length,
                  itemBuilder: (context, index) {
                    final location = _locationResults[index];
                    return ListTile(
                      title: Text(location),
                      onTap: () => _selectLocation(location, isSwapped ? toController : fromController),
                    );
                  },
                ),
                
              // Divider and swap button
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.04),
                      child: Container(
                        height: screenHeight * 0.002,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.green, Colors.white],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/filter.png', fit: BoxFit.cover),
                    onPressed: swapFromToControllers,
                  ),
                ],
              ),
              
              // To field with suggestions
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  isSwapped ? 'assets/images/flight.png' : 'assets/images/location.png',
                ),
                title: TextField(
                  controller: isSwapped ? fromController : toController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: isSwapped ? 'From' : 'To',
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  onChanged: (value) => _onLocationSearchChanged(value, toController),
                ),
              ),
              if (_locationResults.isNotEmpty && (isSwapped ? fromController : toController).text.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _locationResults.length,
                  itemBuilder: (context, index) {
                    final location = _locationResults[index];
                    return ListTile(
                      title: Text(location),
                      onTap: () => _selectLocation(location, isSwapped ? fromController : toController),
                    );
                  },
                ),
            ],
          ),
        ),
           
      
          SizedBox(height: screenHeight * 0.03),
  ///Date section
          Row(
            children: [
              Expanded(
                  child: customDateField(context,
                     date: departureDate ?? DateTime.now(),
                      title: 'Departure',
                      isEnabled: true,
                      onDateSelected: handleDepartureDateSelected,)), // Provide a date for the first field
              const SizedBox(width: 5),
             Expanded(
  child: customDateField(
    context,
    date: returnDate ?? DateTime.now(),
    title: 'Return',
    isEnabled: isReturnEnabled, 
    minDate: departureDate ?? DateTime.now(),
    initialDate: returnDate ?? departureDate ?? DateTime.now(), // Set the initial date to avoid error
    onDateSelected: handleReturnDateSelected,
  ),
),
// Provide a date for the second field
            ],
          ),
        
          SizedBox(height: screenHeight * 0.03),
          ///passenger section
          Row(
            children: [
              Expanded(
                child: customTextFild(
                  controller: TextEditingController(),
                  title: ' Passenger', // Hint text for the field
                  isEnabled: true,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedCabinClass,
                  icon: const Icon(Icons.arrow_drop_down),
                  decoration: InputDecoration(
                    labelText: 'Cabin Class',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCabinClass = newValue!;
                    });
                  },
                  items: cabinClasses
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        
          SizedBox(height: screenHeight * 0.03),
          ///Search button
         Center(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
      ),
      minimumSize: const Size(150, 50), // Width and height
      backgroundColor: button, // Background color
      foregroundColor:white
    ),
   onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SearchScreen(
        fromLocation: fromController.text,
        toLocation: toController.text,
        departureDate: departureDate,
        returnDate: returnDate,
        selectedCabinClass: selectedCabinClass,
      ),
    ),
  );
},
    child: Text('Search Flights',style:appstyle(14, white, FontWeight.w500),),
  ),
),

          SizedBox(height: screenHeight * 0.03),
          // Travel Inspirations Section
          sectionTitle(
            title: 'Travel Inspirations',
            trailing: 'Dubai',
          ),
          SizedBox(height: screenHeight * 0.015),
          horizontalListView(context, items: travelInspirations),

          SizedBox(height: screenHeight * 0.02),

          // Flight & Hotel Packages Section
          sectionTitle(
            title: 'Flight & Hotel Packages',
          ),
          SizedBox(height: screenHeight * 0.015),
          ListView.builder(
            shrinkWrap: true, // Allow list to occupy only required space
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling in the list view
            itemCount: flightHotelPackages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(flightHotelPackages[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                height: screenHeight * 0.25, // Adjust the height as needed
              );
            },
          ),
        ],
      ),
    );
  }
}
