import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String label;

  const FullWidthButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(label)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.05,
        ),
        decoration: const BoxDecoration(
          color: Colors.white, // putih, sama dengan background halaman
          border: Border(
            bottom: BorderSide(
              color: Colors.blueGrey, // warna border bawah
              width: 1,               // ketebalan border bawah
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: screenWidth * 0.04,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}