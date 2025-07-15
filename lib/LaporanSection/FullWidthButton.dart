import 'package:flutter/material.dart';

class FullWidthButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const FullWidthButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<FullWidthButton> createState() => _FullWidthButtonState();
}

class _FullWidthButtonState extends State<FullWidthButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onTap();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.05,
          horizontal: screenWidth * 0.08,
        ),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey.shade300 : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.blueGrey,
              width: screenWidth * 0.002,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
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