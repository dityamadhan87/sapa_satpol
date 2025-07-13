import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    /// Fungsi untuk menghitung font yang proporsional
    double scaleFont(double size) {
      return size * (width / 600); // 375 adalah lebar desain referensi
    }

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
                            width: size.width * 0.25,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'SAPA SATPOL',
                            style: TextStyle(
                              fontSize: scaleFont(30),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Suaramu, Aksimu untuk Kota Batu',
                            style: TextStyle(
                              fontSize: scaleFont(20),
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo_batu.png',
                              width: 21,
                              height: 26,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              'assets/images/logo_satpol.svg',
                              width: 21,
                              height: 26,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                'Dikelola di bawah Satuan Polisi Pamong Praja Kota Batu dan Pemerintah Kota Batu',
                                style: TextStyle(
                                  fontSize: scaleFont(15),
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
