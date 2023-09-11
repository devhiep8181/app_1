import 'package:app_1/assets.dart';

import 'package:app_1/ui_components/card/course_card.dart';
import 'package:app_1/ui_components/card/header_title.dart';
import 'package:flutter/material.dart';

class YourCourse extends StatefulWidget {
  const YourCourse({super.key});

  @override
  State<YourCourse> createState() => _YourCourseState();
}

class _YourCourseState extends State<YourCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderTitle(title: "Your Courses"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CourseCard(
                  img: Assets.assets_image_result_ui_1_png,
                  price: null,
                  timeCourse: "Left 1 h 20 min ",
                  nameCourse: "Swift ",
                  discriptionCourse: "Advanced iOS apps"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CourseCard(
                  img: Assets.assets_image_result_ui_1_png,
                  price: null,
                  timeCourse: "Left 1 h 20 min ",
                  nameCourse: "Swift ",
                  discriptionCourse: "Advanced iOS apps"),
            ),
          ],
        ),
      ),
    );
  }
}
