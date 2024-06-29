import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/account_balance.dart';
import 'package:betfund/views/outside/coming_soon.dart';
import 'package:betfund/views/my_picks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'betfund_drawer.dart';
import 'header.dart';
import 'home.dart';
import 'payout.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  final PageController _holderController = PageController();
  bool _drawerState = true;
  final GlobalKey<State<StatefulWidget>> _drawerKey = GlobalKey<State<StatefulWidget>>();
  final List<Widget> _tabs = const <Widget>[
    Home(),
    AccountBalance(),
    Payout(),
    MyPicks(),
    ComingSoon(),
  ];

  @override
  void dispose() {
    _holderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abyss,
      body: Row(
        children: <Widget>[
          StatefulBuilder(
            key: _drawerKey,
            builder: (BuildContext context, void Function(void Function()) _) {
              return BetFundDrawer(callback: (int index) => _holderController.animateToPage(index, duration: 200.ms, curve: Curves.linear), state: _drawerState);
            },
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned.fill(child: Image.asset("assets/images/glow.png", fit: BoxFit.cover)),
                Column(
                  children: <Widget>[
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return Header(
                          state: _drawerState,
                          callback: () => _(() => _drawerKey.currentState!.setState(() => _drawerState = !_drawerState)),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _holderController,
                        itemCount: _tabs.length,
                        itemBuilder: (BuildContext context, int index) => _tabs[index],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
