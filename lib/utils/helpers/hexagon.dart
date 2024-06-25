import 'package:flutter/material.dart';

import '../shared.dart';

class HexagonButton extends StatelessWidget {
  const HexagonButton({super.key, required this.onTap, required this.color, required this.fill, required this.child});
  final void Function()? onTap;
  final Color color;
  final bool fill;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) _) {
        return InkWell(
          onTap: onTap,
          highlightColor: transparent,
          splashColor: transparent,
          hoverColor: transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
            decoration: BoxDecoration(
              color: fill ? color : transparent,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.elliptical(30, 30),
                bottomEnd: Radius.elliptical(30, 30),
              ),
              border: Border.all(width: 2, color: color),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
