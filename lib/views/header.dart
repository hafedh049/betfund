import 'package:betfund/utils/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

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
      height: 60,
      decoration: BoxDecoration(color: oneC, borderRadius: BorderRadius.circular(10)),
      padding: padding4,
      child: Row(
        children: <Widget>[
          IconButton(onPressed: widget.callback, icon: Icon(widget.state ? FontAwesome.chevron_left_solid : FontAwesome.chevron_right_solid, size: 25, color: lightGreen)),
          Text("Welcome Back", style: GoogleFonts.kronaOne(fontSize: 20, color: white, fontWeight: FontWeight.w400)),
          const Spacer(),
          InkWell(
            onTap: () {},
            highlightColor: transparent,
            splashColor: transparent,
            hoverColor: transparent,
            child: Container(
              width: 210,
              height: 60,
              alignment: Alignment.center,
              margin: padding4,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/empty_green_hexagon.png"))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(FontAwesome.wallet_solid, color: lightGreen, size: 15),
                  const SizedBox(width: 10),
                  Text("\$3500.00", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: white)),
                  const SizedBox(width: 10),
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 33.61,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/filled_green_hexagon.png"))),
                    child: Text("Wallet", style: GoogleFonts.kronaOne(fontSize: 12, fontWeight: FontWeight.w500, color: dark)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(color: white, height: 30, width: 1),
          const SizedBox(width: 20),
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
                const CircleAvatar(backgroundColor: lightGreen, radius: 20, backgroundImage: CachedNetworkImageProvider("https://s3-alpha-sig.figma.com/img/5be2/5330/90cf4764105270f3f742f0b5bf46a79d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oDKwzr~luCN31STywFIy7Mg6~dt4c2KW3835TqpQtn10doZH~6LQj6BkAOMVI9igPVRyfWIn3N7ZxzlJrfgOYkwQOKpbHR1QGMXGJ~lg1OdAV5kdRqjmsGT97r-duMC2xjsfDcV8noIXVBQ7GURv3Hfgjb2cYbUAFFtYpgUl~OJwU9zn1wvCSEhmRK7az9MQ2GqiD5e9oLfTtlnsGxwUOSU7Elb4wgT4G01r1taPfvvOZAR3xJQQP6rhsEkRnOO8Di77-ZP8~i3yXYsUy7NXGDMxNsB3APdojbYNstcRuy3ovcG6uugG4WGASH-d2FxVeLLoavAZUMLsCjWwA6RKBw__")),
                const SizedBox(width: 10),
                StatefulBuilder(
                  key: _profileArrowKey,
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return AnimatedCrossFade(
                      duration: 300.ms,
                      firstChild: const Icon(FontAwesome.chevron_up_solid, size: 20, color: lightGreen),
                      secondChild: const Icon(FontAwesome.chevron_down_solid, size: 20, color: lightGreen),
                      crossFadeState: _profileController.menuIsShowing ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    );
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
