import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    super.key,
    required this.onTap,
    required this.txt,
  });

  final void Function() onTap;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        fixedSize: const Size(200, 45),
      ),
      child: Text(
        txt,
        style: GoogleFonts.taviraj(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
