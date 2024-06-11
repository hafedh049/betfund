import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

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
    <String, dynamic>{"icon": Bootstrap.house, "tab": "Home"},
    <String, dynamic>{"icon": FontAwesome.users_rectangle_solid, "tab": "Account Overview"},
    <String, dynamic>{"icon": Bootstrap.currency_dollar, "tab": "Payout"},
    <String, dynamic>{"icon": Bootstrap.calendar2, "tab": "My Picks", "picks": 4},
    <String, dynamic>{"icon": Bootstrap.flag_fill, "tab": "Sports"},
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(color: drawerColor, borderRadius: BorderRadius.circular(5)),
      duration: 300.ms,
      width: widget.state ? 240 : 50,
      padding: padding8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Image.asset("assets/images/betfund.png", width: widget.state ? 200 : 80)),
          const SizedBox(height: 30),
          for (final Map<String, dynamic> tab in _tabs) ...<Widget>[
            InkWell(
              hoverColor: transparent,
              splashColor: transparent,
              highlightColor: transparent,
              onTap: () {
                _currentTab = _tabs.indexOf(tab);
                widget.callback(_currentTab);
                setState(() {});
              },
              child: AnimatedContainer(
                duration: 300.ms,
                padding: padding8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _currentTab == _tabs.indexOf(tab) ? lightGreen : transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(tab["icon"], size: 15, color: _currentTab == _tabs.indexOf(tab) ? dark : lightGreen),
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
                                  style: GoogleFonts.abel(
                                    fontSize: _currentTab == _tabs.indexOf(tab) ? 17 : 16,
                                    color: _currentTab == _tabs.indexOf(tab) ? dark : lightGreen,
                                    fontWeight: _currentTab == _tabs.indexOf(tab) ? FontWeight.bold : FontWeight.w500,
                                  ),
                                  child: Text(tab["tab"]),
                                ),
                                if (tab["tab"] == "My Picks") ...<Widget>[
                                  const SizedBox(width: 20),
                                  CircleAvatar(
                                    radius: 9,
                                    backgroundColor: _currentTab == _tabs.indexOf(tab) ? dark : lightGreen,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: AnimatedDefaultTextStyle(
                                        duration: 300.ms,
                                        style: GoogleFonts.abel(
                                          fontSize: _currentTab == _tabs.indexOf(tab) ? 13 : 12,
                                          color: _currentTab == _tabs.indexOf(tab) ? lightGreen : dark,
                                          fontWeight: _currentTab == _tabs.indexOf(tab) ? FontWeight.bold : FontWeight.w500,
                                        ),
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
            ),
            if (tab != _tabs.last) const SizedBox(height: 20),
          ],
          const Spacer(),
          InkWell(
            hoverColor: transparent,
            splashColor: transparent,
            highlightColor: transparent,
            onTap: () {},
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
                    const Icon(Bootstrap.lightbulb_off, size: 15, color: white),
                    if (widget.state) ...<Widget>[
                      const SizedBox(width: 10),
                      Visibility(visible: widget.state, child: Text("Logout", style: GoogleFonts.abel(fontSize: 16, color: white, fontWeight: FontWeight.w500))),
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
