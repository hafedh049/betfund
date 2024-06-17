import 'dart:ui';

import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: lightGreen, width: 2))),
      child: Stack(
        children: <Widget>[
          Opacity(opacity: .3, child: Image.asset("assets/images/footer.jpeg", width: double.infinity, fit: BoxFit.cover)),
          Center(
            child: Padding(
              padding: padding8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/betfund.png", width: 150),
                            const SizedBox(height: 20),
                            Text("support@betfund.io", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Important Links", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w400)),
                            const SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                const Icon(FontAwesome.caret_right_solid, size: 15, color: lightGreen),
                                const SizedBox(width: 10),
                                Text("Refferal Program", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                const Icon(FontAwesome.caret_right_solid, size: 15, color: transparent),
                                const SizedBox(width: 10),
                                Text("GitBook", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                const Icon(FontAwesome.caret_right_solid, size: 15, color: transparent),
                                const SizedBox(width: 10),
                                Text("FAQ", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Community", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w400)),
                            const SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                const Icon(FontAwesome.caret_right_solid, size: 15, color: transparent),
                                const SizedBox(width: 10),
                                Text("Discord Community", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                const Icon(FontAwesome.caret_right_solid, size: 15, color: transparent),
                                const SizedBox(width: 10),
                                Text("Telegram", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                const Icon(FontAwesome.caret_right_solid, size: 15, color: transparent),
                                const SizedBox(width: 10),
                                Text("X ( Twitter )", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(child: Text("© 2024 X. All Rights Reserved.", style: GoogleFonts.kronaOne(fontSize: 10, color: white, fontWeight: FontWeight.w400))),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
