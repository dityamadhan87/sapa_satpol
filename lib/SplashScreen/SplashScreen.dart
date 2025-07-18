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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: (isPortrait ? screenHeight * 0.03 : screenWidth * 0.03),
                      horizontal: (isPortrait ? screenHeight * 0.02 : screenWidth * 0.02),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: (isPortrait ? screenHeight * 0.05 : screenWidth * 0.05)),

                        // Logo & teks utama
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/images/logo_sapa_satpol.svg',
                              width: isPortrait
                                  ? screenHeight * 0.15
                                  : screenWidth * 0.15,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: (isPortrait ? screenHeight * 0.02 : screenWidth * 0.02)),
                            Text(
                              'SAPA SATPOL',
                              style: TextStyle(
                                fontSize: (isPortrait
                                    ? screenHeight * 0.03
                                    : screenWidth * 0.03),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: (isPortrait ? screenHeight * 0.01 : screenWidth * 0.01)),
                            Text(
                              'Suaramu, Aksimu untuk Kota Batu',
                              style: TextStyle(
                                fontSize: (isPortrait
                                    ? screenHeight * 0.015
                                    : screenWidth * 0.015),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        // Footer
                        Padding(
                          padding: EdgeInsets.only(top: (isPortrait ? screenHeight * 0.03 : screenWidth * 0.03)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: (isPortrait
                                ? screenHeight * 0.02
                                : screenWidth * 0.02),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: (isPortrait
                                    ? screenHeight * 0.02
                                    : screenWidth * 0.02),
                                children: [
                                  Image.asset(
                                    'assets/images/logo_batu.png',
                                    width: (isPortrait
                                        ? screenHeight * 0.04
                                        : screenWidth * 0.04),
                                    fit: BoxFit.contain,
                                  ),
                                  Image.asset(
                                    'assets/images/logo_satpol.png',
                                    width: (isPortrait
                                        ? screenHeight * 0.04
                                        : screenWidth * 0.04),
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
                                child: Text(
                                  'Dikelola di bawah Satuan Polisi Pamong Praja Kota Batu dan Pemerintah Kota Batu',
                                  style: TextStyle(
                                    fontSize: (isPortrait ? screenHeight * 0.015 : screenWidth * 0.015),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}