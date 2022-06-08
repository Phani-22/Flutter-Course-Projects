import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dice Roller"),
        backgroundColor: Colors.red,
      ),
      body: DiceRoller(),
    ),
  ));
}

class DiceRoller extends StatefulWidget {
  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int leftDiceCurState = 2;
  int rightDiceCurState = 6;

  void generateDice() {
    setState(() {
      leftDiceCurState = Random().nextInt(6) + 1;
      rightDiceCurState = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                generateDice();
              },
              child: Image.asset("images/dice$leftDiceCurState.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                generateDice();
              },
              child: Image.asset("images/dice$rightDiceCurState.png"),
            ),
          )
        ],
      ),
    );
  }
}
