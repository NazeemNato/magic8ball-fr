import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MagicTextWidget extends StatelessWidget {
  const MagicTextWidget({
    Key key,
    @required this.magicText,
  }) : super(key: key);

  final String magicText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        magicText,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 30,
          color: Colors.black87,
        ),
      ),
    );
  }
}
