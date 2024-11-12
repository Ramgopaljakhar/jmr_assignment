import 'package:flutter/material.dart';
import 'package:jmr_task/src/common_widgets/tab_item.dart';
import 'package:jmr_task/src/modules/one_way_module/one_way.dart';
import 'package:jmr_task/utils/app_style.dart';
import 'package:jmr_task/utils/color.dart';
import 'package:jmr_task/utils/image.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarbackcolor,
        title: Text(
          'Search Flights',
          style: appstyle(18, appbartitle, FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Image.asset(menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Image section
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(homeimg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 25),
                  child: Text(
                    "Let's start your trip",
                    style: appstyle(18, Colors.white, FontWeight.w500),
                  ),
                ),
              ),
              // Positioned TabBar section
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17, // Adjust this value to control overlap
                left: 20,
                right: 20,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: const [
                      TabItem(title: 'Round Trip'),
                      TabItem(title: 'One Way'),
                      TabItem(title: 'Multi-city'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // TabBarView section
           SizedBox(height: MediaQuery.of(context).size.height * 0.019),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
              children: const [
                Center(child: Text("Round Trip Content Coming soon")),
                Center(child: OneWay()),
                Center(child: Text("Multi-city Content Coming soon")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
