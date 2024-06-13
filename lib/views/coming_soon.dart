import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared.dart';
import 'footer.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abyss,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Comming  ", style: GoogleFonts.kronaOne(fontSize: 65, color: white, fontWeight: FontWeight.bold)),
                    TextSpan(text: "SOON  ", style: GoogleFonts.kronaOne(fontSize: 65, color: lightGreen, fontWeight: FontWeight.bold)),
                  ],
                ),
              ).animate().fade(duration: 800.ms),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
