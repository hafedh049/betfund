import 'package:betfund/views/holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared.dart';

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
    bool goBack = false;
    bool connectState = false;
    return Scaffold(
      backgroundColor: abyss,
      body: Padding(
        padding: const EdgeInsets.all(128),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/empty_green_hexagon.png"), fit: BoxFit.contain)),
            child: Padding(
              padding: padding36,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/images/betfund.png", width: 397, height: 79),
                  const SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const Holder()), (Route route) => false),
                        highlightColor: transparent,
                        splashColor: transparent,
                        hoverColor: transparent,
                        onHover: (bool value) => _(() => connectState = value),
                        child: AnimatedScale(
                          scale: connectState ? 1.05 : 1,
                          duration: 200.ms,
                          child: AnimatedContainer(
                            duration: 200.ms,
                            width: 200,
                            height: 54,
                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/${!connectState ? 'filled' : 'empty'}_green_hexagon.png"), fit: BoxFit.contain)),
                            child: AnimatedDefaultTextStyle(
                              duration: 200.ms,
                              style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: connectState ? lightGreen : dark),
                              child: const Text("Connect Wallet"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onHover: (bool state) => _(() => goBack = state),
                        onTap: () {},
                        splashColor: transparent,
                        highlightColor: transparent,
                        hoverColor: transparent,
                        child: Text("Go Back", style: GoogleFonts.kronaOne(fontSize: 14, color: goBack ? lightGreen : white, fontWeight: FontWeight.w400)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
