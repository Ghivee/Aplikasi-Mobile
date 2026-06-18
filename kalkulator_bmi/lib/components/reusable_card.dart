import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    this.cardChild,
    this.onPress,
    this.isActive = false,
  });

  final Widget? cardChild;
  final VoidCallback? onPress;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: kCardBackground,
          borderRadius: BorderRadius.circular(22.0),
          border: Border.all(
            color: isActive ? kActiveCardBorder : kInactiveCardBorder,
            width: isActive ? 2.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? kPrimary.withValues(alpha: 0.12)
                  : const Color.fromRGBO(15, 23, 42, 0.05),
              blurRadius: isActive ? 16 : 10,
              spreadRadius: isActive ? 2 : 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: cardChild,
      ),
    );
  }
}
