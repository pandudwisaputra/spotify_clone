import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin_page.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.chooseModeBg,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                  ),
                  const Spacer(),
                  const Text(
                    "Choose Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark);
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  height: 73,
                                  width: 73,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0x03FFFFFF),
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.moon,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            const Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.light);
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  height: 73,
                                  width: 73,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0x03FFFFFF),
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.sun,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            const Text(
                              "Light Mode",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                                fontSize: 17,
                              ),
                            ),
                          ], 
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: BasicAppButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupOrSigninPage(),
                          ),
                        );
                      },
                      title: "Continue",
                    ),
                  ),
                  const SizedBox(
                    height: 69,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
