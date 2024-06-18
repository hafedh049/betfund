import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/more_picks.dart';
import 'package:date_format/date_format.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  int _selectedPage = 0;

  final List<String> _pages = const <String>["Straight", "Parlay"];

  final PageController _pagesController = PageController();

  final List<String> _categories = const <String>[
    "Basketball",
    "Football",
    "Baseball",
    "Soccer",
    "Mockey",
    "MMA",
    "Tennis",
  ];

  final List<String> _states = const <String>[
    "Spread",
    "Total",
    "MoneyLine",
  ];

  final List<Map<String, dynamic>> _data = <Map<String, dynamic>>[
    <String, dynamic>{
      "date": DateTime(2024, 6, 12),
      "timezone": "EST",
      "products": const <Map<String, dynamic>>[
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PhRUPPDSJZyRqDhxes~PAvsR-y84TNCkr1~mNP-dggbF~WPVgJonL7MfPRbHibmNe2~YkfQYI1qFzXWe6DxI1gvx5Xh9uhnQlrwBiqVUnM2eyEsYKQ6snfGA5Ao9eOJEM1tjI7joIVOoBvFKdjNcvYe2z1OIM8IOWjh-AwsY0IorliQCZS7-9VgvU-5~Qr2mmaYaYnKPjKLD-f3Qeb8aMCyB9jK4EN9MEnw3U9nG2rGZ~bLZsZp~5YVEq5~R9SvLACevLz-CqxjD1HFAQM86Ptm2AiwjR7XwLmAkLGyXC3lDz~Sn~fgGBtkxcM0Wt~LxA0hicosEmBuP0PFgYq5NEQ__",
          "productName": "Baltimore Ravens",
          "spread": <String>["+5", "-115"],
          "total": <String>["O 209.5", "-112"],
          "moneyline": <String>["+160"],
        },
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kJgooRSD-CKMxr3y9CfPyUgX4JcX16yKHuh-le6Az2B8gjuUQxiuudoLQ~1PgTsWu2nkNfe5rPcyOs31G0~zpdlPAiaujdoVJtcM5Jr3ufTkXTqX~IeFsGTxaJBxyeNOQ9aEpWc4V18ZTfcNLqoQS-ULiuaDrCTeeS2mSfw~UK217TdKARASTPPPi7PE4WDF4hAhdcdxIjBleqK0U4tTparSNzUPwkV9GO~15fKOkPM1hutPdytY6~0rKIR2JmQS-RuwxBFO1g06WeWeJyufj2MHmJd1rSctl15MDXzIX8UCTvmNt1osu~bDAKpqdO7TT6M-26HyVpHzgYuyH4arHg__",
          "productName": "Kansas City Chiefs",
          "spread": <String>["-5", "-105"],
          "total": <String>["U 209.5", "-108"],
          "moneyline": <String>["-192"],
        },
      ],
    },
    <String, dynamic>{
      "date": DateTime(2024, 6, 12),
      "timezone": "EST",
      "products": const <Map<String, dynamic>>[
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PhRUPPDSJZyRqDhxes~PAvsR-y84TNCkr1~mNP-dggbF~WPVgJonL7MfPRbHibmNe2~YkfQYI1qFzXWe6DxI1gvx5Xh9uhnQlrwBiqVUnM2eyEsYKQ6snfGA5Ao9eOJEM1tjI7joIVOoBvFKdjNcvYe2z1OIM8IOWjh-AwsY0IorliQCZS7-9VgvU-5~Qr2mmaYaYnKPjKLD-f3Qeb8aMCyB9jK4EN9MEnw3U9nG2rGZ~bLZsZp~5YVEq5~R9SvLACevLz-CqxjD1HFAQM86Ptm2AiwjR7XwLmAkLGyXC3lDz~Sn~fgGBtkxcM0Wt~LxA0hicosEmBuP0PFgYq5NEQ__",
          "productName": "Baltimore Ravens",
          "spread": <String>["+5", "-115"],
          "total": <String>["O 209.5", "-112"],
          "moneyline": <String>["+160"],
        },
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kJgooRSD-CKMxr3y9CfPyUgX4JcX16yKHuh-le6Az2B8gjuUQxiuudoLQ~1PgTsWu2nkNfe5rPcyOs31G0~zpdlPAiaujdoVJtcM5Jr3ufTkXTqX~IeFsGTxaJBxyeNOQ9aEpWc4V18ZTfcNLqoQS-ULiuaDrCTeeS2mSfw~UK217TdKARASTPPPi7PE4WDF4hAhdcdxIjBleqK0U4tTparSNzUPwkV9GO~15fKOkPM1hutPdytY6~0rKIR2JmQS-RuwxBFO1g06WeWeJyufj2MHmJd1rSctl15MDXzIX8UCTvmNt1osu~bDAKpqdO7TT6M-26HyVpHzgYuyH4arHg__",
          "productName": "Kansas City Chiefs",
          "spread": <String>["-5", "-105"],
          "total": <String>["U 209.5", "-108"],
          "moneyline": <String>["-192"],
        },
      ],
    },
    <String, dynamic>{
      "date": DateTime(2024, 6, 12),
      "timezone": "EST",
      "products": const <Map<String, dynamic>>[
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/2a00/aacc/e499c5c311ef7267c4f2502731401f03?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PhRUPPDSJZyRqDhxes~PAvsR-y84TNCkr1~mNP-dggbF~WPVgJonL7MfPRbHibmNe2~YkfQYI1qFzXWe6DxI1gvx5Xh9uhnQlrwBiqVUnM2eyEsYKQ6snfGA5Ao9eOJEM1tjI7joIVOoBvFKdjNcvYe2z1OIM8IOWjh-AwsY0IorliQCZS7-9VgvU-5~Qr2mmaYaYnKPjKLD-f3Qeb8aMCyB9jK4EN9MEnw3U9nG2rGZ~bLZsZp~5YVEq5~R9SvLACevLz-CqxjD1HFAQM86Ptm2AiwjR7XwLmAkLGyXC3lDz~Sn~fgGBtkxcM0Wt~LxA0hicosEmBuP0PFgYq5NEQ__",
          "productName": "Baltimore Ravens",
          "spread": <String>["+5", "-115"],
          "total": <String>["O 209.5", "-112"],
          "moneyline": <String>["+160"],
        },
        <String, dynamic>{
          "productImage": "https://s3-alpha-sig.figma.com/img/4c38/3f22/bbd26d4c0143b94f57cb31dce1d3cfab?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kJgooRSD-CKMxr3y9CfPyUgX4JcX16yKHuh-le6Az2B8gjuUQxiuudoLQ~1PgTsWu2nkNfe5rPcyOs31G0~zpdlPAiaujdoVJtcM5Jr3ufTkXTqX~IeFsGTxaJBxyeNOQ9aEpWc4V18ZTfcNLqoQS-ULiuaDrCTeeS2mSfw~UK217TdKARASTPPPi7PE4WDF4hAhdcdxIjBleqK0U4tTparSNzUPwkV9GO~15fKOkPM1hutPdytY6~0rKIR2JmQS-RuwxBFO1g06WeWeJyufj2MHmJd1rSctl15MDXzIX8UCTvmNt1osu~bDAKpqdO7TT6M-26HyVpHzgYuyH4arHg__",
          "productName": "Kansas City Chiefs",
          "spread": <String>["-5", "-105"],
          "total": <String>["U 209.5", "-108"],
          "moneyline": <String>["-192"],
        },
      ],
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _pagesController.dispose();
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
          style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          formatDate(date, const <String>[M, " ", d]).toUpperCase(),
          style: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: oneC,
              boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(2, 2))],
              borderRadius: BorderRadius.circular(15),
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (final String tab in _categories) ...<Widget>[
                      InkWell(
                        onTap: () => _(() => _selectedTab = _categories.indexOf(tab)),
                        highlightColor: transparent,
                        splashColor: transparent,
                        hoverColor: transparent,
                        child: AnimatedContainer(
                          duration: 300.ms,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                                duration: 300.ms,
                                child: Text(tab),
                              ),
                              if (_selectedTab == _categories.indexOf(tab)) ...const <Widget>[
                                SizedBox(width: 10),
                                Icon(FontAwesome.caret_down_solid, size: 15, color: dark),
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
          const SizedBox(height: 20),
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
                          Expanded(
                            child: StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) _) {
                                return TextField(
                                  controller: _searchController,
                                  onChanged: (String value) {},
                                  style: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    hintText: "Search by team name",
                                    hintStyle: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
                                    labelText: "Perform your search",
                                    labelStyle: GoogleFonts.kronaOne(color: grey, fontSize: 8, fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: grey, width: 2)),
                                    suffixIcon: const Icon(FontAwesome.magnifying_glass_solid, size: 15, color: grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                for (final String state in _states) Text(state, style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold)),
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
                              child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: padding16,
                                      decoration: const BoxDecoration(
                                        color: elevenThirteen,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                      ),
                                      child: _dateTransformer(_data[index]["date"], _data[index]["timezone"]),
                                    ),
                                    const Divider(color: white, endIndent: 5, indent: 5, height: 100, thickness: 1),
                                    const SizedBox(height: 20),
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
                                                      decoration: BoxDecoration(color: elevenThirteen, borderRadius: BorderRadius.circular(10)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.network(product["productImage"], width: 20, height: 20),
                                                          const SizedBox(width: 10),
                                                          Text(product["productName"], style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      padding: padding16,
                                                      decoration: BoxDecoration(color: oneE, borderRadius: BorderRadius.circular(10)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(product["spread"].first, style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold)),
                                                          const SizedBox(width: 10),
                                                          Text(product["spread"].last, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 8, fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      padding: padding16,
                                                      decoration: BoxDecoration(color: oneE, borderRadius: BorderRadius.circular(10)),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Text(product["total"].first, style: GoogleFonts.kronaOne(color: white, fontSize: 8, fontWeight: FontWeight.bold)),
                                                          const SizedBox(width: 10),
                                                          Text(product["moneyline"].last, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 8, fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      padding: padding16,
                                                      decoration: BoxDecoration(color: oneE, borderRadius: BorderRadius.circular(10)),
                                                      child: Text(product["spread"].last, style: GoogleFonts.kronaOne(color: lightGreen, fontSize: 8, fontWeight: FontWeight.bold)),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                          Center(
                                            child: HexagonButton(
                                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MorePicks())),
                                              color: lightGreen,
                                              fill: true,
                                              child: Text("More Picks", style: GoogleFonts.kronaOne(color: dark, fontSize: 8, fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                separatorBuilder: (BuildContext context, int index) => const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
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
                              ),
                            ),
                          ],
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
          ),
        ],
      ),
    );
  }
}
