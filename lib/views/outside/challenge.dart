import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  double _amount = 1.000;
  final GlobalKey<State<StatefulWidget>> _amountKey = GlobalKey<State<StatefulWidget>>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(56),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/challenge.png", height: 36),
          const SizedBox(height: 30),
          Expanded(
            child: Center(
              child: Container(
                padding: padding24,
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all(width: .5, color: lightGreen), borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: padding24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: oneA),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HexagonButton(
                              onTap: () {},
                              color: lightGreen,
                              fill: true,
                              child: StatefulBuilder(
                                key: _amountKey,
                                builder: (BuildContext context, void Function(void Function()) _) {
                                  return Text("\$${_amount.toStringAsFixed(3)}", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: dark));
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("SELECT THE AMOUNT", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: white)),
                                const SizedBox(height: 10),
                                StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) _) {
                                    return SizedBox(
                                      width: 400,
                                      child: SfSlider(
                                        min: 1,
                                        inactiveColor: white,
                                        interval: 1,
                                        stepSize: 1,
                                        max: 50,
                                        value: _amount,
                                        labelFormatterCallback: (dynamic actualValue, String formattedText) => const <double>[1, 10, 20, 30, 40, 50].contains(actualValue) ? "${actualValue.toStringAsFixed(0)}K" : "",
                                        activeColor: lightGreen,
                                        showDividers: true,
                                        showTicks: true,
                                        showLabels: true,
                                        enableTooltip: true,
                                        thumbIcon: const Icon(FontAwesome.dollar_sign_solid, size: 15, color: dark),
                                        minorTicksPerInterval: 1,
                                        onChanged: (dynamic value) => _(() => _amountKey.currentState!.setState(() => _amount = value)),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: padding16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: oneA),
                          child: DataTable(
                            border: TableBorder(
                              borderRadius: BorderRadius.circular(15),
                              horizontalInside: const BorderSide(width: 2, color: lightGreen),
                              verticalInside: const BorderSide(width: 0),
                              right: const BorderSide(width: 2, color: lightGreen),
                              left: const BorderSide(width: 2, color: lightGreen),
                              bottom: const BorderSide(width: 2, color: lightGreen),
                              top: const BorderSide(width: 0),
                            ),
                            columns: <DataColumn>[
                              DataColumn(label: Text("\$25.00", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                              DataColumn(label: Text("Phase I", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                              DataColumn(label: Text("Phase II", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                              DataColumn(label: Text("Game Day", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Minimum Picks", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("25", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("25", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Minimum Pick Amount", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Maximum Pick Amount", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$200", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$200", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$200", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Max Loses", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$400", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$400", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$400", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Max Daily Pick Loss", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$300", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$300", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$300", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Pick Profit Target", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$660", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("\$660", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("N/A", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Time Limit", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("30 Days", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("30 Days", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("30 Days", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text("Challenge Fee", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("0.1%", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                  DataCell(Text("", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                HexagonButton(
                  onTap: () {},
                  color: oneA,
                  fill: true,
                  child: Text("Choose you desired plan", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: white)),
                ),
                const SizedBox(width: 20),
                HexagonButton(
                  onTap: () {},
                  color: lightGreen,
                  fill: true,
                  child: Text("Start Challenge", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: dark)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
