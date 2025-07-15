import 'package:flutter/material.dart';

class LabelledTextField extends StatelessWidget {
  final String label;
  final double screenWidth;
  final String hintText;
  final bool isPortrait;
  final bool obscureText;

  const LabelledTextField({
    super.key,
    required this.label,
    required this.screenWidth,
    required this.hintText,
    required this.isPortrait,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ],
          ),
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenWidth * 0.015),
        TextField(
          obscureText: obscureText,
          style: TextStyle(fontSize: screenWidth * 0.035),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: screenWidth * 0.035),
            contentPadding: EdgeInsets.symmetric(
              vertical: (isPortrait ? screenWidth * 0.02 : screenWidth * 0.03),
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
            ),
          ),
        ),
      ],
    );
  }
}