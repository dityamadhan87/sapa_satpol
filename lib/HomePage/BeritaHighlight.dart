import 'package:first_flutter/HomePage/Berita.dart';
import 'package:flutter/material.dart';

class BeritaHighlight extends StatelessWidget {
  final Berita berita;

  const BeritaHighlight({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Builder(
              builder: (context) {
                final orientation = MediaQuery.of(context).orientation;
                final imageHeight = orientation == Orientation.portrait
                    ? screenWidth * 0.42
                    : screenWidth * 0.52;

                return Image.asset(
                  berita.imagePath,
                  width: double.infinity,
                  height: imageHeight,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  berita.judul,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                  ),
                ),

                SizedBox(height: screenWidth * 0.02),

                Text(
                  berita.deskripsi,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
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