import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomIcon extends StatelessWidget {
  BottomIcon({
    Key? key,
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
  }) : super(key: key);
  IconData icon;
  int color;
  Color? iconColor;
  double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 53,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(200),
        ),
        color: Color(color).withOpacity(0.3),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
