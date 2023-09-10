import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final IconData? suffixIcon;
  final String hintText;
  SearchField({super.key, this.suffixIcon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(width: 1, color: ColorPalettes.grayColor),
          )),
    );
  }
}
