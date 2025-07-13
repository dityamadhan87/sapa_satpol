import 'package:first_flutter/HomePage/BeritaHighlight.dart';
import 'package:first_flutter/HomePage/BeritaItem.dart';
import 'package:first_flutter/HomePage/DummyBerita.dart';
import 'package:first_flutter/HomePage/InfoBox.dart';
import 'package:first_flutter/HomePage/ServiceBox.dart';
import 'package:first_flutter/HomePage/UserHeader.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas
            Container(
              color: const Color(0xFF646452),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + screenHeight * 0.07,
                bottom:
                    MediaQuery.of(context).padding.bottom + screenHeight * 0.04,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserHeader(
                      nama: 'Nama Pengguna',
                      ajakan: 'Yuk laporkan setiap kejadian Anda!',
                      onNotificationTap: () {
                        // aksi ketika notif ditekan
                      },
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Kotak info
                    const InfoBox(),
                  ],
                ),
              ),
            ),

            // Bagian bawah
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Layanan Kami',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceBox(
                        icon: Icons.schedule,
                        label: 'Piket',
                        onTap: () {},
                      ),
                      ServiceBox(
                        icon: Icons.menu_book,
                        label: 'Panduan',
                        onTap: () {},
                      ),
                      ServiceBox(
                        icon: Icons.help_outline,
                        label: 'FAQ',
                        onTap: () {},
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  Text(
                    'Informasi Terbaru',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Berita Highlight
                  BeritaHighlight(berita: beritaHighlight),

                  SizedBox(height: screenHeight * 0.04),

                  Column(
                    children: daftarBeritaLainnya
                        .map((b) => BeritaItem(berita: b))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
