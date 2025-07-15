import 'package:first_flutter/LaporanSection/MenuDimension.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final MenuDimensions dimensions;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const MenuItem({
    super.key,
    required this.dimensions,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = const Color(0xFF9C9C85);
    final Color inactiveColor = const Color(0xFF9C9C85).withAlpha(80);
    final Color inActiveTextColor = const Color(0xFF9C9C85).withAlpha(150);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Column(
        children: [
          Container(
            width: dimensions.containerSize,
            height: dimensions.containerSize,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                size: dimensions.iconSize,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: dimensions.spacing),
          SizedBox(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: dimensions.fontSize,
                color: isActive ? activeColor : inActiveTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}