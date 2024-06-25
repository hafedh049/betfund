import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/shared.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "Coming ", style: GoogleFonts.kronaOne(fontSize: 120, color: white, fontWeight: FontWeight.bold)),
              TextSpan(text: "SOON", style: GoogleFonts.kronaOne(fontSize: 120, color: lightGreen, fontWeight: FontWeight.bold)),
            ],
          ),
        ).animate().fade(duration: 1.seconds),
      ),
    );
  }
}
