import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle1({
  double fontSize = 30,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return GoogleFonts.mitr(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: 1.3,
  );
}

TextStyle customTextStyle2({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return GoogleFonts.taviraj(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
