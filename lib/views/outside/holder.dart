import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/coming_soon.dart';
import 'package:betfund/views/holder.dart' as holder;
import 'package:betfund/views/outside/challenge.dart';
import 'package:betfund/views/outside/home.dart';
import 'package:betfund/views/why_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_tab_view/scrollable_tab_view.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => HolderState();
}

class HolderState extends State<Holder> with SingleTickerProviderStateMixin {
  late final TabController _tabsController;

  final List<String> _tabs = const <String>["Home", "Challenges", "Referral Program", "FAQ"];

  final List<Widget> _screens = const <Widget>[Home(), Challenge(), ComingSoon(), WhyUs()];

  @override
  void initState() {
    _tabsController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abyss,
      body: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("assets/images/betfund.png", height: 38),
                const Spacer(),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return ScrollableTabBar(
                      isScrollable: true,
                      labelColor: transparent,
                      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                      controller: _tabsController,
                      automaticIndicatorColorAdjustment: true,
                      dividerColor: transparent,
                      indicatorColor: lightGreen,
                      splashBorderRadius: BorderRadius.zero,
                      onTap: (int page) => _(() {}),
                      unselectedLabelColor: white,
                      tabs: <Widget>[
                        for (final String tab in _tabs)
                          AnimatedDefaultTextStyle(
                            duration: 200.ms,
                            style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w500, color: _tabsController.index == _tabs.indexOf(tab) ? lightGreen : white),
                            child: Text(tab),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(width: 100),
                HexagonButton(
                  onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const holder.Holder()), (Route route) => false),
                  color: lightGreen,
                  fill: true,
                  child: Text("Launch App", style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w500, color: dark)),
                ),
              ],
            ),
            Expanded(
              child: ScrollableTabViewWithController(
                controller: _tabsController,
                children: _screens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
