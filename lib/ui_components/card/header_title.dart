// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_1/assets.dart';
import 'package:flutter/material.dart';

import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HeaderTitle extends StatelessWidget implements PreferredSizeWidget {
  String title;
  HeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0, 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: ColorPalettes.grayColor,
                )),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(Assets.assets_image_Go_back_svg)),
            ),
          ),
          title: Text(
            title,
            style: AppTextStyle.H4(color: ColorPalettes.darkColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
