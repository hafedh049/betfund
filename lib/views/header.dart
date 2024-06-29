import 'package:betfund/utils/shared.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.callback, required this.state});
  final void Function() callback;
  final bool state;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalKey<State<StatefulWidget>> _profileArrowKey = GlobalKey<State<StatefulWidget>>();

  final CustomPopupMenuController _profileController = CustomPopupMenuController();

  bool _accountState = true;

  @override
  void dispose() {
    _profileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      color: oneC,
      padding: padding16,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20),
          InkWell(
            splashColor: transparent,
            highlightColor: transparent,
            hoverColor: transparent,
            onTap: widget.callback,
            child: Image.asset("assets/images/${widget.state ? 'backward' : 'forward'}.png", width: 28, height: 28),
          ),
          const SizedBox(width: 30),
          Text("Welcome Back", style: GoogleFonts.kronaOne(fontSize: 20, color: white, fontWeight: FontWeight.w400)),
          const Spacer(),
          InkWell(
            onTap: () {},
            highlightColor: transparent,
            splashColor: transparent,
            hoverColor: transparent,
            child: Container(
              alignment: Alignment.center,
              padding: padding8,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/outer_wallet.png"))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/images/pig.png", width: 20, height: 20.81),
                  const SizedBox(width: 5),
                  Text("\$3500.00", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w400, color: white)),
                  const SizedBox(width: 10),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 33.61,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/inner_wallet.png"))),
                    child: Text("Wallet", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: dark)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 30),
          Container(color: grey, height: 40, width: 1),
          const SizedBox(width: 30),
          CustomPopupMenu(
            controller: _profileController,
            menuOnChange: (bool menuState) => _profileArrowKey.currentState!.setState(() {}),
            menuBuilder: () => Container(
              width: 500,
              decoration: BoxDecoration(
                color: twentyFour,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: white),
              ),
              padding: padding8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Account Information", style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: white)),
                      const Spacer(),
                      StatefulBuilder(
                        builder: (BuildContext context, void Function(void Function()) _) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(_accountState ? "Active" : "UnActive", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.bold, color: white)),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 50,
                                height: 25,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Switch(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    value: _accountState,
                                    activeTrackColor: lightGreen,
                                    inactiveTrackColor: red,
                                    activeColor: lightGreen,
                                    thumbColor: const WidgetStatePropertyAll<Color>(white),
                                    onChanged: (bool state) => _(() => _accountState = state),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text("Account ID", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: grey)),
                      const Spacer(),
                      Text("195705", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: lightGreen)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text("Current Balance", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: grey)),
                      const Spacer(),
                      Text("\$987.83", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text("Current Performance", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: grey)),
                      const Spacer(),
                      Text("+27.93%", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text("Remaining Days", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: grey)),
                      const Spacer(),
                      Text("27", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text("Account Status", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: grey)),
                      const Spacer(),
                      Text("Phase", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white)),
                      const SizedBox(width: 5),
                      Text("2", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: lightGreen)),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            pressType: PressType.singleClick,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: lightGreen,
                    image: DecorationImage(image: AssetImage("assets/images/avatar.png")),
                    shape: BoxShape.circle,
                  ),
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 20),
                StatefulBuilder(
                  key: _profileArrowKey,
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return AnimatedCrossFade(
                      duration: 300.ms,
                      firstChild: Image.asset("assets/images/caret_up.png", width: 19, height: 10),
                      secondChild: Image.asset("assets/images/caret_down.png", width: 19, height: 10),
                      crossFadeState: _profileController.menuIsShowing ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
