import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi = -1;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    calculateBMI();
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    calculateBMI();
    if (_bmi >= 25) {
      return "You have a higher body weight than normal weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have a lower weight than normal individual. Try to eat more.";
    }
  }
}
