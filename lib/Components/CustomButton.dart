import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isOutlined;
  final Widget? icon;
  final String label;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final double fontSize;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.isOutlined,
    required this.label,
    required this.onPressed,
    this.icon,
    required this.height,
    required this.borderRadius,
    required this.fontSize,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = isOutlined
        ? OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          )
        : ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          );

    final child = icon != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon!,
              SizedBox(width: 8),
              Text(label, style: TextStyle(fontSize: fontSize)),
            ],
          )
        : Text(label, style: TextStyle(fontSize: fontSize, color: isOutlined ? Colors.black : Colors.white));

    return FractionallySizedBox(
      widthFactor: 1.0,
      child: SizedBox(
        height: height,
        child: isOutlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: style,
                child: child,
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: style,
                child: child,
              ),
      ),
    );
  }
}