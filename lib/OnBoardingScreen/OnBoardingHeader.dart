import 'package:flutter/material.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.17,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'SAPA SATPOL',
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Image.asset(
            'assets/images/kartun_satpol.png',
            height: isPortrait ? screenHeight * 0.45 : screenHeight * 0.7,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}