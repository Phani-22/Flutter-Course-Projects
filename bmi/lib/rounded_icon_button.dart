import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {Key? key, required this.onPressed, required this.btnIcon})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData btnIcon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 46, height: 46),
      shape: const CircleBorder(),
      onPressed: onPressed,
      fillColor: const Color(0xFF4C4F5E),
      child: FaIcon(btnIcon),
    );
  }
}
