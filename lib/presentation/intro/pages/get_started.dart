import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.introBg,
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
                    "Enjoy listening to music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.softGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                            builder: (context) => const ChooseModePage(),
                          ),
                        );
                      },
                      title: "Get Started",
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
