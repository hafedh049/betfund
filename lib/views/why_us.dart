import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/footer.dart';
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
    return Scaffold(
      backgroundColor: abyss,
      body: Padding(
        padding: padding16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/why_us.png", height: 36),
                  const SizedBox(height: 20),
                  Text(
                    "You're not just watching the game, you're a part of the action! Here's what you can do with Us",
                    style: GoogleFonts.kronaOne(fontSize: 8, color: white, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      runSpacing: 20,
                      spacing: 20,
                      children: <Widget>[
                        for (final Map<String, dynamic> card in _cards)
                          Container(
                            width: 450,
                            padding: padding16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: oneA,
                              boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(2, 2))],
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[const Spacer(), Image.asset("assets/images/star.png", width: 20, height: 20)]),
                                const SizedBox(height: 10),
                                Text(card["title"], style: GoogleFonts.kronaOne(fontSize: 10, color: lightGreen, fontWeight: FontWeight.w400)),
                                const SizedBox(height: 30),
                                Text(card["subtitle"], style: GoogleFonts.kronaOne(fontSize: 8, color: white, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: InkWell(
                      splashColor: transparent,
                      hoverColor: transparent,
                      highlightColor: transparent,
                      onTap: () {},
                      child: Image.asset("assets/images/join_discord.png"),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
