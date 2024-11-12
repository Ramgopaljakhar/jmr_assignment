import 'package:flutter/material.dart';
import 'package:jmr_task/utils/app_style.dart';

Widget horizontalListView(BuildContext context, {
  required final List<Map<String, String>> items
}) {

  return SizedBox(
    height: 250, // Adjust the height based on design
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Container(
          width: 200, // Set width for each card
          margin: const EdgeInsets.only(right: 10), // Spacing between cards
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(item['image']!),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Overlay gradient for text visibility
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Text Overlay
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.containsKey('title') && item['title']!.isNotEmpty)
                      Text(
                        item['title']!,
                        style: appstyle(14, Colors.white, FontWeight.w500),
                      ),
                    if (item.containsKey('subtitle') && item['subtitle']!.isNotEmpty)
                      Text(
                        item['subtitle']!,
                        style: appstyle(12, Colors.white.withOpacity(0.9), FontWeight.w400),
                      ),
                    if (item.containsKey('country') && item['country']!.isNotEmpty)
                      const SizedBox(height: 4),
                    if (item.containsKey('country') && item['country']!.isNotEmpty)
                      Text(
                        item['country']!,
                        style: appstyle(16, Colors.white, FontWeight.bold),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
