import 'dart:math';

import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/more_picks.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:date_format/date_format.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/helpers/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  bool _morePicksState = false;

  final List<String> _categories = const <String>["Basketball", "Football", "Baseball", "Soccer", "Mockey", "MMA", "Tennis"];

  final List<GlobalKey<State<StatefulWidget>>> _subcatsKeys = List<GlobalKey<State<StatefulWidget>>>.generate(7, (int index) => GlobalKey<State<StatefulWidget>>());

  final GlobalKey<State<StatefulWidget>> _cartKey = GlobalKey<State<StatefulWidget>>();

  final GlobalKey<State<StatefulWidget>> _responsiveKey = GlobalKey<State<StatefulWidget>>();

  final List<CustomPopupMenuController> _subcats = List<CustomPopupMenuController>.generate(7, (int index) => CustomPopupMenuController());

  final List<String> _states = const <String>["Spread", "Total", "MoneyLine"];

  final List<Map<String, dynamic>> _data = <Map<String, dynamic>>[
    <String, dynamic>{
      "date": DateTime(2024, 6, 12),
      "timezone": "EST",
      "products": <Map<String, dynamic>>[
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SutCEfP4IssUUkzdpxEzScxQB-uYFejof33Flm07olg6SGCzVpOr~6WOA3i7Ij6gOo7m6zrxcDiBBevDYX4H861ncSE55aL7n7SgOuOMbimo7o6JUsCAmLw~4WjNKbZRwFOrts9ZN3SMIs6Aifrc4-mS27ITmuMR~e5vbzqB074S30qPT1rO38U6Tq8~oai1ivGzEwinYwY7OYM13JugVE9LXfYK5jKOs8MiUG6vnC1Ns7nQ6Z7xTU-DahxtEjR7~DmMneDAgrn-Em4aSsqrUqj5rzJ93bLGPsDclZEJtezkHArf8EYyLyfnfVgZTIPu0K191w3AAa8iMZEcHkNJcA__",
          "productName": "Baltimore Ravens",
          "spread": <String>["+5", "-115"],
          "total": <String>["O 209.5", "-112"],
          "moneyline": <String>["+160"],
          "state": "",
        },
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jSmH7UJiGclSbMHHk0gQIrZzwZPezgZSggOZazWlXDQLsv~YJAT7I7PCoi-aEEujWMFR22-uvH6XrtvHiy3k9opBATMWfwsllTgCh0SDCMoKFm5EOTcGKsbS1TyvQVQzrmxXmJHjQ8zyNPD~jW9cV0vaP6abpjA281HjnGCuTgYp6N9fSYd6MtRwaddago1uaJKFFbDw-vUaaWOwaFx9i4mv5e0dXxFICMycj2BxiJhf8HcBXbvV8WMFY39q6c4Sph977k9TIZzsPNgtiP~~THI6LUblC2ljAS7JxlJTgBgiZcVtwlzwTBlqtMaplKIG6Y~kYmkGGCandoD4Zvi1hw__",
          "productName": "Kansas City Chiefs",
          "spread": <String>["-5", "-105"],
          "total": <String>["U 209.5", "-108"],
          "moneyline": <String>["-192"],
          "state": "",
          "key": GlobalKey<State<StatefulWidget>>(),
        },
      ],
    },
    <String, dynamic>{
      "date": DateTime(2024, 6, 12),
      "timezone": "EST",
      "products": <Map<String, dynamic>>[
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SutCEfP4IssUUkzdpxEzScxQB-uYFejof33Flm07olg6SGCzVpOr~6WOA3i7Ij6gOo7m6zrxcDiBBevDYX4H861ncSE55aL7n7SgOuOMbimo7o6JUsCAmLw~4WjNKbZRwFOrts9ZN3SMIs6Aifrc4-mS27ITmuMR~e5vbzqB074S30qPT1rO38U6Tq8~oai1ivGzEwinYwY7OYM13JugVE9LXfYK5jKOs8MiUG6vnC1Ns7nQ6Z7xTU-DahxtEjR7~DmMneDAgrn-Em4aSsqrUqj5rzJ93bLGPsDclZEJtezkHArf8EYyLyfnfVgZTIPu0K191w3AAa8iMZEcHkNJcA__",
          "productName": "Baltimore Ravens",
          "spread": <String>["+5", "-115"],
          "total": <String>["O 209.5", "-112"],
          "moneyline": <String>["+160"],
          "state": "",
        },
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jSmH7UJiGclSbMHHk0gQIrZzwZPezgZSggOZazWlXDQLsv~YJAT7I7PCoi-aEEujWMFR22-uvH6XrtvHiy3k9opBATMWfwsllTgCh0SDCMoKFm5EOTcGKsbS1TyvQVQzrmxXmJHjQ8zyNPD~jW9cV0vaP6abpjA281HjnGCuTgYp6N9fSYd6MtRwaddago1uaJKFFbDw-vUaaWOwaFx9i4mv5e0dXxFICMycj2BxiJhf8HcBXbvV8WMFY39q6c4Sph977k9TIZzsPNgtiP~~THI6LUblC2ljAS7JxlJTgBgiZcVtwlzwTBlqtMaplKIG6Y~kYmkGGCandoD4Zvi1hw__",
          "productName": "Kansas City Chiefs",
          "spread": <String>["-5", "-105"],
          "total": <String>["U 209.5", "-108"],
          "moneyline": <String>["-192"],
          "state": "",
          "key": GlobalKey<State<StatefulWidget>>(),
        },
      ],
    },
    <String, dynamic>{
      "date": DateTime(2024, 6, 12),
      "timezone": "EST",
      "products": <Map<String, dynamic>>[
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SutCEfP4IssUUkzdpxEzScxQB-uYFejof33Flm07olg6SGCzVpOr~6WOA3i7Ij6gOo7m6zrxcDiBBevDYX4H861ncSE55aL7n7SgOuOMbimo7o6JUsCAmLw~4WjNKbZRwFOrts9ZN3SMIs6Aifrc4-mS27ITmuMR~e5vbzqB074S30qPT1rO38U6Tq8~oai1ivGzEwinYwY7OYM13JugVE9LXfYK5jKOs8MiUG6vnC1Ns7nQ6Z7xTU-DahxtEjR7~DmMneDAgrn-Em4aSsqrUqj5rzJ93bLGPsDclZEJtezkHArf8EYyLyfnfVgZTIPu0K191w3AAa8iMZEcHkNJcA__",
          "productName": "Baltimore Ravens",
          "spread": <String>["+5", "-115"],
          "total": <String>["O 209.5", "-112"],
          "moneyline": <String>["+160"],
          "state": "",
        },
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jSmH7UJiGclSbMHHk0gQIrZzwZPezgZSggOZazWlXDQLsv~YJAT7I7PCoi-aEEujWMFR22-uvH6XrtvHiy3k9opBATMWfwsllTgCh0SDCMoKFm5EOTcGKsbS1TyvQVQzrmxXmJHjQ8zyNPD~jW9cV0vaP6abpjA281HjnGCuTgYp6N9fSYd6MtRwaddago1uaJKFFbDw-vUaaWOwaFx9i4mv5e0dXxFICMycj2BxiJhf8HcBXbvV8WMFY39q6c4Sph977k9TIZzsPNgtiP~~THI6LUblC2ljAS7JxlJTgBgiZcVtwlzwTBlqtMaplKIG6Y~kYmkGGCandoD4Zvi1hw__",
          "productName": "Kansas City Chiefs",
          "spread": <String>["-5", "-105"],
          "total": <String>["U 209.5", "-108"],
          "moneyline": <String>["-192"],
          "state": "",
          "key": GlobalKey<State<StatefulWidget>>(),
        },
      ],
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  bool _responsive = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Column _dateTransformer(DateTime date, String timeZone) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "${date.hour.toString().padLeft(2, "0")} : ${date.minute.toString().padLeft(2, "0")} (${timeZone.toUpperCase()})",
          style: GoogleFonts.kronaOne(color: white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        Text(
          formatDate(date, const <String>[M, " ", d]).toUpperCase(),
          style: GoogleFonts.kronaOne(color: grey, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 67,
            decoration: BoxDecoration(
              color: oneC,
              boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(0, 2))],
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (final String tab in _categories) ...<Widget>[
                      InkWell(
                        onTap: () => _(() => _selectedTab = _categories.indexOf(tab)),
                        highlightColor: transparent,
                        splashColor: transparent,
                        hoverColor: transparent,
                        child: AnimatedContainer(
                          duration: 300.ms,
                          height: 67,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: _selectedTab == _categories.indexOf(tab) ? lightGreen : transparent,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              AnimatedDefaultTextStyle(
                                style: GoogleFonts.kronaOne(
                                  color: _selectedTab == _categories.indexOf(tab) ? dark : white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                duration: 300.ms,
                                child: Text(tab),
                              ),
                              if (_selectedTab == _categories.indexOf(tab)) ...<Widget>[
                                const SizedBox(width: 10),
                                CustomPopupMenu(
                                  controller: _subcats[_categories.indexOf(tab)],
                                  menuOnChange: (bool menuState) => _subcatsKeys[_categories.indexOf(tab)].currentState!.setState(() {}),
                                  menuBuilder: () => Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: twentyFour,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 2, color: white),
                                    ),
                                    // padding: padding8,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        for (int index = 0; index < Random().nextInt(3) + 1; index += 1)
                                          Padding(
                                            padding: padding8,
                                            child: Text("MLB", style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: white)),
                                          ),
                                      ],
                                    ),
                                  ),
                                  pressType: PressType.singleClick,
                                  child: StatefulBuilder(
                                    key: _subcatsKeys[_categories.indexOf(tab)],
                                    builder: (BuildContext context, void Function(void Function()) _) {
                                      return Icon(_subcats[_categories.indexOf(tab)].menuIsShowing ? FontAwesome.caret_up_solid : FontAwesome.caret_down_solid, size: 15, color: dark);
                                    },
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          StatefulBuilder(
                            builder: (BuildContext context, void Function(void Function()) _) {
                              return SizedBox(
                                height: 48,
                                width: 564,
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: (String value) {},
                                  style: GoogleFonts.kronaOne(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    hintText: "Search by team name",
                                    hintStyle: GoogleFonts.kronaOne(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
                                    labelText: "Perform your search",
                                    labelStyle: GoogleFonts.kronaOne(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: grey, width: 2)),
                                    suffixIcon: const Icon(FontAwesome.magnifying_glass_solid, size: 25, color: grey),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                for (final String state in _states) Text(state, style: GoogleFonts.kronaOne(color: grey, fontSize: 14, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: StatefulBuilder(
                                key: _responsiveKey,
                                builder: (BuildContext context, void Function(void Function()) _) {
                                  return ListView.separated(
                                    itemBuilder: (BuildContext context, int index) => Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 233,
                                          height: 138,
                                          padding: padding16,
                                          decoration: const BoxDecoration(
                                            color: elevenThirteen,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                          ),
                                          child: _dateTransformer(_data[index]["date"], _data[index]["timezone"]),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              for (final Map<String, dynamic> product in _data[index]["products"]) ...<Widget>[
                                                StatefulBuilder(
                                                  builder: (BuildContext context, void Function(void Function()) _) {
                                                    return Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          padding: padding16,
                                                          width: 319,
                                                          height: 60,
                                                          decoration: BoxDecoration(color: elevenThirteen, borderRadius: BorderRadius.circular(10)),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              Image.network(product["productImage"], width: 39, height: 32),
                                                              const SizedBox(width: 10),
                                                              Text(product["productName"], style: GoogleFonts.kronaOne(color: white, fontSize: 14, fontWeight: FontWeight.w400)),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 20),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              _(
                                                                () {
                                                                  if (product["state"] != "spread") {
                                                                    product["state"] = "spread";
                                                                  } else {
                                                                    product["state"] = "";
                                                                  }
                                                                },
                                                              );
                                                              _responsiveKey.currentState!.setState(() => _responsive = (<Map<String, dynamic>>[
                                                                    for (List<Map<String, dynamic>> item in _data.map((Map<String, dynamic> e) => e["products"])) ...item,
                                                                  ].map((dynamic e) => e["state"]).any((dynamic element) => element.isNotEmpty)));
                                                              _cartKey.currentState!.setState(() {});
                                                            },
                                                            splashColor: transparent,
                                                            highlightColor: transparent,
                                                            hoverColor: transparent,
                                                            child: AnimatedContainer(
                                                              duration: 200.ms,
                                                              constraints: const BoxConstraints(maxWidth: 294, minWidth: 184),
                                                              height: 60,
                                                              alignment: Alignment.center,
                                                              padding: padding16,
                                                              decoration: BoxDecoration(
                                                                color: oneE,
                                                                borderRadius: BorderRadius.circular(10),
                                                                border: Border.all(color: product["state"] == "spread" ? lightGreen : transparent),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: <Widget>[
                                                                  Text(product["spread"].first, style: GoogleFonts.kronaOne(color: white, fontSize: _responsive ? 14 : 18, fontWeight: FontWeight.w400)),
                                                                  const SizedBox(width: 10),
                                                                  Text(product["spread"].last, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: _responsive ? 14 : 18, fontWeight: FontWeight.w400)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 20),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              _(
                                                                () {
                                                                  if (product["state"] != "total") {
                                                                    product["state"] = "total";
                                                                  } else {
                                                                    product["state"] = "";
                                                                  }
                                                                },
                                                              );
                                                              _responsiveKey.currentState!.setState(() => _responsive = (<Map<String, dynamic>>[
                                                                    for (List<Map<String, dynamic>> item in _data.map((Map<String, dynamic> e) => e["products"])) ...item,
                                                                  ].map((dynamic e) => e["state"]).any((dynamic element) => element.isNotEmpty)));
                                                              _cartKey.currentState!.setState(() {});
                                                            },
                                                            splashColor: transparent,
                                                            highlightColor: transparent,
                                                            hoverColor: transparent,
                                                            child: AnimatedContainer(
                                                              duration: 200.ms,
                                                              constraints: const BoxConstraints(maxWidth: 294, minWidth: 184),
                                                              height: 60,
                                                              alignment: Alignment.center,
                                                              padding: padding16,
                                                              decoration: BoxDecoration(
                                                                color: oneE,
                                                                borderRadius: BorderRadius.circular(10),
                                                                border: Border.all(color: product["state"] == "total" ? lightGreen : transparent),
                                                              ),
                                                              child: Row(
                                                                key: product["key"],
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Text(product["total"].first, style: GoogleFonts.kronaOne(color: white, fontSize: _responsive ? 14 : 18, fontWeight: FontWeight.w400)),
                                                                  const SizedBox(width: 10),
                                                                  Text(product["total"].last, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: _responsive ? 14 : 18, fontWeight: FontWeight.w400)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 20),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              _(
                                                                () {
                                                                  if (product["state"] != "moneyline") {
                                                                    product["state"] = "moneyline";
                                                                  } else {
                                                                    product["state"] = "";
                                                                  }
                                                                },
                                                              );
                                                              _responsiveKey.currentState!.setState(() => _responsive = (<Map<String, dynamic>>[
                                                                    for (List<Map<String, dynamic>> item in _data.map((Map<String, dynamic> e) => e["products"])) ...item,
                                                                  ].map((dynamic e) => e["state"]).any((dynamic element) => element.isNotEmpty)));
                                                              _cartKey.currentState!.setState(() {});
                                                            },
                                                            splashColor: transparent,
                                                            highlightColor: transparent,
                                                            hoverColor: transparent,
                                                            child: AnimatedContainer(
                                                              duration: 200.ms,
                                                              constraints: const BoxConstraints(maxWidth: 294, minWidth: 184),
                                                              height: 60,
                                                              alignment: Alignment.center,
                                                              padding: padding16,
                                                              decoration: BoxDecoration(
                                                                color: oneE,
                                                                borderRadius: BorderRadius.circular(10),
                                                                border: Border.all(color: product["state"] == "moneyline" ? lightGreen : transparent),
                                                              ),
                                                              child: Text(product["moneyline"].last, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: _responsive ? 14 : 18, fontWeight: FontWeight.w400)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                              Row(
                                                children: <Widget>[
                                                  const Spacer(),
                                                  StatefulBuilder(
                                                    builder: (BuildContext context, void Function(void Function()) _) {
                                                      return InkWell(
                                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MorePicks())),
                                                        highlightColor: transparent,
                                                        splashColor: transparent,
                                                        hoverColor: transparent,
                                                        onHover: (bool value) => _(() => _morePicksState = value),
                                                        child: AnimatedScale(
                                                          scale: _morePicksState ? 1.05 : 1,
                                                          duration: 200.ms,
                                                          child: AnimatedContainer(
                                                            duration: 200.ms,
                                                            width: 184,
                                                            height: 54,
                                                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/launch_${_morePicksState ? 'hovered' : 'normal'}.png"), fit: BoxFit.contain)),
                                                            child: AnimatedDefaultTextStyle(
                                                              duration: 200.ms,
                                                              style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: _morePicksState ? lightGreen : dark),
                                                              child: const Text("More Picks"),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    separatorBuilder: (BuildContext context, int index) => const Padding(
                                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 245),
                                      child: DottedDashedLine(
                                        height: .3,
                                        width: double.infinity,
                                        axis: Axis.horizontal,
                                        dashColor: white,
                                        dashHeight: .3,
                                        dashSpace: 5,
                                        dashWidth: 10,
                                        strokeWidth: 1,
                                      ),
                                    ),
                                    itemCount: _data.length,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                StatefulBuilder(
                  key: _cartKey,
                  builder: (BuildContext context, void Function(void Function()) _) => (<Map<String, dynamic>>[
                    for (List<Map<String, dynamic>> item in _data.map((Map<String, dynamic> e) => e["products"])) ...item,
                  ].map((dynamic e) => e["state"]).any((dynamic element) => element.isNotEmpty))
                      ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ...<Widget>[
                              SizedBox(width: 20),
                              Cart(),
                            ]
                          ],
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
