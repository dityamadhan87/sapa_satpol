import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay extends StatelessWidget {
  final String message;

  const LoadingOverlay({
    super.key,
    this.message = 'Buat akun...',
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    final double spinnerSize = isPortrait ? screenWidth * 0.13 : screenWidth * 0.1;
    final double containerWidth = isPortrait ? screenWidth * 0.6 : screenWidth * 0.4;
    final double horizontalPadding = isPortrait ? screenWidth * 0.05 : screenWidth * 0.04;
    final double verticalPadding = isPortrait ? screenWidth * 0.07 : screenWidth * 0.04;
    final double spacing = isPortrait ? screenWidth * 0.05 : screenWidth * 0.03;
    final double fontSize = isPortrait ? screenWidth * 0.04 : screenWidth * 0.03;

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
              SpinKitFadingCircle(
                color: const Color(0xFF5F5F54),
                size: spinnerSize,
              ),
              SizedBox(height: spacing),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFECECE8),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: double.infinity,
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: const Color(0xFF7D7D66),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}