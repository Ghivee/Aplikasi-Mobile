import 'package:flutter/material.dart';

// ── Backgrounds ──────────────────────────────────────────────────────────────
const kScaffoldBackground = Color(0xFFEFF6FF); // Blue 50 — very soft sky
const kCardBackground    = Colors.white;

// ── Brand colours ────────────────────────────────────────────────────────────
const kPrimary     = Color(0xFF2563EB); // Blue 600 — main accent
const kPrimaryLight= Color(0xFFBFDBFE); // Blue 200 — highlight / inactive bg
const kPrimarySoft = Color(0xFFEFF6FF); // Blue 50  — very subtle bg tint

// ── Active / inactive card states ────────────────────────────────────────────
const kActiveCardBorder   = kPrimary;
const kInactiveCardBorder = Color(0xFFE2E8F0); // Slate 200

// ── Status colours ───────────────────────────────────────────────────────────
const kStatusUnderweight = Color(0xFF3B82F6); // Blue 500
const kStatusNormal      = Color(0xFF10B981); // Emerald 500
const kStatusOverweight  = Color(0xFFF59E0B); // Amber 500
const kStatusObese       = Color(0xFFEF4444); // Red 500

// ── Text ─────────────────────────────────────────────────────────────────────
const kTextDark   = Color(0xFF0F172A); // Slate 900
const kTextMid    = Color(0xFF475569); // Slate 600
const kTextLight  = Color(0xFF94A3B8); // Slate 400

// ── Text styles ──────────────────────────────────────────────────────────────
const kHeadingStyle = TextStyle(
  fontSize   : 32.0,
  fontWeight : FontWeight.w900,
  color      : kTextDark,
  letterSpacing: 0.5,
);

const kSubheadStyle = TextStyle(
  fontSize   : 13.0,
  fontWeight : FontWeight.w600,
  color      : kTextLight,
  letterSpacing: 2.5,
);

const kLabelStyle = TextStyle(
  fontSize   : 14.0,
  fontWeight : FontWeight.w600,
  color      : kTextLight,
  letterSpacing: 1.0,
);

const kNumberStyle = TextStyle(
  fontSize   : 52.0,
  fontWeight : FontWeight.w900,
  color      : kTextDark,
  height     : 1.0,
);

const kUnitStyle = TextStyle(
  fontSize   : 15.0,
  fontWeight : FontWeight.w700,
  color      : kTextLight,
);

const kButtonStyle = TextStyle(
  fontSize   : 18.0,
  fontWeight : FontWeight.w700,
  color      : Colors.white,
  letterSpacing: 0.5,
);

const kBMINumberStyle = TextStyle(
  fontSize   : 80.0,
  fontWeight : FontWeight.w900,
  color      : kTextDark,
  height     : 1.0,
);

const kBodyStyle = TextStyle(
  fontSize   : 15.0,
  fontWeight : FontWeight.w500,
  color      : kTextMid,
  height     : 1.6,
);
