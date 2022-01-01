import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container appLogo(BuildContext context, Size size) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      shape: BoxShape.circle,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        'assets/icons/power_note_logo.svg',
        width: size.width * 0.25,
        height: size.width * 0.25,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
