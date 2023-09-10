import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:app_1/ui_components/btn/btn_default.dart';
import 'package:app_1/ui_components/btn/btn_tag.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  String bodyText;
  String bodyTextTime;
  CourseDetail({super.key, required this.bodyText, required this.bodyTextTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BtnTag(title: "\$ 50", horizontal: 16, width: 58, height: 26),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "About the course",
          style: AppTextStyle.H4(color: ColorPalettes.darkColor),
        ),
        const SizedBox(height: 4),
        Text(
          bodyText,
          textAlign: TextAlign.justify,
          style: AppTextStyle.paragraphMedium(color: ColorPalettes.darkColor),
        ),
        const SizedBox(height: 24),
        Text(
          "Duration",
          style: AppTextStyle.H5(color: ColorPalettes.darkColor),
        ),
        const SizedBox(height: 4),
        Text(
          bodyTextTime,
          style: AppTextStyle.paragraphMedium(color: ColorPalettes.darkColor),
        ),
        const SizedBox(height: 40),
        const BtnDefault(
          title: "Add to cart",
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
