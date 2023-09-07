import 'package:app_1/assets.dart';
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../route/route_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEdittingController =
      TextEditingController();
  final TextEditingController _passWordTextEdittingController =
      TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                Image.asset(Assets.assets_image_login1_png),
                const SizedBox(height: 16),
                Text(
                  "Log in",
                  style: AppTextStyle.H4(color: ColorPalettes.darkColor),
                ),
                const SizedBox(height: 8),
                Text(
                  "Login with social networks",
                  style: AppTextStyle.paragraphMedium(
                      color: ColorPalettes.darkgrayColor),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.assets_image_fb_png),
                    const SizedBox(width: 12),
                    Image.asset(Assets.assets_image_ig_png),
                    const SizedBox(width: 12),
                    Image.asset(Assets.assets_image_gg_png),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTextEdittingController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.0, color: Color(0xffBEBAB3)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0, color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passWordTextEdittingController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0, color: Color(0xffBEBAB3)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorPalettes.darkColor,
                          ))),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyle.buttonSmall(
                          color: ColorPalettes.darkColor),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorPalettes.primaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        )),
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextEdittingController.text,
                              password: _passWordTextEdittingController.text)
                          .then((value) {
                        Navigator.of(context).pushNamed(todoScreen);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Text(
                            "Login",
                            style:
                                AppTextStyle.buttonSmall(color: Colors.white),
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 16),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(signUpScreen);
                    },
                    child: Text(
                      "Sign up",
                      style: AppTextStyle.buttonSmall(
                          color: ColorPalettes.darkgrayColor),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
