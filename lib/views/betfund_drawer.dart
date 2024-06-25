import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/outside/holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class BetFundDrawer extends StatefulWidget {
  const BetFundDrawer({super.key, required this.callback, required this.state});
  final void Function(int index) callback;
  final bool state;
  @override
  State<BetFundDrawer> createState() => _BetFundDrawerState();
}

class _BetFundDrawerState extends State<BetFundDrawer> {
  int _currentTab = 0;
  final List<Map<String, dynamic>> _tabs = <Map<String, dynamic>>[
    <String, dynamic>{"state": false, "icon": "home", "tab": "Home", "width": 24, "height": 21},
    <String, dynamic>{"state": false, "icon": "account_overview", "tab": "Account Overview", "width": 20, "height": 20},
    <String, dynamic>{"state": false, "icon": "payout", "tab": "Payout", "width": 21, "height": 20.47},
    <String, dynamic>{"state": false, "icon": "my_picks", "tab": "My Picks", "picks": 1, "width": 24, "height": 21},
    <String, dynamic>{"state": false, "icon": "sports", "tab": "Sports", "width": 15, "height": 19},
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(color: drawerColor, borderRadius: BorderRadius.circular(5)),
      duration: 300.ms,
      width: widget.state ? 319 : 50,
      padding: padding8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 24),
          Center(child: Image.asset("assets/images/betfund.png", width: widget.state ? 180 : 80, height: 32)),
          const SizedBox(height: 30),
          for (Map<String, dynamic> tab in _tabs) ...<Widget>[
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return InkWell(
                  hoverColor: transparent,
                  splashColor: transparent,
                  highlightColor: transparent,
                  onTap: () {
                    _currentTab = _tabs.indexOf(tab);
                    widget.callback(_currentTab);
                    setState(() {});
                  },
                  onHover: (bool value) => _(() => tab["state"] = value),
                  child: AnimatedContainer(
                    duration: 300.ms,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentTab == _tabs.indexOf(tab) || tab["state"] ? lightGreen : transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/${tab["icon"]}.png",
                          height: tab["height"],
                          width: tab["width"],
                          color: _currentTab == _tabs.indexOf(tab) || tab["state"] ? dark : lightGreen,
                        ),
                        if (widget.state)
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Visibility(
                                visible: widget.state,
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(width: 20),
                                    AnimatedDefaultTextStyle(
                                      duration: 300.ms,
                                      style: GoogleFonts.kronaOne(
                                        fontSize: 16,
                                        color: _currentTab == _tabs.indexOf(tab) || tab["state"] ? dark : lightGreen,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      child: Text(tab["tab"]),
                                    ),
                                    if (tab["tab"] == "My Picks") ...<Widget>[
                                      const SizedBox(width: 120),
                                      Card(
                                        shadowColor: dark,
                                        color: lightGreen,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          decoration: const BoxDecoration(shape: BoxShape.circle),
                                          padding: const EdgeInsets.all(7),
                                          child: AnimatedDefaultTextStyle(
                                            duration: 300.ms,
                                            style: GoogleFonts.readexPro(fontSize: 14, color: dark, fontWeight: FontWeight.w400),
                                            child: Text(tab["picks"].toString()),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ).animate().fade(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (tab != _tabs.last) const SizedBox(height: 20),
          ],
          const Spacer(),
          InkWell(
            hoverColor: transparent,
            splashColor: transparent,
            highlightColor: transparent,
            onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const Holder()), (Route route) => false),
            child: Container(
              alignment: Alignment.center,
              padding: padding8,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: twentyEight),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/logout.png", width: 18, height: 18),
                    if (widget.state) ...<Widget>[
                      const SizedBox(width: 10),
                      Visibility(visible: widget.state, child: Text("Logout", style: GoogleFonts.readexPro(fontSize: 16, color: white, fontWeight: FontWeight.w400))),
                    ],
                  ],
                ).animate().fade(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
