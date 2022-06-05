import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: kWhiteColor, // status bar
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SettingsAppbar(),
              Center(
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/avatar.png",
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                    Positioned(
                      left: SizeConfig.screenWidth * 0.56,
                      top: SizeConfig.screenHeight * 0.08,
                      child: Container(
                        height: 28.0,
                        width: 28.0,
                        decoration: const BoxDecoration(
                            color: Color(0xFFffc107), shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            FlutterRemix.edit_line,
                            color: kWhiteColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightWidget(8.0),
              const NormalText(
                "Manish Kumar Rajak",
                fontWeight: FontWeight.w500,
                color: kgreyTextColor,
              ),
              const HeightWidget(2.0),
              const NormalText(
                "manish.rajak2055@gmail.com",
                fontWeight: FontWeight.normal,
                color: kgreyTextColor,
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(kDefaultFontSize * 3),
              const SingleSettingTille(
                title: "Terms and conditions",
                icon: FlutterRemix.file_text_line,
              ),
              const HeightWidget(16.0),
              const SingleSettingTille(
                title: "Invite a friend",
                icon: FlutterRemix.user_add_line,
              ),
              const HeightWidget(16.0),
              const SingleSettingTille(
                title: "Help and Support",
                icon: FlutterRemix.questionnaire_line,
              ),
              const HeightWidget(16.0),
              const SingleSettingTille(
                title: "Settings",
                icon: FlutterRemix.settings_2_line,
              ),
              const HeightWidget(16.0),
              const SingleSettingTille(
                title: "Log out",
                icon: FlutterRemix.logout_box_line,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleSettingTille extends StatelessWidget {
  const SingleSettingTille({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: kSettingslistColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: kgreyTextColor,
                ),
                const WidthWidget(16.0),
                NormalText(
                  title,
                  fontSize: kDefaultFontSize + 2,
                  fontWeight: FontWeight.w500,
                  color: kgreyTextColor,
                ),
                const Spacer(),
                const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kgreyTextColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: kBlackGrey,
            ),
          ),
          const NormalText(
            "Settings",
            fontWeight: FontWeight.bold,
            fontSize: kDefaultFontSize + 2,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FlutterRemix.moon_line,
              color: ktextColor,
            ),
          ),
        ],
      ),
    );
  }
}
