import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/onboarding');
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF5F5F54),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: screenHeight * 0.05),

                    // Logo & teks utama
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/logo_sapa_satpol.svg',
                          width: isPortrait
                              ? screenWidth * 0.3
                              : screenWidth * 0.2,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'SAPA SATPOL',
                          style: TextStyle(
                            fontSize: (isPortrait
                                    ? screenWidth * 0.055
                                    : screenWidth * 0.045),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'Suaramu, Aksimu untuk Kota Batu',
                          style: TextStyle(
                            fontSize: (isPortrait
                                    ? screenWidth * 0.035
                                    : screenWidth * 0.025),
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    if (!isPortrait) SizedBox(height: screenHeight * 0.05),

                    // Footer
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo_batu.png',
                            width: (isPortrait
                                ? screenWidth * 0.1
                                : screenWidth * 0.08),
                            height: (isPortrait
                                ? screenWidth * 0.1
                                : screenWidth * 0.08),
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Image.asset(
                            'assets/images/logo_satpol.png',
                            width: (isPortrait
                                ? screenWidth * 0.1
                                : screenWidth * 0.08),
                            height: (isPortrait
                                ? screenWidth * 0.1
                                : screenWidth * 0.08),
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Flexible(
                            child: Text(
                              'Dikelola di bawah Satuan Polisi Pamong Praja Kota Batu dan Pemerintah Kota Batu',
                              style: TextStyle(
                                fontSize: (isPortrait
                                    ? screenWidth * 0.03
                                    : screenWidth * 0.025),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}