import 'package:betfund/views/outside/holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BetFund",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Holder(),
    );
  }
}
