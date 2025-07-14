import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF5F5F54),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/images/logo_sapa_satpol.svg',
                            width: screenWidth * 0.3,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            'SAPA SATPOL',
                            style: TextStyle(
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            'Suaramu, Aksimu untuk Kota Batu',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo_batu.png',
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Image.asset(
                              'assets/images/logo_satpol.png',
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Flexible(
                              child: Text(
                                'Dikelola di bawah Satuan Polisi Pamong Praja Kota Batu dan Pemerintah Kota Batu',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
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
            );
          },
        ),
      ),
    );
  }
}
