import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;

  const CustomButton({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.icon,
    this.iconSize = 24.0,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50.0, // Default height is 50.0 if not provided
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? textColor ?? Colors.white,
              ),
            if (icon != null) const SizedBox(width: 8), 
            Text(
              text??"",
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
