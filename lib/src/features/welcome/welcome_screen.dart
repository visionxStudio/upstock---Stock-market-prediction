import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';

import '../../common/utils/app_size_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/welcome.png",
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: SizeConfig.screenHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black,
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                Column(
                  children: const [
                    NormalText(
                      "UPSTOCK",
                      color: kWhiteColor,
                      fontSize: kDefaultFontSize * 3,
                      fontWeight: FontWeight.bold,
                    ),
                    HeightWidget(kDefaultFontSize / 2),
                    NormalText(
                      "Learn, Invest & Grow",
                      color: kWhiteColor,
                      fontSize: kDefaultFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: const [
                    NormalText(
                      "Feel the new experience",
                      fontSize: kDefaultFontSize * 2,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      "of trading",
                      fontSize: kDefaultFontSize * 2,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF00FFF0),
                            Color(0xFF318193),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: NormalText(
                          "Get Started",
                          fontSize: kDefaultFontSize + 8,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const HeightWidget(kDefaultFontSize * 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const NormalText(
                              "Have an account?",
                              color: Color(0xFF72809D),
                            ),
                            // const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: const NormalText(
                                "Log In",
                                color: Color(0xFF48E3FF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const HeightWidget(kDefaultFontSize * 2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
