import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {Key? key, required this.btnString, required this.onPressed})
      : super(key: key);

  final String btnString;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pinkBtnColor,
      height: 80,
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            btnString,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
