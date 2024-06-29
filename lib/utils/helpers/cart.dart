import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../shared.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedPage = 0;

  final List<String> _pages = const <String>["Straight", "Parlay"];

  final PageController _pagesController = PageController();

  bool _placeState = false;
  bool _clearState = false;

  @override
  void dispose() {
    _pagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 350,
        height: 390,
        color: elevenThirteen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: oneE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: lightGreen,
                        child: Text("2", style: GoogleFonts.kronaOne(fontSize: 14, color: dark, fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(width: 10),
                      Text("PickSlip", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return Row(
                        children: <Widget>[
                          for (final String page in _pages)
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _(() => _selectedPage = _pages.indexOf(page));
                                  _pagesController.animateToPage(_selectedPage, duration: 200.ms, curve: Curves.linear);
                                },
                                splashColor: transparent,
                                highlightColor: transparent,
                                hoverColor: transparent,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(page, style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: AnimatedContainer(
                                            duration: 200.ms,
                                            height: 3,
                                            color: _selectedPage == _pages.indexOf(page) ? lightGreen : transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: padding16,
                child: PageView(
                  controller: _pagesController,
                  children: <Widget>[
                    for (int index = 0; index < 2; index++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Over 209.5 (DAL @MIN)", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              IconButton(onPressed: () {}, icon: const Icon(FontAwesome.x_solid, size: 15, color: white)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text("Total Points", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text("-112", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: padding8,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: oneE),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("Pick", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w400)),
                                      Text("\$ 10", style: GoogleFonts.kronaOne(fontSize: 16, color: white, fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  padding: padding8,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: oneE),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("To Win", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w400)),
                                      Text("\$ 19.64", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Text("To Collect", style: GoogleFonts.kronaOne(fontSize: 16, color: lightGreen, fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Text("46.22 USD", style: GoogleFonts.kronaOne(fontSize: 16, color: white, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Container(
              color: oneE,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onTap: () {},
                        highlightColor: transparent,
                        splashColor: transparent,
                        hoverColor: transparent,
                        onHover: (bool value) => _(() => _clearState = value),
                        child: AnimatedScale(
                          scale: _clearState ? 1.05 : 1,
                          duration: 200.ms,
                          child: AnimatedContainer(
                            duration: 200.ms,
                            width: 150,
                            height: 54,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/white_hex.png"), fit: BoxFit.contain)),
                            child: AnimatedDefaultTextStyle(
                              duration: 200.ms,
                              style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: white),
                              child: const Text("Clear"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onTap: () {},
                        highlightColor: transparent,
                        splashColor: transparent,
                        hoverColor: transparent,
                        onHover: (bool value) => _(() => _placeState = value),
                        child: AnimatedScale(
                          scale: _placeState ? 1.05 : 1,
                          duration: 200.ms,
                          child: AnimatedContainer(
                            duration: 200.ms,
                            width: 150,
                            height: 54,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/launch_${_placeState ? 'hovered' : 'normal'}.png"), fit: BoxFit.contain)),
                            child: AnimatedDefaultTextStyle(
                              duration: 200.ms,
                              style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: _placeState ? lightGreen : dark),
                              child: const Text("Place Pick"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
