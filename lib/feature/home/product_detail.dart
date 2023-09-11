import 'package:app_1/assets.dart';

import 'package:app_1/ui_components/card/course_detail.dart';
import 'package:flutter/material.dart';

import '../../ui_components/card/header_title.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderTitle(title: "Header"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assets_image_img_product_png),
                const SizedBox(height: 16),
                CourseDetail(
                    bodyText:
                        "You can launch a new career in web develop- ment today by learning HTML & CSS. You don't need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.",
                    bodyTextTime: "1 h 30 min"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
