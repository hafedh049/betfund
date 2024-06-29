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
              const SizedBox(width: 90),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("WE FUND WINNING SPORTS STRATEGIES UP TO \$50K", style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: white, letterSpacing: 2)),
                    const SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Place Picks on Your Favorite Sports \n& ",
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
                    Text("Take the Funded challenge & show us your skills.", style: GoogleFonts.inter(fontSize: 14.63, fontWeight: FontWeight.w400, color: white)),
                    const SizedBox(height: 5),
                    Text("If you have what it takes we will fund all you picks up!", style: GoogleFonts.inter(fontSize: 14.63, fontWeight: FontWeight.w400, color: white)),
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
                                child: AnimatedContainer(
                                  duration: 200.ms,
                                  width: 188,
                                  height: 54,
                                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/launch_${buyState ? 'hovered' : 'normal'}.png"))),
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
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          highlightColor: transparent,
                          splashColor: transparent,
                          hoverColor: transparent,
                          child: Image.asset("assets/images/x.png", width: 63, height: 54),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          highlightColor: transparent,
                          splashColor: transparent,
                          hoverColor: transparent,
                          child: Image.asset("assets/images/telegram.png", width: 63, height: 54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      highlightColor: transparent,
                      splashColor: transparent,
                      hoverColor: transparent,
                      child: Image.asset("assets/images/cs.png", width: 335, height: 54),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(height: MediaQuery.sizeOf(context).height, width: 5, color: white),
                    Expanded(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .9,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                          border: Border(
                            top: BorderSide(color: white, width: 5),
                            bottom: BorderSide(color: white, width: 5),
                            right: BorderSide(color: white, width: 5),
                          ),
                          image: DecorationImage(image: AssetImage("assets/images/home_screen.png"), fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 160),
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
