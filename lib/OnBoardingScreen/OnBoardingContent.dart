import 'package:first_flutter/OnBoardingScreen/OnBoardingNavigation.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final int currentIndex;
  final int total;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  const OnBoardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.065,
        vertical: screenWidth * 0.08,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: screenWidth * 0.05),
          OnBoardingNavigation(
            currentIndex: currentIndex,
            total: total,
            onNext: onNext,
            onPrev: onPrev,
          ),
        ],
      ),
    );
  }
}