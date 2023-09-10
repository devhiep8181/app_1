import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:flutter/material.dart';

class BtnTag extends StatelessWidget {
  String? title;
  double horizontal;
  double width;
  double height;
  BtnTag(
      {super.key,
      required this.title,
      required this.horizontal,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorPalettes.secondaryColor,
        ),
        child: Center(
          child: Text(
            title!,
            style: AppTextStyle.paragraphSmall(color: ColorPalettes.whiteColor),
          ),
        ),
      ),
    );
  }
}
