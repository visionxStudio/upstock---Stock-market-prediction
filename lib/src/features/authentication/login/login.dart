import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';

import '../../../common/custom_shape/auth_shape.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight * 0.55),
            painter: AuthCustomPaint(),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.35,
            child: Align(
              // top: SizeConfig.screenHeight * 0.15,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/applogoTransparent.png",
                    height: 38.0,
                    color: kBlackColor,
                  ),
                  const WidthWidget(8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      NormalText(
                        "UPSTOCK",
                        color: kBlackColor,
                        fontSize: kDefaultFontSize + 8,
                        fontWeight: FontWeight.bold,
                      ),
                      NormalText(
                        "Learn, Invest & Grow",
                        color: kBlackColor,
                        fontSize: kDefaultFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: SizeConfig.screenHeight,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const HeightWidget(16.0),
                    const NormalText(
                      "Login",
                      fontSize: kDefaultFontSize * 2,
                      fontWeight: FontWeight.bold,
                    ),
                    const HeightWidget(kDefaultFontSize * 2),
                    const MinimalInputField(
                      hintText: "E-mail Address",
                    ),
                    const HeightWidget(8.0),
                    const MinimalInputField(
                      hintText: "Password",
                      isPassword: true,
                    ),
                    const HeightWidget(8.0),
                    CustomElevatedButton(
                      text: "Log In",
                      onTap: () {},
                      backgroundColor: const Color(0xFF000113),
                    ),
                    const HeightWidget(kDefaultFontSize * 3),
                    const NormalText(
                      "Or continue with",
                      color: Color(0xFF64748B),
                    ),
                    const HeightWidget(10.0),
                    const SocialLoginWidget(),
                    const HeightWidget(16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        NormalText(
                          "Don't have account?",
                          color: Color(0xFF828282),
                        ),
                        WidthWidget(4.0),
                        NormalText(
                          "Create now",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000113),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(4.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google.png"),
                const WidthWidget(4.0),
                const NormalText(
                  "Google",
                  color: Color(0xFF475569),
                ),
              ],
            ),
          ),
        ),
        const WidthWidget(16.0),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(4.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/facebook.png"),
                const WidthWidget(4.0),
                const NormalText(
                  "Facebook",
                  color: Color(0xFF475569),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
