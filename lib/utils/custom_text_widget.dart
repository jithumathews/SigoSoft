import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final double letterSpacing;
  final int? maxLines; // Add maxLines to control the number of lines
  final TextOverflow? overflow; // Add overflow to handle overflow behavior
  final TextDecoration? decoration;

  const CustomTextWidget(
      {super.key,
      required this.text,
      this.fontSize = 21.0,
      this.fontWeight = FontWeight.w400,
      this.color = const Color(0xFF000000),
      this.textAlign = TextAlign.start,
      this.letterSpacing = 0.0,
      this.maxLines, // Optional maxLines for text wrapping
      this.overflow,
      this.decoration // Optional overflow handling
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines, // Set maximum number of lines if provided
      overflow: overflow ??
          TextOverflow.visible, // Handle overflow (default to visible)
      style: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.bodySmall,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration),
    );
  }
}
