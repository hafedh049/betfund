import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared.dart';

class Payout extends StatefulWidget {
  const Payout({super.key});

  @override
  State<Payout> createState() => _PayoutState();
}

class _PayoutState extends State<Payout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .4,
        height: MediaQuery.sizeOf(context).height * .4,
        padding: padding36,
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC.withOpacity(.3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Request Payout Form", style: GoogleFonts.abel(color: white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            HexagonButton(
              onTap: () {},
              color: lightGreen,
              fill: true,
              child: Text("Request Payout", style: GoogleFonts.abel(color: dark, fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
