import 'package:app_1/assets.dart';
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:app_1/ui_components/card/header_title.dart';
import 'package:app_1/ui_components/cell/cell_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderTitle(title: "Setting"),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: ListView(
          children: [
            Image.asset(Assets.assets_image_setting_screen_png),
            const SizedBox(height: 16),
            Container(
              height: 82,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(width: 1, color: ColorPalettes.grayColor)),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorPalettes.secondaryColor),
                    child: SvgPicture.asset(
                        Assets.assets_image_notification_svg,
                        fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                      flex: 4,
                      child: Text(
                        "Notifications",
                        style: AppTextStyle.H5(color: ColorPalettes.darkColor),
                      )),
                  Expanded(
                      child: Switch(
                          value: light,
                          activeColor: ColorPalettes.successColor,
                          onChanged: (value) {
                            setState(() {
                              light = value;
                            });
                          }))
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Account information",
              style: AppTextStyle.H5(color: ColorPalettes.darkColor),
            ),
            const SizedBox(height: 16),
            CellDetail(
                nameIcon: Assets.assets_image_human_svg,
                nameTitle: "Name",
                subTitle: "Juana Antonieta"),
            const SizedBox(height: 16),
            CellDetail(
                nameIcon: Assets.assets_image_email_svg,
                nameTitle: "Email",
                subTitle: "juanita123@gmail.com"),
            const SizedBox(height: 16),
            CellDetail(
                nameIcon: Assets.assets_image_look_svg,
                nameTitle: "Password",
                subTitle: "changed 2 weeks ago"),
          ],
        ),
      ),
    );
  }
}
