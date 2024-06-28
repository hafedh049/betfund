import 'package:betfund/utils/shared.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  double _amount = 1.000;
  int _activeStep = 0;
  final GlobalKey<State<StatefulWidget>> _amountKey = GlobalKey<State<StatefulWidget>>();
  bool _startChallengeState = false;
  bool _amountState = false;

  final List<String> _steps = const <String>["1K", "2K", "5K", "10K", "20K", "50K"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 260),
          child: Image.asset("assets/images/challenge.png"),
        ),
        const SizedBox(height: 80),
        Center(
          child: Container(
            width: 1578,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(64),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), border: Border.all(width: 2, color: lightGreen)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return InkWell(
                          onTap: () {},
                          highlightColor: transparent,
                          splashColor: transparent,
                          hoverColor: transparent,
                          onHover: (bool value) => _(() => _amountState = value),
                          child: AnimatedScale(
                            scale: _amountState ? 1.02 : 1,
                            duration: 200.ms,
                            child: AnimatedContainer(
                              duration: 200.ms,
                              width: 188,
                              height: 54,
                              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/launch_${_amountState ? 'hovered' : 'normal'}.png"), fit: BoxFit.contain)),
                              child: AnimatedDefaultTextStyle(
                                duration: 200.ms,
                                style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: _amountState ? lightGreen : dark),
                                child: StatefulBuilder(
                                  key: _amountKey,
                                  builder: (BuildContext context, void Function(void Function()) _) {
                                    return Text("\$${_amount.toStringAsFixed(3)}");
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("SELECT THE AMOUNT", style: GoogleFonts.kronaOne(fontSize: 16.59, fontWeight: FontWeight.w400, color: white)),
                        const SizedBox(height: 10),
                        StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) _) {
                                return EasyStepper(
                                  activeStep: _activeStep,
                                  activeStepTextColor: lightGreen,
                                  finishedStepTextColor: lightGreen,
                                  activeStepBackgroundColor: transparent,
                                  activeStepBorderColor: transparent,
                                  activeStepIconColor: transparent,
                                  lineStyle: const LineStyle(defaultLineColor: white, lineType: LineType.normal),
                                  disableScroll: true,
                                  internalPadding: 0,
                                  showLoadingAnimation: false,
                                  stepRadius: 8,
                                  showStepBorder: false,
                                  steps: <EasyStep>[
                                    for (int index = 0; index < _steps.length; index++)
                                      EasyStep(
                                        customStep: AnimatedContainer(
                                          duration: 300.ms,
                                          padding: EdgeInsets.all(_activeStep == index ? 2 : 0),
                                          decoration: BoxDecoration(border: Border.all(color: lightGreen, width: 3), shape: BoxShape.circle, color: _activeStep == index ? lightGreen : white),
                                          child: AnimatedContainer(
                                            duration: 300.ms,
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: _activeStep == index ? dark : white),
                                          ),
                                        ),
                                        customTitle: AnimatedDefaultTextStyle(
                                          style: GoogleFonts.inter(fontSize: 15.25, fontWeight: FontWeight.w500, color: _activeStep == index ? lightGreen : white),
                                          duration: 300.ms,
                                          child: Text(_steps[index], textAlign: TextAlign.center),
                                        ),
                                      ),
                                  ],
                                  onStepReached: (int index) {
                                    _(() => _activeStep = index);
                                    _amountKey.currentState!.setState(() => _amount = double.parse(_steps[index].replaceAll("K", "")));
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Image.asset("assets/images/table.png", height: 650, width: 1239)),
                    Center(
                      child: Container(
                        padding: padding16,
                        width: 1190,
                        decoration: const BoxDecoration(
                          color: oneA,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Choose you desired plan", style: GoogleFonts.kronaOne(fontSize: 14.63, fontWeight: FontWeight.w400, color: white)),
                            const SizedBox(width: 20),
                            StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) _) {
                                return InkWell(
                                  onTap: () {},
                                  highlightColor: transparent,
                                  splashColor: transparent,
                                  hoverColor: transparent,
                                  onHover: (bool value) => _(() => _startChallengeState = value),
                                  child: AnimatedScale(
                                    scale: _startChallengeState ? 1.02 : 1,
                                    duration: 300.ms,
                                    child: AnimatedContainer(
                                      duration: 300.ms,
                                      width: 220,
                                      height: 54,
                                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/launch_${_startChallengeState ? 'hovered' : 'normal'}.png"))),
                                      child: AnimatedDefaultTextStyle(
                                        duration: 200.ms,
                                        style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: _startChallengeState ? lightGreen : dark),
                                        child: const Text("Start Challenge"),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 200),
        Image.asset("assets/images/banner.png", height: 75, fit: BoxFit.fitWidth),
      ],
    );
  }
}


 /*DataTable(
                        headingRowColor: const WidgetStatePropertyAll<Color>(zeroBZeroC),
                        dataRowColor: const WidgetStatePropertyAll<Color>(oneA),
                        columnSpacing: 200,
                        dataRowMinHeight: 84,
                        dataRowMaxHeight: 84,
                        headingRowHeight: 96,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(15),
                          horizontalInside: const BorderSide(width: 2, color: lightGreen),
                          verticalInside: const BorderSide(width: 0, color: transparent),
                          right: const BorderSide(width: 2, color: lightGreen),
                          left: const BorderSide(width: 2, color: lightGreen),
                          bottom: const BorderSide(width: 2, color: lightGreen),
                          top: const BorderSide(width: 0, color: transparent),
                        ),
                        columns: <DataColumn>[
                          DataColumn(label: Text("\$25.00", style: GoogleFonts.kronaOne(fontSize: 22.69, fontWeight: FontWeight.w400, color: white))),
                          DataColumn(label: Text("Phase I", style: GoogleFonts.kronaOne(fontSize: 22.69, fontWeight: FontWeight.w400, color: white))),
                          DataColumn(label: Text("Phase II", style: GoogleFonts.kronaOne(fontSize: 22.69, fontWeight: FontWeight.w400, color: white))),
                          DataColumn(label: Text("Game Day", style: GoogleFonts.kronaOne(fontSize: 22.69, fontWeight: FontWeight.w400, color: white))),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Minimum Picks", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("25", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("25", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Minimum Pick Amount", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$20", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Maximum Pick Amount", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$200", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$200", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$200", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Max Loses", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$400", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$400", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$400", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Max Daily Pick Loss", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$300", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$300", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$300", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Pick Profit Target", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$660", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("\$660", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("N/A", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Time Limit", style: GoogleFonts.kronaOne(fontSize: 14.75, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("30 Days", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("30 Days", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("30 Days", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text("Challenge Fee", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("0.1%", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                              DataCell(Text("", style: GoogleFonts.kronaOne(fontSize: 15.25, fontWeight: FontWeight.w400, color: white))),
                            ],
                          ),
                        ],
                      ),*/