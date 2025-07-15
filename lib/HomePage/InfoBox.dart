import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.02), 
      ),
      child: Row(
        children: [
          // Logo SAPA SATPOL
          SvgPicture.asset(
            'assets/images/logo_sapa_satpol.svg',
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
          ),
          SizedBox(width: screenWidth * 0.03),

          // Teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SAPA SATPOL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  'Sistem Administrasi Pelaporan Satuan Polisi Pamong Praja Kota Batu',
                  style: TextStyle(
                    fontSize: screenWidth * 0.032,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Logo kota 1 & 2
          Row(
            children: [
              Image.asset(
                'assets/images/logo_batu.png',
                width: screenWidth * 0.1,
              ),
              SizedBox(width: screenWidth * 0.03), // jarak
              Image.asset(
                'assets/images/logo_satpol.png',
                width: screenWidth * 0.1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}