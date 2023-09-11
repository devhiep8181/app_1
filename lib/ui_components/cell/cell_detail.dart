import 'package:app_1/assets.dart';
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CellDetail extends StatelessWidget {
  String nameIcon;
  String nameTitle;
  String subTitle;

  CellDetail(
      {super.key,
      required this.nameIcon,
      required this.nameTitle,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorPalettes.grayColor, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: ColorPalettes.secondaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(
                nameIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameTitle,
                      style: AppTextStyle.H5(color: ColorPalettes.darkColor),
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyle.paragraphMedium(
                          color: ColorPalettes.darkgrayColor),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.assets_image_next_icon_svg)),
            ),
          ],
        ));
  }
}
