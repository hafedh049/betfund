import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

Future<void> main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CustomPaint(
            size: Size(800, (800 * 0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: const RPSCustomPainter(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(FontAwesome.wallet_solid, color: lightGreen, size: 15),
                  const SizedBox(width: 10),
                  Text("\$3500.00", style: GoogleFonts.abel(fontSize: 16, fontWeight: FontWeight.w500, color: dark)),
                  const SizedBox(width: 10),
                  CustomPaint(
                    size: Size(300, (300 * 0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: const RPSCustomPainter(fill: true),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Text("Wallet", style: GoogleFonts.abel(fontSize: 16, fontWeight: FontWeight.w500, color: dark))),
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

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.color, this.filled = false, required this.child});
  final bool filled;
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          color: filled ? color : transparent,
          child: child,
        ),
      ],
    );
  }
}
