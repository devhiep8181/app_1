import 'package:app_1/assets.dart';
import 'package:app_1/feature/login/cubit/login_cubit.dart';
import 'package:app_1/feature/route/route_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/color_palettes.dart';
import '../theme/typhography.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextEdittingController =
      TextEditingController();
  final TextEditingController _passWordTextEdittingController =
      TextEditingController();
  final TextEditingController _nameTextEdittingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 52),
                    Image.asset(Assets.assets_image_signUp1_png),
                    const SizedBox(height: 16),
                    Text(
                      "Sign up",
                      style: AppTextStyle.H4(color: ColorPalettes.darkColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Create your account",
                      style: AppTextStyle.paragraphMedium(
                          color: ColorPalettes.darkgrayColor),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameTextEdittingController,
                      decoration: InputDecoration(
                          labelText: "Name",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffBEBAB3)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1.0, color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailTextEdittingController,
                      decoration: InputDecoration(
                          labelText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffBEBAB3)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1.0, color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passWordTextEdittingController,
                      obscureText: (state as LoginInitial).obscureText,
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
                              // setState(() {
                              //   _obscureText = !_obscureText;
                              // });
                              context.read<LoginCubit>().toggleHidePassword();
                            },
                            icon: Icon((state.obscureText)
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: ColorPalettes.darkColor,
                          )),
                    ),
                    const SizedBox(height: 16),
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
                              .createUserWithEmailAndPassword(
                                  email: _emailTextEdittingController.text,
                                  password:
                                      _passWordTextEdittingController.text)
                              .then((value) {
                            Navigator.of(context).pushNamed(loginScreen);
                          });
                          //them man hinh alog thong bao dang ki thanh cong
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              child: Text(
                                "Sign up",
                                style: AppTextStyle.buttonSmall(
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                    const SizedBox(height: 16),
                    TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "Log in",
                          style: AppTextStyle.buttonSmall(
                              color: ColorPalettes.darkgrayColor),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
