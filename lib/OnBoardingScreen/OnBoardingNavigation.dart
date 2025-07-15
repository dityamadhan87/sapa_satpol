import 'package:flutter/material.dart';

class OnBoardingNavigation extends StatelessWidget {
  final int currentIndex;
  final int total;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  const OnBoardingNavigation({
    super.key,
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _circleButton(Icons.arrow_left, onPrev, screenWidth),
            SizedBox(width: screenWidth * 0.03),
            Row(
              children: List.generate(
                total,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  width: screenWidth * 0.02,
                  height: screenWidth * 0.02,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            _circleButton(Icons.arrow_right, onNext, screenWidth),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            'Lewati',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onPressed, double width) {
    return Container(
      width: width * 0.09,
      height: width * 0.09,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(icon, size: width * 0.06),
      ),
    );
  }
}