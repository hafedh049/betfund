import 'dart:math';

import 'package:betfund/utils/shared.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class MyPicks extends StatefulWidget {
  const MyPicks({super.key});

  @override
  State<MyPicks> createState() => _MyPicksState();
}

class _MyPicksState extends State<MyPicks> {
  final List<Map<String, dynamic>> _picksItems = <Map<String, dynamic>>[
    <String, dynamic>{
      "key": "Number Of Picks",
      "value": "32",
    },
    <String, dynamic>{
      "key": "Highest Winning Pick",
      "value": "\$20.00",
    },
    <String, dynamic>{
      "key": "Picks Won",
      "value": "5",
    },
    <String, dynamic>{
      "key": "Picks Loss",
      "value": "27",
    },
    <String, dynamic>{
      "key": "Win Rate",
      "value": "32,5%",
    },
    <String, dynamic>{
      "key": "Loss Rate",
      "value": "80%",
    },
    <String, dynamic>{
      "key": "Average Pick Size",
      "value": "\$19.35",
    },
    <String, dynamic>{
      "key": "Average Profit Per Pick",
      "value": "\$0.00",
    },
  ];

  int _selectedPick = 0;

  final PageController _picksController = PageController();

  final List<Map<String, dynamic>> _picks = List<Map<String, dynamic>>.generate(
    100,
    (int index) => <String, dynamic>{
      "state": const <String>["Active", "Lost", "Won"][Random().nextInt(3)],
      "date": DateTime(2024, Random().nextInt(12) + 1, Random().nextInt(31) + 1, Random().nextInt(23) + 1, Random().nextInt(59)),
      "picks": <Map<String, dynamic>>[
        <String, dynamic>{
          "item": "Over 209.5 (DAL @MIN)",
          "left": "Under 5.5",
          "right": "-112",
        },
        <String, dynamic>{
          "item": "Over 209.5 (DAL @MIN)",
          "left": "Under 5.5",
          "right": "-112",
        },
      ],
      "parlay odds": "+955",
      "total picks": "\$15.00",
      "pick odds": "\$19.54",
    },
  );

  @override
  void dispose() {
    _picksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              for (final Map<String, dynamic> pick in _picksItems.getRange(0, 4)) ...<Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: oneC, borderRadius: BorderRadius.circular(10)),
                    padding: padding16,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(pick["key"], style: GoogleFonts.abel(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(pick["value"], style: GoogleFonts.abel(color: lightGreen, fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                if (pick != _picksItems[4]) const SizedBox(width: 10),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              for (final Map<String, dynamic> pick in _picksItems.getRange(4, _picksItems.length)) ...<Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: oneC, borderRadius: BorderRadius.circular(10)),
                    padding: padding16,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(pick["key"], style: GoogleFonts.abel(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(pick["value"], style: GoogleFonts.abel(color: lightGreen, fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                if (pick != _picksItems.last) const SizedBox(width: 10),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: oneC, borderRadius: BorderRadius.circular(10)),
              padding: padding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Picks", style: GoogleFonts.abel(color: lightGreen, fontSize: 22, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(
                        padding: padding8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: aC),
                        child: StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => _(() => _selectedPick = 0),
                                  child: AnimatedContainer(
                                    duration: 300.ms,
                                    padding: padding4,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _selectedPick == 0 ? lightGreen : transparent),
                                    child: AnimatedDefaultTextStyle(
                                      duration: 300.ms,
                                      style: GoogleFonts.abel(color: _selectedPick == 0 ? dark : white, fontSize: 16, fontWeight: FontWeight.bold),
                                      child: const Text("Active"),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    _(() => _selectedPick = 1);
                                    _picksController.animateToPage(_selectedPick, duration: 300.ms, curve: Curves.linear);
                                  },
                                  child: AnimatedContainer(
                                    duration: 300.ms,
                                    padding: padding4,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _selectedPick == 1 ? lightGreen : transparent),
                                    child: AnimatedDefaultTextStyle(
                                      duration: 300.ms,
                                      style: GoogleFonts.abel(color: _selectedPick == 1 ? dark : white, fontSize: 16, fontWeight: FontWeight.bold),
                                      child: const Text("Closed"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: PageView.builder(
                      controller: _picksController,
                      itemBuilder: (BuildContext context, int index) => GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) => Container(
                          padding: padding8,
                          width: 350,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: elevenThirteen),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: padding4,
                                decoration: BoxDecoration(color: oneC, borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: padding4,
                                      decoration: BoxDecoration(color: const <String>["Active", "Won"].contains(_picks[index]["state"]) ? lightGreen : red, borderRadius: BorderRadius.circular(5)),
                                      child: Text(_picks[index]["state"], style: GoogleFonts.abel(color: dark, fontSize: 16, fontWeight: FontWeight.bold)),
                                    ),
                                    const Spacer(),
                                    Text(formatDate(_picks[index]["date"], const <String>[M, " ", dd, ", ", HH, ":", nn, " ", am]), style: GoogleFonts.abel(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 10),
                                    const Icon(FontAwesome.clipboard, size: 15, color: white),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              for (final Map<String, dynamic> pick in _picks[index]["picks"]) ...<Widget>[
                                Row(
                                  children: <Widget>[],
                                ),
                              ],
                            ],
                          ),
                        ),
                        itemCount: _picks.length,
                      ),
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
