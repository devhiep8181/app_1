import 'package:app_1/assets.dart';
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:app_1/ui_components/card/course_card.dart';
import 'package:app_1/ui_components/card/course_detail.dart';
import 'package:app_1/ui_components/fields/search_fields.dart';
import 'package:flutter/material.dart';

class ResultSearch extends StatefulWidget {
  const ResultSearch({super.key});

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              SearchField(hintText: "UI"),
              const SizedBox(height: 12),
              Text("2 Results",
                  style: AppTextStyle.H4(color: ColorPalettes.darkColor)),
              Expanded(
                  child: ListView(
                children: [
                  CourseCard(
                    img: Assets.assets_image_result_ui_1_png,
                    timeCourse: "3 h 30 min",
                    nameCourse: "UI Advanced",
                    discriptionCourse: "Advanced mobile interface design",
                    price: "\$ 50",
                  ),
                  const SizedBox(height: 16),
                  CourseCard(
                    img: Assets.assets_image_result_ui_2_png,
                    timeCourse: "3 h 30 min",
                    nameCourse: "UI Advanced",
                    discriptionCourse: "Advanced mobile interface design",
                    price: "\$ 50",
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
