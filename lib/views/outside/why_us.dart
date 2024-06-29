import 'package:betfund/utils/shared.dart';
import 'package:betfund/views/outside/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      "subtitle": "Real-time game data powers our platform, delivering live scores,\nplayer stats, and game updates",
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
      "subtitle": "Stay in the loop with all the latest\nnews by joining our discord server\n& telegram chats",
    },
  ];

  bool _joinState = false;

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
          "You're not just watching the game, you're a part of the action!\nHere's what you can do with Us",
          style: GoogleFonts.kronaOne(fontSize: 14.63, color: white, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (final Map<String, dynamic> card in _cards.take(3))
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: 426,
                height: 299,
                padding: padding16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: oneA,
                  boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(0, 2))],
                ),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[const Spacer(), Image.asset("assets/images/star.png", width: 36, height: 36)]),
                    const SizedBox(height: 10),
                    Text(card["title"], style: GoogleFonts.kronaOne(fontSize: 24, color: lightGreen, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 30),
                    Text(card["subtitle"], style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400, letterSpacing: 1.5)),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 80),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (final Map<String, dynamic> card in _cards.sublist(3))
              Container(
                width: 426,
                height: 299,
                padding: padding16,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: oneA,
                  boxShadow: const <BoxShadow>[BoxShadow(blurStyle: BlurStyle.outer, color: lightGreen, offset: Offset(0, 2))],
                ),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[const Spacer(), Image.asset("assets/images/star.png", width: 36, height: 36)]),
                    const SizedBox(height: 10),
                    Text(card["title"], style: GoogleFonts.kronaOne(fontSize: 24, color: lightGreen, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 30),
                    Text(card["subtitle"], style: GoogleFonts.kronaOne(fontSize: 14, color: white, fontWeight: FontWeight.w400, letterSpacing: 1.5)),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 200),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset("assets/images/join_discord.png", height: 453, fit: BoxFit.fitWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Join Our ", style: GoogleFonts.kronaOne(fontSize: 56, color: white, fontWeight: FontWeight.w400)),
                      TextSpan(text: "Community ", style: GoogleFonts.kronaOne(fontSize: 56, color: lightGreen, fontWeight: FontWeight.w400)),
                      TextSpan(text: "of Fans", style: GoogleFonts.kronaOne(fontSize: 56, color: white, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return InkWell(
                      onTap: () {},
                      highlightColor: transparent,
                      splashColor: transparent,
                      hoverColor: transparent,
                      onHover: (bool value) => _(() => _joinState = value),
                      child: AnimatedScale(
                        scale: _joinState ? 1.02 : 1,
                        duration: 300.ms,
                        child: AnimatedContainer(
                          duration: 300.ms,
                          width: 260,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/launch_${_joinState ? 'hovered' : 'normal'}.png"))),
                          child: AnimatedDefaultTextStyle(
                            duration: 200.ms,
                            style: GoogleFonts.kronaOne(fontSize: 14, fontWeight: FontWeight.w400, color: _joinState ? lightGreen : dark),
                            child: const Text("Join Discord Server"),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 180),
        const Footer(),
      ],
    );
  }
}
