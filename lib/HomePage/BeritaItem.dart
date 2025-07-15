import 'package:first_flutter/HomePage/Berita.dart';
import 'package:flutter/material.dart';

class BeritaItem extends StatelessWidget {
  final Berita berita;

  const BeritaItem({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.01,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              berita.imagePath,
              width: screenWidth * 0.25,
              height: screenWidth * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  berita.judul,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  berita.deskripsi,
                  style: TextStyle(
                    fontSize: screenWidth * 0.033,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  berita.tanggal,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}