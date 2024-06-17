import 'package:betfund/utils/helpers/hexagon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/shared.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding36,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("WE FUND WINNING SPORTS STRATEGIES UP TO \$50K", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: grey)),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Place Picks on Your Favorite Sports & ",
                                style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: white),
                              ),
                              TextSpan(
                                text: "Earn ",
                                style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: lightGreen),
                              ),
                              TextSpan(
                                text: "Rewards",
                                style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Take the Funded challenge & show us your skills.", style: GoogleFonts.kronaOne(fontSize: 8, fontWeight: FontWeight.w500, color: grey)),
                        const SizedBox(height: 5),
                        Text("If you have what it takes we will fund all you picks up!", style: GoogleFonts.kronaOne(fontSize: 8, fontWeight: FontWeight.w500, color: grey)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HexagonButton(
                              onTap: () {},
                              color: lightGreen,
                              fill: true,
                              child: Text("Buy Now", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: dark)),
                            ),
                            const SizedBox(width: 10),
                            HexagonButton(
                              onTap: () {},
                              color: white,
                              fill: false,
                              child: const Icon(Bootstrap.twitter_x, size: 20, color: lightGreen),
                            ),
                            const SizedBox(width: 10),
                            HexagonButton(
                              onTap: () {},
                              color: white,
                              fill: false,
                              child: const Icon(Bootstrap.telegram, size: 20, color: lightGreen),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        HexagonButton(
                          onTap: () {},
                          color: lightGreen,
                          fill: false,
                          child: Text("OxcomingsoonxOxcomingsoonxO", style: GoogleFonts.kronaOne(fontSize: 10, fontWeight: FontWeight.w500, color: lightGreen)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Container(height: MediaQuery.sizeOf(context).height * .7, width: 3, color: white),
                        Expanded(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * .6,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              border: Border.all(color: white, width: 5),
                              image: const DecorationImage(
                                image: NetworkImage("https://s3-alpha-sig.figma.com/img/0252/fc47/5d5360ded9622a54274d98b4d461a6cd?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VC9OZpGPY44jG3MfKxZThvb4lM73~AwOSSrUvTc6e0sjoA1uF2G4z-Cn6Iuld2fb~akzAlI0e9WOFlWmLtehLzQL6naR2x2-etMP8VvUmdBaFDW0byEztA9wm1179ZSXdu-8nFHBVPCjwwlhjFSyyxcjDwalv3OtV8Jz7Ad-6iV-jGIXvkqQc-Ht5jtMjVE9DA4rYhIrRjhGxlV4wM~szxuMQ62Fw0BSWUn0qTAKSN~FYIW70j1J94c0XeOGbpbhGTk8h0peUEEtWEUtMW9t~0RBQI7UU2bv0zgjPNHu9pPCEkIoqxrUO35NWq5AzE23fJ3hbemVwwGF3X7SkKd68w__"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/funded.png", height: 38),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(FontAwesome.caret_right_solid, color: lightGreen, size: 25),
                                  const SizedBox(width: 10),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: "Make ", style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: white)),
                                        TextSpan(text: "33%", style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: lightGreen)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(FontAwesome.caret_right_solid, color: lightGreen, size: 25),
                                  const SizedBox(width: 10),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: "Don't lose  ", style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: white)),
                                        TextSpan(text: "15% in a day", style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: lightGreen)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(FontAwesome.caret_right_solid, color: lightGreen, size: 25),
                                  const SizedBox(width: 10),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: "Don't lose ", style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: white)),
                                        TextSpan(text: "20% in total", style: GoogleFonts.kronaOne(fontSize: 20, fontWeight: FontWeight.w500, color: lightGreen)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Center(child: Image.network("assets/images/barplot.png", height: MediaQuery.sizeOf(context).height * .5, fit: BoxFit.cover)),
                      ],
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
