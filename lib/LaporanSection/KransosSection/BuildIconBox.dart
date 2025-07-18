import 'package:flutter/material.dart';

Widget BuildIconBox({
  required IconData icon,
  required String label,
  required double size,
  required Color color,
  required VoidCallback onTap,
  required final screenWidth,
  required final isPortrait,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: Colors.white, size: size * 0.4),
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(label, style: TextStyle(color: Colors.black, fontSize: (isPortrait ? screenWidth * 0.035 : screenWidth * 0.025))),
      ],
    ),
  );
}
