import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/outside/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyUs extends StatefulWidget {
  const WhyUs({super.key});

  @override
  State<WhyUs> createState() => _WhyUsState();
}

class _WhyUsState extends State<WhyUs> {
  final List<Map<String, dynamic>> _cards = <Map<String, dynamic>>[
    <String, dynamic>{
      "title": "Real Time Game Data",
      "subtitle": "Real-time game data powers our platform, delivering live scores, player stats, and game updates",
    },
    <String, dynamic>{
      "title": "Sport Picking",
      "subtitle": "Choose your favorite teams and players in for a chance at awesome rewards",
    },
    <String, dynamic>{
      "title": "Fan Funded Treasury",
      "subtitle": "Explore our treasury, our prize chest for exciting giveaways and community rewards!",
    },
    <String, dynamic>{
      "title": "Watch and Play",
      "subtitle": "At Betfund we keep you updated on game-time decisions while offering access to all your favorite sports.",
    },
    <String, dynamic>{
      "title": "24 Hour Withdrawals",
      "subtitle": "Instantly access your rewards anytime with our 24-hour withdrawals section",
    },
    <String, dynamic>{
      "title": "Stay Informed",
      "subtitle": "Stay in the loop with all the latest news by joining our discord server & telegram chats",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 260),
          child: Image.asset("assets/images/why_us.png"),
        ),
        const SizedBox(height: 40),
        Text(
          "You're not just watching the game, you're a part of the action! Here's what you can do with Us",
          style: GoogleFonts.kronaOne(fontSize: 14.63, color: white, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (final Map<String, dynamic> card in _cards.take(3))
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: 400,
                height: 300,
                padding: padding16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: oneA,
                  boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(2, 2))],
                ),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[const Spacer(), Image.asset("assets/images/star.png", width: 36, height: 36)]),
                    const SizedBox(height: 10),
                    Text(card["title"], style: GoogleFonts.kronaOne(fontSize: 24, color: lightGreen, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 30),
                    Text(card["subtitle"], style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (final Map<String, dynamic> card in _cards.sublist(3))
              Container(
                width: 400,
                height: 300,
                padding: padding16,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: oneA,
                  boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(2, 2))],
                ),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[const Spacer(), Image.asset("assets/images/star.png", width: 36, height: 36)]),
                    const SizedBox(height: 10),
                    Text(card["title"], style: GoogleFonts.kronaOne(fontSize: 24, color: lightGreen, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 30),
                    Text(card["subtitle"], style: GoogleFonts.kronaOne(fontSize: 12, color: white, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 40),
        InkWell(
          splashColor: transparent,
          hoverColor: transparent,
          highlightColor: transparent,
          onTap: () {},
          child: Image.asset("assets/images/join_discord.png", height: 453, fit: BoxFit.fitWidth),
        ),
        const SizedBox(height: 40),
        const Footer(),
      ],
    );
  }
}
