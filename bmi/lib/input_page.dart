import 'package:bmi/calculator_class.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/output_page.dart';
import 'package:bmi/reusable_card.dart';
import 'package:bmi/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 80;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: (selectedGender == Gender.male)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    itemCardChild: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.mars,
                            size: 70,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text("MALE", style: kLabelTextStyle)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: (selectedGender == Gender.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    itemCardChild: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.venus,
                            size: 70,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "FEMALE",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              itemCardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("HEIGHT", style: kLabelTextStyle),
                  Text(height.toString(), style: kHeaderTextStyle),
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 1,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      min: 120,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(
                          () {
                            height = value.round();
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    itemCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT", style: kLabelTextStyle),
                        Text(weight.toString(), style: kHeaderTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              btnIcon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(width: 15),
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              btnIcon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    itemCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kHeaderTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              btnIcon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(width: 15),
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              btnIcon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            btnString: "CALCULATE",
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OutputPage(
                    bmiResult: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                    resultText: calc.calculateBMI(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
