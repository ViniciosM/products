import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../consts/p_colors.dart';

class PLabel extends StatelessWidget {
  const PLabel(
      {required this.text,
      this.color = PColors.primaryColor,
      this.fontSize = 15,
      this.fontWeight = FontWeight.w400,
      this.maxLines = 1,
      this.textAlign = TextAlign.left,
      this.textOverflow = TextOverflow.ellipsis,
      this.letterSpacing = 0.25,
      super.key});

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int maxLines;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
