import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared.dart';

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return Scaffold(
      backgroundColor: abyss,
      body: Padding(
        padding: padding36,
        child: Center(
          child: Container(
            padding: padding8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.elliptical(100, 100),
                bottomEnd: Radius.elliptical(100, 100),
              ),
              border: Border.all(width: 2, color: lightGreen),
            ),
            child: Padding(
              padding: padding36,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/images/betfund.png"),
                  const SizedBox(height: 20),
                  HexagonButton(
                    onTap: () {},
                    color: lightGreen,
                    fill: true,
                    child: Text("Connect Wallet", style: GoogleFonts.kronaOne(fontSize: 16, color: dark, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 30),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onHover: (bool state) => _(() => hover = state),
                        onTap: () {},
                        splashColor: transparent,
                        highlightColor: transparent,
                        hoverColor: transparent,
                        child: Text("Go Back", style: GoogleFonts.kronaOne(fontSize: 20, color: hover ? lightGreen : white, fontWeight: FontWeight.bold)),
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
