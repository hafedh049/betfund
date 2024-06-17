import 'package:betfund/utils/shared.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  final List<(double, double)> _data = <(double, double)>[
    (5, 20000),
    (10, 30000),
    (15, 40000),
    (20, 50000),
    (25, 60000),
  ];

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
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
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
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: padding16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: padding16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: padding16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: oneC),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
