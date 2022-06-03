import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';

import '../../common/show_up_animations.dart';
import '../../common/utils/app_size_utils.dart';
import '../../common/widgets/size/custom_size_widget.dart';
import '../../common/widgets/text/custom_normal_text_widget.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShowUpTransition(
          duration: const Duration(milliseconds: 300),
          forward: true,
          slideSide: SlideFromSlide.BOTTOM,
          child: RefreshIndicator(
            onRefresh: () async {},
            child: Scaffold(
              backgroundColor: kScafoldColor,
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                elevation: 0,
                title: const NormalText(
                  'Profile Settings',
                  isBold: true,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: kWhiteColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: kDefaultPadding / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8.0),
                            child: NormalText(
                              "Manage your personal information",
                              fontSize: 14,
                              color: kPrimaryColor,
                              isBold: true,
                            ),
                          ),
                          const HeightWidget(10),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Consumer(
                                    builder: (context, ref, child) {
                                      return Column(
                                        children: [
                                          ShowUpTransition(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            forward: true,
                                            slideSide: SlideFromSlide.RIGHT,
                                            child: OptionMenuItemsWidget(
                                              onTap: () {},
                                              title: "Manage profile",
                                              icon: FlutterRemix.user_3_line,
                                              svg: false,
                                            ),
                                          ),
                                          ShowUpTransition(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            forward: true,
                                            slideSide: SlideFromSlide.RIGHT,
                                            delay: const Duration(
                                                milliseconds: 50),
                                            child: OptionMenuItemsWidget(
                                              onTap: () {},
                                              title: "Personal information",
                                              icon: FlutterRemix
                                                  .user_settings_line,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 100),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Wallet",
                                      icon: FlutterRemix.wallet_2_line,
                                      svg: true,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 150),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Notifications",
                                      icon: FlutterRemix.notification_2_line,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 200),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Payment Method",
                                      icon: FlutterRemix.bank_card_2_line,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 250),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Opinions",
                                      icon: FlutterRemix.chat_check_line,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 300),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Payment history",
                                      icon: FlutterRemix.alarm_line,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 350),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Settings",
                                      icon: FlutterRemix.settings_line,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.screenWidth,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: ShowUpTransition(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            forward: true,
                                            slideSide: SlideFromSlide.RIGHT,
                                            delay: const Duration(
                                                milliseconds: 400),
                                            child: OptionMenuItemsWidget(
                                              onTap: () {
                                                //context.router.push(const SettingsPageRoute());
                                                showModalBottomSheet(
                                                  barrierColor: kLightGrey
                                                      .withOpacity(0.6),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0),
                                                  ),
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: height(250),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 16.0),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: kWhiteColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  30.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: const [
                                                          HeightWidget(8.0),
                                                          Align(
                                                            child: NormalText(
                                                              "Changer de langue",
                                                              color:
                                                                  kPrimaryColor,
                                                              isBold: true,
                                                              fontSize:
                                                                  kDefaultFontSize -
                                                                      4,
                                                              isCentered: true,
                                                            ),
                                                          ),
                                                          HeightWidget(8.0),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              title: "Language",
                                              icon: FlutterRemix.translate_2,
                                              svg: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const HeightWidget(10),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 450),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {
                                        // context.router.push(SkillPageRoute(
                                        //     userType: UserType.coach));
                                      },
                                      title: "Sponsorship",
                                      icon: FlutterRemix.user_settings_line,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 250),
                                    child: OptionMenuItemsWidget(
                                      onTap: () {},
                                      title: "Switching",
                                      icon: FlutterRemix.switch_line,
                                    ),
                                  ),
                                  ShowUpTransition(
                                    duration: const Duration(milliseconds: 400),
                                    forward: true,
                                    slideSide: SlideFromSlide.RIGHT,
                                    delay: const Duration(milliseconds: 500),
                                    child: OptionMenuItemsWidget(
                                      onTap: () async {},
                                      title: "Sign out",
                                      icon: FlutterRemix.logout_box_line,
                                      svg: true,
                                      iconColor: Colors.red,
                                    ),
                                  ),
                                  const HeightWidget(kNavBarHeight),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LanguageWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const LanguageWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isSelected ? kScafoldColor : kWhiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalText(
                  title,
                  color: kbuttonsheetText,
                )
              ],
            ),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: kScafoldColor,
          ),
        ],
      ),
    );
  }
}

class OptionShimmer extends StatelessWidget {
  const OptionShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 15,
            ),
            const WidthWidget(10),
            Container(
              width: SizeConfig.screenWidth / 2,
              height: 16.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}

class TopShimmerWidget extends StatelessWidget {
  const TopShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: const [
              CircleAvatar(
                radius: 35,
              ),
            ],
          ),
          const WidthWidget(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth / 4,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
              const HeightWidget(5),
              Container(
                width: SizeConfig.screenWidth / 2,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
              const HeightWidget(5),
              Row(
                children: [
                  Container(
                    width: 40.0,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red)),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class OptionMenuItemsWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final bool iscomplete;
  final bool svg;
  final Color iconColor;
  const OptionMenuItemsWidget({
    this.onTap,
    required this.icon,
    required this.title,
    this.iscomplete = true,
    this.svg = true,
    this.iconColor = kgreyTextColor,
    Key? key,
  }) : super(key: key);

  @override
  State<OptionMenuItemsWidget> createState() => _OptionMenuItemsWidgetState();
}

class _OptionMenuItemsWidgetState extends State<OptionMenuItemsWidget> {
  double widget1Opacity = 0.0;

  @override
  void initState() {
    scheduleMicrotask(() => initializeOpacity());
    super.initState();
  }

  void initializeOpacity() async {
    await Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        widget1Opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: widget.onTap,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: widget.iconColor,
            ),
            const WidthWidget(16),
            NormalText(
              widget.title,
              fontSize: kDefaultFontSize - 4,
              color: kPrimaryColor,
            ),
            const WidthWidget(8.0),
            !widget.iscomplete
                ? AnimatedOpacity(
                    opacity: widget1Opacity,
                    duration: const Duration(milliseconds: 400),
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
