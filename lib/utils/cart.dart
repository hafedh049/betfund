import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'helpers/hexagon.dart';
import 'shared.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedPage = 0;

  final List<String> _pages = const <String>["Straight", "Parlay"];

  final PageController _pagesController = PageController();

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
        width: 400,
        height: 380,
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
                        radius: 8,
                        backgroundColor: lightGreen,
                        child: Text("2", style: GoogleFonts.kronaOne(fontSize: 8, color: dark, fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(width: 10),
                      Text("PickSlip", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
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
                                    Text(page, style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Over 209.5 (DAL @MIN)", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            IconButton(onPressed: () {}, icon: const Icon(FontAwesome.x_solid, size: 15, color: white)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Total Points", style: GoogleFonts.kronaOne(fontSize: 12, color: grey, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Text("-112", style: GoogleFonts.kronaOne(fontSize: 12, color: lightGreen, fontWeight: FontWeight.w500)),
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
                                    Text("Pick", style: GoogleFonts.kronaOne(fontSize: 12, color: grey, fontWeight: FontWeight.w500)),
                                    Text("\$ 10", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
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
                                    Text("To Win", style: GoogleFonts.kronaOne(fontSize: 12, color: grey, fontWeight: FontWeight.w500)),
                                    Text("\$ 19.64", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text("To Collect", style: GoogleFonts.kronaOne(fontSize: 12, color: lightGreen, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Text("46.22 USD", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Over 209.5 (DAL @MIN)", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            IconButton(onPressed: () {}, icon: const Icon(FontAwesome.x_solid, size: 15, color: white)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Total Points", style: GoogleFonts.kronaOne(fontSize: 12, color: grey, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Text("-112", style: GoogleFonts.kronaOne(fontSize: 12, color: lightGreen, fontWeight: FontWeight.w500)),
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
                                    Text("Pick", style: GoogleFonts.kronaOne(fontSize: 12, color: grey, fontWeight: FontWeight.w500)),
                                    Text("\$ 10", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
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
                                    Text("To Win", style: GoogleFonts.kronaOne(fontSize: 12, color: grey, fontWeight: FontWeight.w500)),
                                    Text("\$ 19.64", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text("To Collect", style: GoogleFonts.kronaOne(fontSize: 12, color: lightGreen, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Text("46.22 USD", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
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
                  HexagonButton(
                    onTap: () {},
                    color: white,
                    fill: false,
                    child: Text("Clear", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                  ),
                  HexagonButton(
                    onTap: () {},
                    color: lightGreen,
                    fill: true,
                    child: Text("Place Pick", style: GoogleFonts.kronaOne(fontSize: 12, color: dark, fontWeight: FontWeight.w500)),
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
