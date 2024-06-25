import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/shared.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    bool buyState = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 128),
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("WE FUND WINNING SPORTS STRATEGIES UP TO \$50K", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: grey, letterSpacing: 2)),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Place Picks on Your Favorite Sports & ",
                            style: GoogleFonts.kronaOne(fontSize: 55, fontWeight: FontWeight.w400, color: white),
                          ),
                          TextSpan(
                            text: "Earn ",
                            style: GoogleFonts.kronaOne(fontSize: 55, fontWeight: FontWeight.w400, color: lightGreen),
                          ),
                          TextSpan(
                            text: "Rewards",
                            style: GoogleFonts.kronaOne(fontSize: 55, fontWeight: FontWeight.w400, color: white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Take the Funded challenge & show us your skills.", style: GoogleFonts.inter(fontSize: 14.63, fontWeight: FontWeight.w400, color: grey)),
                    const SizedBox(height: 5),
                    Text("If you have what it takes we will fund all you picks up!", style: GoogleFonts.inter(fontSize: 14.63, fontWeight: FontWeight.w400, color: grey)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return InkWell(
                              onTap: () {},
                              highlightColor: transparent,
                              splashColor: transparent,
                              hoverColor: transparent,
                              onHover: (bool value) => _(() => buyState = value),
                              child: AnimatedScale(
                                scale: buyState ? 1.02 : 1,
                                duration: 200.ms,
                                child: Container(
                                  width: 188,
                                  height: 54,
                                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/filled_green_hexagon.png"))),
                                  child: AnimatedDefaultTextStyle(
                                    duration: 200.ms,
                                    style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: buyState ? white : dark),
                                    child: const Text("By Now"),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          highlightColor: transparent,
                          splashColor: transparent,
                          hoverColor: transparent,
                          child: Container(
                            width: 63,
                            height: 54,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/empty_white_hexagon.png"))),
                            child: Image.asset("assets/images/x.png", width: 20.47, height: 22),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          highlightColor: transparent,
                          splashColor: transparent,
                          hoverColor: transparent,
                          child: Container(
                            width: 63,
                            height: 54,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/empty_white_hexagon.png"))),
                            child: Image.asset("assets/images/telegram.png", width: 24, height: 22),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      highlightColor: transparent,
                      splashColor: transparent,
                      hoverColor: transparent,
                      child: Container(
                        width: 325,
                        height: 54,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/empty_green_hexagon.png"))),
                        child: Text("OxcomingsoonxOxcomingsoonxO", style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: lightGreen)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(height: MediaQuery.sizeOf(context).height * .7, width: 3, color: white),
                    Expanded(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .6,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                          border: Border.all(color: white, width: 5),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/home_screen.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 260),
                child: Image.asset("assets/images/funded.png"),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(FontAwesome.caret_right_solid, color: lightGreen, size: 25),
                              const SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: "Make ", style: GoogleFonts.kronaOne(fontSize: 36, fontWeight: FontWeight.w400, color: white)),
                                    TextSpan(text: "33%", style: GoogleFonts.kronaOne(fontSize: 36, fontWeight: FontWeight.w400, color: lightGreen)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(FontAwesome.caret_right_solid, color: lightGreen, size: 25),
                              const SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: "Don't lose  ", style: GoogleFonts.kronaOne(fontSize: 36, fontWeight: FontWeight.w400, color: white)),
                                    TextSpan(text: "15% in a day", style: GoogleFonts.kronaOne(fontSize: 36, fontWeight: FontWeight.w400, color: lightGreen)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(FontAwesome.caret_right_solid, color: lightGreen, size: 25),
                              const SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: "Don't lose ", style: GoogleFonts.kronaOne(fontSize: 36, fontWeight: FontWeight.w400, color: white)),
                                    TextSpan(text: "20% in total", style: GoogleFonts.kronaOne(fontSize: 36, fontWeight: FontWeight.w400, color: lightGreen)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Center(child: Image.network("assets/images/barplot.png", width: 702, height: 760, fit: BoxFit.contain)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
