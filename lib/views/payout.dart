import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared.dart';

class Payout extends StatefulWidget {
  const Payout({super.key});

  @override
  State<Payout> createState() => _PayoutState();
}

class _PayoutState extends State<Payout> {
  bool _requestState = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 826,
        height: 401,
        padding: padding36,
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC.withOpacity(.3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Request Payout Form", style: GoogleFonts.kronaOne(color: white, fontSize: 32, fontWeight: FontWeight.w400)),
            const SizedBox(height: 30),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return InkWell(
                  onTap: () {},
                  highlightColor: transparent,
                  splashColor: transparent,
                  hoverColor: transparent,
                  onHover: (bool value) => _(() => _requestState = value),
                  child: AnimatedScale(
                    scale: _requestState ? 1.05 : 1,
                    duration: 200.ms,
                    child: AnimatedContainer(
                      duration: 200.ms,
                      width: 230,
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/${!_requestState ? 'filled' : 'empty'}_green_hexagon.png"), fit: BoxFit.contain)),
                      child: AnimatedDefaultTextStyle(
                        duration: 200.ms,
                        style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: _requestState ? lightGreen : dark),
                        child: const Text("Request Payout"),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
