import 'dart:ui';

import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class MorePicks extends StatefulWidget {
  const MorePicks({super.key});

  @override
  State<MorePicks> createState() => _MorePicksState();
}

class _MorePicksState extends State<MorePicks> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _tiles = List<Map<String, dynamic>>.generate(
    100,
    (int index) => <String, dynamic>{
      "title": "Point Spread",
      "left": <String, dynamic>{
        "one": "Baltimore Ravens",
        "two": "+5",
        "three": "-115",
      },
      "right": <String, dynamic>{
        "one": "Kansas City Chiefs",
        "two": "-5",
        "three": "-105",
      },
    },
  );

  int _selectedTab = 0;

  final List<String> _tabs = const <String>["Straight", "Parlay"];

  final PageController _tabsController = PageController();

  @override
  void dispose() {
    _searchController.dispose();
    _tabsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abyss,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Container(
                        padding: padding16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: NetworkImage("https://s3-alpha-sig.figma.com/img/d1c0/0b51/5150fb14ae08a1dcd45ef2db8985047d?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qKtXv2RT7TNs79dwGFwOkIIOxlmytwVMH6whDK7BNXQulyoSenhELkklyfh4biXKoR7Wg6nc5up77NTtE-2WN39EQ0-qrmAdaTLkTeIMgfUNWeNvDJbn1HLM0RXdh2zKaFhaeIlR4mFiX60f6-nqh3j4z4ZA7iSl4DcmP-JxnPx0rxnUYhlsWApJPAdRL~iI4LHkORLEdg~wlblP3dsDaJLKCPRV8-oYgw3wC4312imcw1FsdHMN-UerbY3o~xu0j-2Rr7gX6dSUzAbJCBZvOoTorPbWUckisGrHfEZTJdf1kUb7R7CF7r942ppoMHtOBmh~JDodskUSdadKd8CT4A__"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: padding16,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: <Widget>[
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: padding8,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: oneE),
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(text: "08:30 ", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w500)),
                                            TextSpan(text: "PM 06/30/2024 (EST)", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Expanded(
                                      child: Padding(
                                        padding: padding16,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Image.network("https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=l-ZJlFezMABFPkxNoD21FdBihmQs-IO4lNXqnSkUm~-mS6cfBzJXG36p0spd8L5xm2X3IREh~xsVbhW2mZHiDxFBD7vpEvg2eD2neTA3PCXp6iDLrjURLJbWwmLq36~v6VicMVszdOGMFIXvYXTLGP7j0tXQ1yJitOe1i8RSHZc98OPTOzioFuhwFv4~6EScOHvqR46JM-1dQD1f3he8mPZF8-UNwSwpTDet2jeWJpjkA7j91wz1HjF3JokrpHUneQaYJNT5zgFocPqlEp6MmnlGq0fCklCpbvg1fe7OD818oEpBcbpW5GF-icOzJ-G9feE8-5lRhiGLOQexFx6nkA__", height: 20, width: 20),
                                                const SizedBox(width: 10),
                                                Expanded(child: Text("Baltimore Ravens", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500))),
                                                const SizedBox(width: 10),
                                                Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: .5, color: lightGreen)),
                                                  padding: padding4,
                                                  child: Text("0", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: <Widget>[
                                                Image.network("https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=neQBYF573gtOSlt~zpVb99yBlm361WJ910qCznA8S-X0t2FEXqwSLccT2iapnrLxg1Z4TNpzRbWslYldRSdvbSNrufGhQyjM76TP8h8ny06K1RGHOp0CFjB9uUUWkjdyilnYYAgBxsDaDHydnlD~T5G~jlUHpSw5Y~ya84KkJQviOPZzLUaba8MEzbSCByqogUwa7kizZA8QXlQ-h3-oGz8umf6N~txC1iT9Oj9RCA0DFv~BtnA7uSmH5Sq5euIUJVmqhFr583fdkpEyK6XX~tuvVbUoxZtYpm99T5OP9AAOC0MwuWw8KC3rjNR5g9zTkSpVroIJsEbfO7P5b-4A~g__", height: 20, width: 20),
                                                const SizedBox(width: 10),
                                                Expanded(child: Text("Kansas City Chiefs", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500))),
                                                const SizedBox(width: 10),
                                                Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: .5, color: lightGreen)),
                                                  padding: padding4,
                                                  child: Text("0", style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: lightGreen)),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network("https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=l-ZJlFezMABFPkxNoD21FdBihmQs-IO4lNXqnSkUm~-mS6cfBzJXG36p0spd8L5xm2X3IREh~xsVbhW2mZHiDxFBD7vpEvg2eD2neTA3PCXp6iDLrjURLJbWwmLq36~v6VicMVszdOGMFIXvYXTLGP7j0tXQ1yJitOe1i8RSHZc98OPTOzioFuhwFv4~6EScOHvqR46JM-1dQD1f3he8mPZF8-UNwSwpTDet2jeWJpjkA7j91wz1HjF3JokrpHUneQaYJNT5zgFocPqlEp6MmnlGq0fCklCpbvg1fe7OD818oEpBcbpW5GF-icOzJ-G9feE8-5lRhiGLOQexFx6nkA__", height: 20, width: 20),
                          const SizedBox(width: 10),
                          Text("Baltimore Ravens", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("VS", style: GoogleFonts.kronaOne(fontSize: 20, color: white, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Text("NBA", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network("https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=neQBYF573gtOSlt~zpVb99yBlm361WJ910qCznA8S-X0t2FEXqwSLccT2iapnrLxg1Z4TNpzRbWslYldRSdvbSNrufGhQyjM76TP8h8ny06K1RGHOp0CFjB9uUUWkjdyilnYYAgBxsDaDHydnlD~T5G~jlUHpSw5Y~ya84KkJQviOPZzLUaba8MEzbSCByqogUwa7kizZA8QXlQ-h3-oGz8umf6N~txC1iT9Oj9RCA0DFv~BtnA7uSmH5Sq5euIUJVmqhFr583fdkpEyK6XX~tuvVbUoxZtYpm99T5OP9AAOC0MwuWw8KC3rjNR5g9zTkSpVroIJsEbfO7P5b-4A~g__", height: 20, width: 20),
                          const SizedBox(width: 10),
                          Text("Kansas City Chefs", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _searchController,
                  onChanged: (String value) {},
                  style: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "Search by market name or player name",
                    hintStyle: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
                    labelText: "Perform your search",
                    labelStyle: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: grey, width: 2)),
                    suffixIcon: const Icon(FontAwesome.magnifying_glass_solid, size: 15, color: grey),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) => Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: oneE),
                      padding: padding8,
                      child: ExpansionTile(
                        minTileHeight: 40,
                        collapsedIconColor: lightGreen,
                        iconColor: lightGreen,
                        backgroundColor: transparent,
                        collapsedBackgroundColor: transparent,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: Text(_tiles[index]["title"], style: GoogleFonts.kronaOne(fontSize: 18, color: white, fontWeight: FontWeight.w500)),
                        children: <Widget>[
                          Padding(
                            padding: padding8,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: padding8,
                                    decoration: BoxDecoration(border: Border.all(width: 2, color: twoD), borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: <Widget>[
                                        Text(_tiles[index]["left"]["one"], style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                        const SizedBox(width: 5),
                                        Text(_tiles[index]["left"]["two"], style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                        const Spacer(),
                                        Text(_tiles[index]["left"]["three"], style: GoogleFonts.kronaOne(fontSize: 12, color: lightGreen, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: Container(
                                    padding: padding8,
                                    decoration: BoxDecoration(border: Border.all(width: 2, color: twoD), borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: <Widget>[
                                        Text(_tiles[index]["right"]["one"], style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                        const SizedBox(width: 5),
                                        Text(_tiles[index]["right"]["two"], style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                        const Spacer(),
                                        Text(_tiles[index]["right"]["three"], style: GoogleFonts.kronaOne(fontSize: 12, color: lightGreen, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                    itemCount: _tiles.length,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 400,
              height: 380,
              color: elevenThirteen,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                                for (final String tab in _tabs)
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        _(() => _selectedTab = _tabs.indexOf(tab));
                                        _tabsController.animateToPage(_selectedTab, duration: 200.ms, curve: Curves.linear);
                                      },
                                      splashColor: transparent,
                                      highlightColor: transparent,
                                      hoverColor: transparent,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(tab, style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: AnimatedContainer(
                                                  duration: 200.ms,
                                                  height: 3,
                                                  color: _selectedTab == _tabs.indexOf(tab) ? lightGreen : transparent,
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
                        controller: _tabsController,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Over 209.5 (DAL @MIN)", style: GoogleFonts.kronaOne(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  IconButton(onPressed: () {}, icon: const Icon(FontAwesome.x_solid, size: 20, color: white)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Text("Total Points", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  Text("-112", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w500)),
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
                                          Text("Pick", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w500)),
                                          Text("\$ 10", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
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
                                          Text("To Win", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w500)),
                                          Text("\$ 19.64", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: <Widget>[
                                  Text("To Collect", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  Text("46.22 USD", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Over 209.5 (DAL @MIN)", style: GoogleFonts.kronaOne(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  IconButton(onPressed: () {}, icon: const Icon(FontAwesome.x_solid, size: 20, color: white)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Text("Total Points", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  Text("-112", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w500)),
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
                                          Text("Pick", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w500)),
                                          Text("\$ 10", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
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
                                          Text("To Win", style: GoogleFonts.kronaOne(fontSize: 14, color: grey, fontWeight: FontWeight.w500)),
                                          Text("\$ 19.64", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: <Widget>[
                                  Text("To Collect", style: GoogleFonts.kronaOne(fontSize: 14, color: lightGreen, fontWeight: FontWeight.w500)),
                                  const Spacer(),
                                  Text("46.22 USD", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
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
                          child: Text("Clear", style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                        ),
                        HexagonButton(
                          onTap: () {},
                          color: lightGreen,
                          fill: true,
                          child: Text("Place Pick", style: GoogleFonts.kronaOne(fontSize: 14, color: dark, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
