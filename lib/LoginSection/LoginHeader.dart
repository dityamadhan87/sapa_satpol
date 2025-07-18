import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginHeader extends StatelessWidget {
  final bool isPortrait;
  final double screenWidth;

  const LoginHeader({
    super.key,
    required this.isPortrait,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (isPortrait ? screenWidth * 0.2 : screenWidth * 0.1),
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
          SizedBox(height: screenWidth * 0.08),
          Text(
            "Login",
            style: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.075 : screenWidth * 0.06),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            "Kami senang bertemu Anda lagi!",
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