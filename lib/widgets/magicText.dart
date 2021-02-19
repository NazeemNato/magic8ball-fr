import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MagicTextWidget extends StatelessWidget {
  const MagicTextWidget({
    Key key,
    @required this.magicText,
    this.fontSize = 30.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String magicText;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        magicText,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: fontSize,
          color: Colors.white,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
