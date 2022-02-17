import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildIconWithText extends StatelessWidget {
  BuildIconWithText(
      {Key? key,
      required this.icon,
      required this.label,
      required this.style,
      required this.size,
      this.color})
      : super(key: key);
  final String icon;
  final String label;
  final TextStyle style;
  final double size;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/$icon.svg',
          color: color,
          height: size,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: style,
        ),
      ],
    );
  }
}
