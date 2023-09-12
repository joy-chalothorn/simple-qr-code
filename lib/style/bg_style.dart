import 'package:flutter/material.dart';

BoxDecoration customGradientBG() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0.2, 1.0],
      colors: [
        Color(0xFF6FF6FF),
        Color(0xFF71AAFF),
      ],
    ),
  );
}
