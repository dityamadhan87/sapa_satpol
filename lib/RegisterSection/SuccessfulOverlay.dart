import 'package:first_flutter/Components/CustomButton.dart';
import 'package:flutter/material.dart';

class SuccessfulOverlay extends StatelessWidget{
  final String message;
  final String description;

  const SuccessfulOverlay({
    super.key,
    this.message = 'Berhasil mendaftarkan akun',
    this.description = 'Akunmu sedang dalam proses verifikasi oleh tim kami. Mohon tunggu hingga 1 x 24 jam.',
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    final double containerWidth = isPortrait ? screenWidth * 0.75 : screenWidth * 0.4;
    final double horizontalPadding = isPortrait ? screenWidth * 0.05 : screenWidth * 0.04;
    final double verticalPadding = isPortrait ? screenWidth * 0.07 : screenWidth * 0.04;
    final double fontSize = isPortrait ? screenWidth * 0.04 : screenWidth * 0.02;

    return Material(
      color: Colors.black.withAlpha(150),
      child: Center(
        child: Container(
          width: containerWidth,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Color(0xFF5F5F54), size: (isPortrait ? screenWidth * 0.15 : screenWidth * 0.07)),
              SizedBox(height: verticalPadding / 2),
              Text(
                message,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: verticalPadding / 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: fontSize * 0.9,
                  color: const Color(0xFF929292),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: verticalPadding / 2),
              CustomButton(
                isOutlined: true,
                label: 'Kembali',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                height: (isPortrait ? screenWidth * 0.12 : screenWidth * 0.06),
                borderRadius: 30,
                fontSize: fontSize,
                backgroundColor: Color(0xFF7D7D66),
              )
            ],
          ),
        ),
      ),
    );
  }
}