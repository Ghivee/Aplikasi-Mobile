import 'package:flutter/material.dart';
import '../constants.dart';

class StepperButton extends StatelessWidget {
  const StepperButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 46.0,
        height: 46.0,
        decoration: BoxDecoration(
          color: kPrimarySoft,
          shape: BoxShape.circle,
          border: Border.all(color: kPrimaryLight, width: 1.5),
        ),
        child: Icon(icon, color: kPrimary, size: 22.0),
      ),
    );
  }
}
