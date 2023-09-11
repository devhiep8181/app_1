import 'package:app_1/assets.dart';
import 'package:app_1/feature/navigator_screen/setting_screen.dart';
import 'package:app_1/feature/navigator_screen/your_course.dart';
import 'package:app_1/feature/navigator_screen/profile_screen.dart';
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const YourCourse(),
    const ProfileScreen(),
    const SettingScreen(),
  ];
  // final List<SvgPicture> _icons = [];

  void _onTapSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.assets_image_courses_svg,
              ),
              label: "Courses"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.assets_image_profile_svg),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.assets_image_wheel_1_svg),
              label: "Settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapSelected,
        selectedItemColor: ColorPalettes.primaryColor,
      ),
    );
  }
}
