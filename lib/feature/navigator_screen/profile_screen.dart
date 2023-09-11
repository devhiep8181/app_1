import 'package:app_1/assets.dart';

import 'package:app_1/feature/route/route_constant.dart';
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';

import 'package:app_1/ui_components/card/header_title.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderTitle(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Center(
                child: CircleAvatar(
                  backgroundColor: ColorPalettes.secondaryColor,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: ColorPalettes.lightGrayColor,
                    backgroundImage:
                        AssetImage(Assets.assets_image_avatar1_png),
                    radius: 95,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: ColorPalettes.grayColor, width: 1),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Courses",
                          style:
                              AppTextStyle.H4(color: ColorPalettes.darkColor),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: ColorPalettes.grayColor, width: 1),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Saved",
                          style:
                              AppTextStyle.H4(color: ColorPalettes.darkColor),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: ColorPalettes.grayColor, width: 1),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Payment",
                          style:
                              AppTextStyle.H4(color: ColorPalettes.darkColor),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 16),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(loginScreen);
                  },
                  child: Text(
                    "Log out",
                    style: AppTextStyle.buttonSmall(
                        color: ColorPalettes.darkgrayColor),
                  ))
            ]),
      ),
    );
  }
}
