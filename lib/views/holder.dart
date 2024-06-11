import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';

import 'betfund_drawer.dart';
import 'header.dart';
import 'home.dart';

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
    Home(),
    Home(),
    Home(),
    Home(),
  ];

  @override
  void dispose() {
    _holderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding16,
        child: Row(
          children: <Widget>[
            StatefulBuilder(
              key: _drawerKey,
              builder: (BuildContext context, void Function(void Function()) _) {
                return BetFundDrawer(callback: (int index) => _holderController.jumpToPage(index), state: _drawerState);
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: <Widget>[
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return Header(state: _drawerState, callback: () => _(() => _drawerKey.currentState!.setState(() => _drawerState = !_drawerState)));
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: PageView.builder(
                      controller: _holderController,
                      itemCount: _tabs.length,
                      itemBuilder: (BuildContext context, int index) => _tabs[index],
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
