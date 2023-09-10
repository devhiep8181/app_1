import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:app_1/ui_components/btn/btn_tag.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String img;
  final String? price;
  final String timeCourse;
  final String nameCourse;
  final String discriptionCourse;
  final Widget? customChild;
  CourseCard(
      {Key? key,
      required this.img,
      this.price,
      required this.timeCourse,
      required this.nameCourse,
      required this.discriptionCourse,
      this.customChild})
      : assert(!(customChild != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ColorPalettes.grayColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // decoration: BoxDecoration(color: ColorPalettes.secondaryColor),
            height: 194,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Image.asset(img),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customChild ??
                            BtnTag(
                                title: price,
                                horizontal: 16,
                                width: 58,
                                height: 26)
                      ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeCourse,
                  style: AppTextStyle.paragraphSmall(
                      color: ColorPalettes.successColor),
                ),
                const SizedBox(height: 4),
                Text(
                  nameCourse,
                  style: AppTextStyle.H4(color: ColorPalettes.darkColor),
                ),
                const SizedBox(height: 4),
                Text(
                  discriptionCourse,
                  style: AppTextStyle.paragraphMedium(
                      color: ColorPalettes.darkColor),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
