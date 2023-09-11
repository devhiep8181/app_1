import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BtnTag extends StatelessWidget {
  String title;
  double horizontal;
  double vertical;

  BtnTag(
      {super.key,
      required this.title,
      required this.horizontal,
      required this.vertical});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Xử lý khi nút được nhấn
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        decoration: BoxDecoration(
          color: ColorPalettes.secondaryColor,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: AppTextStyle.paragraphSmall(color: Colors.white),
        ),
      ),
    );
  }
}


// InkWell(
//       child: Ink(
//         width: width,
//         height: height,
//         padding: EdgeInsets.symmetric(
//           horizontal: horizontal,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: ColorPalettes.secondaryColor,
//         ),
//         child: Center(
//           child: Text(
//             title!,
//             style: AppTextStyle.paragraphSmall(color: ColorPalettes.whiteColor),
//           ),
//         ),
//       ),
//     );