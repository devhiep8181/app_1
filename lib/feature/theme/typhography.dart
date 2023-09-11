import 'package:flutter/widgets.dart';

class AppTextStyle {
  // ignore: non_constant_identifier_names
  static TextStyle H1({
    Color color = const Color(0xFF3B3936),
  }) {
    return const TextStyle().copyWith(
      color: color,
      fontSize: 56,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w700,
      height: 1.05,
      letterSpacing: -1,
    );
  }

  // ignore: non_constant_identifier_names
  static TextStyle H2({
    Color color = const Color(0xFF3B3936),
  }) {
    return const TextStyle().copyWith(
      color: color,
      fontSize: 40,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w700,
      height: 1.15,
      letterSpacing: -1,
    );
  }

  // ignore: non_constant_identifier_names
  static TextStyle H3({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 32,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w700,
      height: 1.31,
      letterSpacing: -1,
    );
  }

  // ignore: non_constant_identifier_names
  static TextStyle H4({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      height: 1.33,
      letterSpacing: -0.50,
    );
  }

  // ignore: non_constant_identifier_names
  static TextStyle H5({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 20,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      height: 1.30,
      letterSpacing: -0.50,
    );
  }

  static TextStyle paragraphLarge({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
      height: 1.62,
      letterSpacing: -0.50,
    );
  }

  static TextStyle paragraphMedium({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
      height: 1.62,
      letterSpacing: -0.50,
    );
  }

  static TextStyle paragraphSmall({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      height: 1.50,
    );
  }

  static TextStyle buttonLarge({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      height: 1.22,
      letterSpacing: -0.50,
    );
  }

  static TextStyle buttonMedium({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      height: 1.12,
    );
  }

  static TextStyle buttonSmall({
    Color color = const Color(0xFF3B3936),
  }) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      height: 1.14,
    );
  }
}
