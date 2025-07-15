import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterSection extends StatelessWidget {
  final bool isPortrait;
  final double screenWidth;
  final double screenHeight;

  const RegisterSection({
    super.key,
    required this.isPortrait,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (isPortrait ? screenWidth * 0.17 : screenHeight * 0.12),
        horizontal: screenWidth * 0.05,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo_sapa_satpol.svg',
            width: (isPortrait ? screenWidth * 0.25 : screenWidth * 0.2),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            "Daftar",
            style: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.075 : screenWidth * 0.06),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "Selamat datang! Ayo isi data dirimu",
            style: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.045 : screenWidth * 0.035),
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}