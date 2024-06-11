import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:betfund/utils/shared.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: oneC,
      padding: padding4,
      child: Row(
        children: <Widget>[
          IconButton(onPressed: widget.callback, icon: Icon(widget.state ? FontAwesome.chevron_left_solid : FontAwesome.chevron_right_solid, size: 20, color: lightGreen)),
          const SizedBox(width: 20),
          Text("Welcome Back", style: GoogleFonts.abel(fontSize: 22, color: white, fontWeight: FontWeight.w500)),
          const Spacer(),
          HexagonButton(
            onTap: () {},
            color: lightGreen,
            fill: false,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(FontAwesome.wallet_solid, color: lightGreen, size: 15),
                const SizedBox(width: 10),
                Text("\$3500.00", style: GoogleFonts.abel(fontSize: 14, fontWeight: FontWeight.w500, color: white)),
                const SizedBox(width: 10),
                IgnorePointer(
                  ignoring: true,
                  child: HexagonButton(
                    onTap: null,
                    color: lightGreen,
                    fill: true,
                    child: Text("Wallet", style: GoogleFonts.abel(fontSize: 10, fontWeight: FontWeight.bold, color: dark)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(color: white, height: 30, width: 1),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
