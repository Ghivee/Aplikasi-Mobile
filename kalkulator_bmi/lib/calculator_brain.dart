import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Kelebihan Berat Badan';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Kekurangan Berat Badan';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Anda memiliki berat badan di atas normal. Cobalah untuk lebih banyak berolahraga dan menjaga pola makan.';
    } else if (_bmi >= 18.5) {
      return 'Berat badan Anda normal. Pertahankan gaya hidup sehat Anda!';
    } else {
      return 'Anda memiliki berat badan di bawah normal. Anda bisa makan sedikit lebih banyak dan membangun massa otot.';
    }
  }

  String getIdealWeightRange() {
    double minIdeal = 18.5 * pow(height / 100, 2);
    double maxIdeal = 24.9 * pow(height / 100, 2);
    return '${minIdeal.toStringAsFixed(1)} kg - ${maxIdeal.toStringAsFixed(1)} kg';
  }
}
