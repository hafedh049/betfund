import 'dart:math';

import 'package:betfund/utils/shared.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_simple_candlesticks/flutter_simple_candlesticks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  final List<List<String>> _dataTable = const <List<String>>[
    <String>["202461762", "Parlay", "Parlay", "Parlay", "Parlay", "+871", "10.00", "Won", "97.12", "May 31,\n09:47 PM", "-"],
    <String>["24162", "Hockey", "New York Rangers VS\nForida Panthers", "NHL", "Puck Line - Edmonton\nOilers-1.5", "-130", "10.00", "Lost", "97.12", "May 31,\n09:47 PM", "May 31,\n09:47 PM"],
    <String>["24162", "Hockey", "New York Rangers VS\nForida Panthers", "NHL", "Puck Line - Edmonton\nOilers-1.5", "-130", "10.00", "Lost", "97.12", "May 31,\n09:47 PM", "May 31,\n09:47 PM"],
    <String>["24162", "Hockey", "New York Rangers VS\nForida Panthers", "NHL", "Puck Line - Edmonton\nOilers-1.5", "-130", "10.00", "Won", "97.12", "May 31,\n09:47 PM", "May 31,\n09:47 PM"],
    <String>["24162", "Hockey", "New York Rangers VS\nForida Panthers", "NHL", "Puck Line - Edmonton\nOilers-1.5", "-130", "10.00", "Won", "97.12", "May 31,\n09:47 PM", "May 31,\n09:47 PM"],
    <String>["24162", "Hockey", "New York Rangers VS\nForida Panthers", "NHL", "Puck Line - Edmonton\nOilers-1.5", "-130", "10.00", "Won", "97.12", "May 31,\n09:47 PM", "May 31,\n09:47 PM"],
    <String>["24162", "Hockey", "New York Rangers VS\nForida Panthers", "NHL", "Puck Line - Edmonton\nOilers-1.5", "-130", "10.00", "Won", "97.12", "May 31,\n09:47 PM", "May 31,\n09:47 PM"],
  ];

  final List<CandleModel> _candlesticks = <CandleModel>[
    CandleModel(date: DateTime.now(), hight: 50, low: 10, open: 10, close: 30),
    CandleModel(date: DateTime.now(), hight: 70, low: 40, open: 55, close: 45),
    CandleModel(date: DateTime.now(), hight: 20, low: 10, open: 12, close: 18),
    CandleModel(date: DateTime.now(), hight: 30, low: 10, open: 20, close: 25),
    CandleModel(date: DateTime.now(), hight: 60, low: 25, open: 30, close: 50),
  ];

  int _selectedPick = 0;

  final PageController _picksController = PageController();

  final List<(double, double)> _data = <(double, double)>[
    (5, 20000),
    (10, 30000),
    (15, 40000),
    (20, 50000),
    (25, 60000),
  ];

  final CandlestickChartStyle _style = const CandlestickChartStyle(
    yLegendStyle: CandlestickChartYLegendStyle(numberOfLabels: 0),
    tooltipColor: lightGreen,
    candlestickStyle: CandlestickStyle(
      bullishColor: lightGreen,
      bearishColor: red,
    ),
  );

  String _formatNumbers(double value) {
    return value >= 50000
        ? "50K"
        : value >= 40000
            ? "40K"
            : value >= 30000
                ? "30K"
                : value >= 20000
                    ? "20K"
                    : value >= 10000
                        ? "10K"
                        : value >= 5000
                            ? "5K"
                            : value >= 1000
                                ? "1K"
                                : value.toStringAsFixed(0);
  }

  @override
  void dispose() {
    _picksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 300,
                padding: padding16,
                color: oneC,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Balance History", style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Text("\$49807.83", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 8, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: .3, height: .3, color: grey),
                    const SizedBox(height: 10),
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (double value, TitleMeta meta) => _data.any(((double, double) e) => e.$2 == value)
                                    ? Text(
                                        _formatNumbers(value),
                                        style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold),
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (double value, TitleMeta meta) => _data.any(((double, double) e) => e.$1 == value) && value > 5
                                    ? Text(
                                        "${value.toInt()}th May",
                                        style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold),
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ),
                          gridData: FlGridData(
                            drawHorizontalLine: false,
                            checkToShowVerticalLine: (double value) => _data.any(((double, double) e) => e.$1 == value),
                            getDrawingVerticalLine: (double value) => const FlLine(color: lightGreen, strokeWidth: 2, dashArray: <int>[5, 10]),
                            verticalInterval: 5,
                          ),
                          lineBarsData: <LineChartBarData>[
                            LineChartBarData(
                              belowBarData: BarAreaData(
                                applyCutOffY: true,
                                gradient: LinearGradient(colors: <Color>[lightGreen.withOpacity(.5), white.withOpacity(.2)]),
                                show: true,
                              ),
                              aboveBarData: BarAreaData(show: false),
                              preventCurveOverShooting: true,
                              isCurved: true,
                              spots: _data.map(((double, double) e) => FlSpot(e.$1, e.$2)).toList(),
                              color: lightGreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    padding: padding16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Net Profit / Loss", style: GoogleFonts.kronaOne(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("+6%", style: GoogleFonts.kronaOne(color: white, fontSize: 20, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: LineChart(
                                        LineChartData(
                                          borderData: FlBorderData(show: false),
                                          titlesData: const FlTitlesData(
                                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                          ),
                                          gridData: const FlGridData(show: false),
                                          lineBarsData: <LineChartBarData>[
                                            LineChartBarData(
                                              dotData: const FlDotData(show: false),
                                              preventCurveOverShooting: true,
                                              isCurved: true,
                                              spots: List<(double, double)>.generate(
                                                10,
                                                (int index) => (index.toDouble(), Random().nextInt(3).toDouble()),
                                              )
                                                  .map(
                                                    ((double, double) e) => FlSpot(e.$1, e.$2),
                                                  )
                                                  .toList(),
                                              color: lightGreen,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text("+15%", style: GoogleFonts.kronaOne(color: dark, fontSize: 16, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text("Last Pick", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: lightGreen),
                              padding: padding8,
                              child: Text("\$10.00", style: GoogleFonts.kronaOne(color: dark, fontSize: 12, fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: padding16,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Net Profit / Loss", style: GoogleFonts.kronaOne(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Pick Objectifs", style: GoogleFonts.kronaOne(color: white, fontSize: 20, fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: oneF),
                                padding: padding8,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const CircleAvatar(radius: 6, backgroundColor: lightGreen),
                                    const SizedBox(width: 5),
                                    Text("In Progress", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Text("# Of Picks", style: GoogleFonts.kronaOne(color: white, fontSize: 12, fontWeight: FontWeight.bold)),
                              const Spacer(),
                              SizedBox(
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("35/37", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 5, child: LinearProgressBar(currentStep: 35, maxSteps: 37, progressColor: lightGreen, backgroundColor: grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text("Profile Target", style: GoogleFonts.kronaOne(color: white, fontSize: 12, fontWeight: FontWeight.bold)),
                              const Spacer(),
                              SizedBox(
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("\$17,948 / \$50,320", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 5, child: LinearProgressBar(currentStep: 17948, maxSteps: 50320, progressColor: lightGreen, backgroundColor: grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text("Maximum Daily Loss", style: GoogleFonts.kronaOne(color: white, fontSize: 12, fontWeight: FontWeight.bold)),
                              const Spacer(),
                              SizedBox(
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("\$5,948 / \$8,320", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 5, child: LinearProgressBar(currentStep: 5948, maxSteps: 8320, progressColor: lightGreen, backgroundColor: grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text("Maximum Loss", style: GoogleFonts.kronaOne(color: white, fontSize: 12, fontWeight: FontWeight.bold)),
                              const Spacer(),
                              SizedBox(
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("\$148 / \$200,00", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 5, child: LinearProgressBar(currentStep: 148, maxSteps: 200, progressColor: lightGreen, backgroundColor: grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 400,
                    padding: padding16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Challenge Info", style: GoogleFonts.kronaOne(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text("Time Remaining", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: lightGreen)),
                                  padding: padding4,
                                  child: Text("24", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                                Text(" : ", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: lightGreen)),
                                  padding: padding4,
                                  child: Text("17", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                                Text(" : ", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: lightGreen)),
                                  padding: padding4,
                                  child: Text("56", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                                Text(" : ", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: lightGreen)),
                                  padding: padding4,
                                  child: Text("10", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Start Date", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Text("07/03/2024", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("End Date", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Text("07/07/2024", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Challenge", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: "1K ", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                                  TextSpan(text: "Player, Phase N° ", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                  TextSpan(text: "1", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Account Size", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: "\$ ", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                  TextSpan(text: "1.000.00", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Profil", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: "\$ ", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                                  TextSpan(text: "14", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                for (int index = 0; index < 8; index += 1)
                  Container(
                    height: 250,
                    width: 350,
                    padding: padding16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Number Of Picks", style: GoogleFonts.kronaOne(color: white, fontSize: 12, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            const Icon(FontAwesome.caret_up_solid, color: lightGreen, size: 15),
                            const SizedBox(width: 5),
                            Text("+0.25%", style: GoogleFonts.kronaOne(color: white, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("32", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 14, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text("Last Pick", style: GoogleFonts.kronaOne(color: grey, fontSize: 12, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text("\$ 9,170", style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: CandlesticksChart<CandleModel>(
                                height: 200,
                                data: _candlesticks,
                                style: _style,
                                getHightCallback: (CandleModel e) => e.hight,
                                getCloseCallback: (CandleModel e) => e.close,
                                getLowCallback: (CandleModel e) => e.low,
                                getOpenCallback: (CandleModel e) => e.open,
                                getTimeCallback: (CandleModel e) => e.date,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: oneC, borderRadius: BorderRadius.circular(10)),
              padding: padding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("My Picks", style: GoogleFonts.kronaOne(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(
                        padding: padding8,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: aZero),
                        child: StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    _(() => _selectedPick = 0);
                                    // _picksController.animateToPage(_selectedPick, duration: 300.ms, curve: Curves.linear);
                                  },
                                  child: AnimatedContainer(
                                    duration: 300.ms,
                                    padding: padding8,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _selectedPick == 0 ? lightGreen : transparent),
                                    child: AnimatedDefaultTextStyle(
                                      duration: 300.ms,
                                      style: GoogleFonts.kronaOne(color: _selectedPick == 0 ? dark : white, fontSize: 10, fontWeight: FontWeight.bold),
                                      child: const Text("Active"),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    _(() => _selectedPick = 1);
                                    //  _picksController.animateToPage(_selectedPick, duration: 300.ms, curve: Curves.linear);
                                  },
                                  child: AnimatedContainer(
                                    duration: 300.ms,
                                    padding: padding8,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _selectedPick == 1 ? red : transparent),
                                    child: AnimatedDefaultTextStyle(
                                      duration: 300.ms,
                                      style: GoogleFonts.kronaOne(color: _selectedPick == 1 ? dark : white, fontSize: 10, fontWeight: FontWeight.bold),
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
                  Center(
                    child: DataTable(
                      columns: <DataColumn>[
                        for (final String column in const <String>[
                          "ID",
                          "Sport",
                          "Event",
                          "League",
                          "Your Pick",
                          "Odds",
                          "Picks",
                          "Outcome",
                          "Payout",
                          "Date",
                          "Game Date",
                        ])
                          DataColumn(label: Text(column, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 10, fontWeight: FontWeight.bold))),
                      ],
                      rows: <DataRow>[
                        for (final List<String> row in _dataTable)
                          DataRow(
                            cells: <DataCell>[
                              for (final String cell in row)
                                DataCell(
                                  Text(
                                    cell,
                                    style: GoogleFonts.kronaOne(
                                      color: cell == "Lost"
                                          ? red
                                          : cell == "Won"
                                              ? lightGreen
                                              : white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
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

class CandleModel {
  final DateTime date;
  final num hight;
  final num low;
  final num open;
  final num close;

  CandleModel({required this.date, required this.hight, required this.low, required this.open, required this.close});

  factory CandleModel.generate(DateTime dateTime) {
    final Random rng = Random();
    return CandleModel(date: dateTime, hight: rng.nextDouble() * 50 + 150, low: rng.nextDouble() * 50, open: rng.nextDouble() * 50 + 50, close: rng.nextDouble() * 100);
  }
}
