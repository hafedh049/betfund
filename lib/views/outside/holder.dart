import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/outside/coming_soon.dart';
import 'package:betfund/views/holder.dart' as holder;
import 'package:betfund/views/outside/challenge.dart';
import 'package:betfund/views/outside/home.dart';
import 'package:betfund/views/outside/why_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => HolderState();
}

class HolderState extends State<Holder> {
  bool _launchHover = false;

  final ScrollController _scrollController = ScrollController();

  final List<String> _tabs = const <String>["Home", "Challenges", "Referral Program", "FAQ"];

  String _selectedTab = "Home";

  final List<bool> _tabsStates = <bool>[false, false, false, false];

  final GlobalKey<State<StatefulWidget>> _tabsKey = GlobalKey<State<StatefulWidget>>();

  final List<Widget> _screens = <Widget>[
    Home(key: GlobalKey<State<StatefulWidget>>()),
    Challenge(key: GlobalKey<State<StatefulWidget>>()),
    ComingSoon(key: GlobalKey<State<StatefulWidget>>()),
    WhyUs(key: GlobalKey<State<StatefulWidget>>()),
  ];

  int _listenToIndex() {
    for (int index = 1; index <= _screens.length; index++) {
      if (_scrollController.offset <=
          _screens
              .take(index)
              .map(
                (Widget element) => ((element.key! as GlobalKey<State<StatefulWidget>>).currentContext!.findRenderObject() as RenderBox).size.height,
              )
              .reduce(
                (double value, double element) => value + element,
              )) {
        return index - 1;
      }
    }
    return 0;
  }

  @override
  void initState() {
    _scrollController.addListener(
      () {
        _tabsKey.currentState!.setState(
          () {
            _selectedTab = _tabs[_listenToIndex()];
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abyss,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: padding24,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 50),
                Image.asset("assets/images/betfund.png", height: 38, width: 191),
                const Spacer(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: StatefulBuilder(
                      key: _tabsKey,
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (final String tab in _tabs) ...<Widget>[
                              InkWell(
                                highlightColor: transparent,
                                splashColor: transparent,
                                hoverColor: transparent,
                                onTap: () {
                                  _(() => _selectedTab = tab);
                                  _scrollController.animateTo(
                                    _tabs.indexOf(_selectedTab) == 0
                                        ? 0
                                        : _screens
                                            .take(_tabs.indexOf(_selectedTab))
                                            .map(
                                              (Widget element) => ((element.key! as GlobalKey<State<StatefulWidget>>).currentContext!.findRenderObject() as RenderBox).size.height,
                                            )
                                            .reduce(
                                              (double value, double element) => value + element,
                                            ),
                                    duration: 300.ms,
                                    curve: Curves.linear,
                                  );
                                },
                                onHover: (bool value) => _(() => _tabsStates[_tabs.indexOf(tab)] = value),
                                child: AnimatedContainer(
                                  duration: 200.ms,
                                  padding: padding8,
                                  decoration: BoxDecoration(border: Border(bottom: _selectedTab == tab ? const BorderSide(color: lightGreen, width: 2) : BorderSide.none)),
                                  child: AnimatedDefaultTextStyle(
                                    duration: 200.ms,
                                    style: GoogleFonts.kronaOne(fontWeight: FontWeight.w400, fontSize: 14, color: _selectedTab == tab || _tabsStates[_tabs.indexOf(tab)] ? lightGreen : white),
                                    child: Text(tab),
                                  ),
                                ),
                              ),
                              if (tab != _tabs.last) const SizedBox(width: 40),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return InkWell(
                      onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const holder.Holder()), (Route route) => false),
                      highlightColor: transparent,
                      splashColor: transparent,
                      hoverColor: transparent,
                      onHover: (bool value) => _(() => _launchHover = value),
                      child: AnimatedScale(
                        scale: _launchHover ? 1.05 : 1,
                        duration: 200.ms,
                        child: AnimatedContainer(
                          duration: 200.ms,
                          width: 188,
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                          alignment: Alignment.center,
                          /*decoration: BoxDecoration(
                            color: !_launchHover ? lightGreen : transparent,
                            borderRadius: const BorderRadiusDirectional.only(
                              topStart: Radius.elliptical(30, 30),
                              bottomEnd: Radius.elliptical(30, 30),
                            ),
                            border: Border.all(width: 2, color: lightGreen),
                          ),*/
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/${!_launchHover ? 'filled' : 'empty'}_green_hexagon.png"), fit: BoxFit.contain)),
                          child: AnimatedDefaultTextStyle(
                            duration: 200.ms,
                            style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: _launchHover ? lightGreen : dark),
                            child: const Text("Launch App"),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: false,
              trackVisibility: false,
              thickness: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _screens,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
