import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../components/primary_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
    required this.idealWeightRange,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String idealWeightRange;

  Color _statusColor() {
    switch (resultText) {
      case 'Normal':
        return kStatusNormal;
      case 'Kelebihan Berat Badan':
        return kStatusOverweight;
      case 'Kekurangan Berat Badan':
        return kStatusUnderweight;
      default:
        return kStatusObese;
    }
  }

  String _statusLabel() {
    switch (resultText) {
      case 'Normal':
        return 'Normal';
      case 'Kelebihan Berat Badan':
        return 'Overweight';
      case 'Kekurangan Berat Badan':
        return 'Underweight';
      default:
        return 'Obese';
    }
  }

  IconData _statusIcon() {
    switch (resultText) {
      case 'Normal':
        return Icons.check_circle_rounded;
      case 'Kelebihan Berat Badan':
        return Icons.warning_rounded;
      case 'Kekurangan Berat Badan':
        return Icons.info_rounded;
      default:
        return Icons.dangerous_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color sc = _statusColor();

    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 24, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.pop(context);
                    },
                    icon: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: kCardBackground,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kInactiveCardBorder, width: 1.5),
                      ),
                      child: const Icon(Icons.chevron_left_rounded,
                          color: kTextDark, size: 26),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('YOUR RESULT', style: kHeadingStyle),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── BMI Score Card ────────────────────────────────────────────
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: kCardBackground,
                  borderRadius: BorderRadius.circular(28.0),
                  border: Border.all(color: kInactiveCardBorder, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(15, 23, 42, 0.05),
                      blurRadius: 16,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 28.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      // Status badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: sc.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: sc.withValues(alpha: 0.3), width: 1.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(_statusIcon(), color: sc, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              _statusLabel().toUpperCase(),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800,
                                color: sc,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Big BMI number
                      Column(
                        children: [
                          Text(bmiResult, style: kBMINumberStyle),
                          const Text('BMI Score', style: kLabelStyle),
                        ],
                      ),

                      // Ideal weight range
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: kPrimarySoft,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: kPrimaryLight, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: kPrimary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.monitor_weight_rounded,
                                  color: kPrimary, size: 22),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Ideal Weight Range',
                                    style: kLabelStyle),
                                const SizedBox(height: 2),
                                Text(
                                  idealWeightRange,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w800,
                                    color: kPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Interpretation
                      Text(interpretation,
                          textAlign: TextAlign.center, style: kBodyStyle),
                    ],
                  ),
                ),
              ),
            ),

            // ── BMI scale legend ──────────────────────────────────────────
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: kCardBackground,
                  borderRadius: BorderRadius.circular(22.0),
                  border: Border.all(color: kInactiveCardBorder, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('BMI Categories',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: kTextMid,
                          letterSpacing: 0.5,
                        )),
                    _categoryRow(kStatusUnderweight, 'Underweight', '< 18.5'),
                    _categoryRow(kStatusNormal, 'Normal', '18.5 – 24.9'),
                    _categoryRow(kStatusOverweight, 'Overweight', '25 – 29.9'),
                    _categoryRow(kStatusObese, 'Obese', '≥ 30'),
                  ],
                ),
              ),
            ),

            // ── Re-calculate button ───────────────────────────────────────
            PrimaryButton(
              label: 'Re-Calculate',
              onTap: () {
                HapticFeedback.mediumImpact();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryRow(Color color, String label, String range) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 10),
          Text(label,
              style: const TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: kTextMid)),
        ]),
        Text(range,
            style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: kTextLight)),
      ],
    );
  }
}
