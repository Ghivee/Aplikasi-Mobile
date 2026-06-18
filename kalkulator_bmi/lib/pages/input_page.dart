import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/gender_card.dart';
import '../components/reusable_card.dart';
import '../components/stepper_button.dart';
import '../components/primary_button.dart';
import '../constants.dart';
import '../pages/result_page.dart';
import '../calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ── App Title ──────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('BMI', style: kHeadingStyle),
                  SizedBox(height: 2),
                  Text('CALCULATOR', style: kSubheadStyle),
                ],
              ),
            ),

            // ── Gender row ────────────────────────────────────────────────
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: GenderCard(
                      icon: Icons.male_rounded,
                      label: 'MALE',
                      isActive: selectedGender == Gender.male,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() => selectedGender = Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: GenderCard(
                      icon: Icons.female_rounded,
                      label: 'FEMALE',
                      isActive: selectedGender == Gender.female,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() => selectedGender = Gender.female);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ── Height card (full-width) ──────────────────────────────────
            Expanded(
              flex: 2,
              child: ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('HEIGHT', style: kLabelStyle),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kNumberStyle),
                          const SizedBox(width: 6),
                          const Text('CM', style: kUnitStyle),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kPrimary,
                          inactiveTrackColor: kPrimaryLight,
                          thumbColor: kPrimary,
                          overlayColor: kPrimary.withValues(alpha: 0.1),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 13.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 26.0),
                          trackHeight: 4.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Slider(
                            value: height.toDouble(),
                            min: 100.0,
                            max: 220.0,
                            onChanged: (v) =>
                                setState(() => height = v.round()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Weight & Age row ──────────────────────────────────────────
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  // Weight
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT', style: kLabelStyle),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(), style: kNumberStyle),
                              const SizedBox(width: 5),
                              const Text('KG', style: kUnitStyle),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StepperButton(
                                icon: Icons.remove,
                                onPressed: () => setState(() {
                                  if (weight > 1) weight--;
                                  HapticFeedback.selectionClick();
                                }),
                              ),
                              const SizedBox(width: 18),
                              StepperButton(
                                icon: Icons.add,
                                onPressed: () => setState(() {
                                  weight++;
                                  HapticFeedback.selectionClick();
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Age
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE', style: kLabelStyle),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(age.toString(), style: kNumberStyle),
                              const SizedBox(width: 5),
                              const Text('YRS', style: kUnitStyle),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StepperButton(
                                icon: Icons.remove,
                                onPressed: () => setState(() {
                                  if (age > 1) age--;
                                  HapticFeedback.selectionClick();
                                }),
                              ),
                              const SizedBox(width: 18),
                              StepperButton(
                                icon: Icons.add,
                                onPressed: () => setState(() {
                                  age++;
                                  HapticFeedback.selectionClick();
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Calculate button ──────────────────────────────────────────
            PrimaryButton(
              label: 'Calculate BMI',
              onTap: () {
                HapticFeedback.mediumImpact();
                final calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                      idealWeightRange: calc.getIdealWeightRange(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
