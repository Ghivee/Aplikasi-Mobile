import 'package:flutter/material.dart';
import '../constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isActive ? kPrimary : kCardBackground,
          borderRadius: BorderRadius.circular(22.0),
          border: Border.all(
            color: isActive ? kPrimary : kInactiveCardBorder,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? kPrimary.withValues(alpha: 0.3)
                  : const Color.fromRGBO(15, 23, 42, 0.05),
              blurRadius: isActive ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 55.0,
              color: isActive ? Colors.white : kTextLight,
            ),
            const SizedBox(height: 12.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: isActive ? Colors.white : kTextMid,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
