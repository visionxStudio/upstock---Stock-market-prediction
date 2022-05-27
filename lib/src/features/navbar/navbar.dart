import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io' show Platform;
import 'package:flutter_remix/flutter_remix.dart';

import 'package:upstock/src/features/homepage/homepage.dart';

import '../../common/constants/constants.dart';

enum NavBarPage {
  /// Home for Coach/Studtent
  watchlist,

  /// Calendar for Coach/Student & video conference
  market,

  /// Dashboard
  home,

  /// Profile
  portfolio,

  /// Chat
  profile,
}

extension NavBarPageX on NavBarPage {
  IconData getAsset() {
    switch (this) {
      case NavBarPage.watchlist:
        return FlutterRemix.eye_line;
      case NavBarPage.market:
        return FlutterRemix.stock_line;
      case NavBarPage.home:
        return FlutterRemix.home_3_line;
      case NavBarPage.portfolio:
        return FlutterRemix.pie_chart_line;
      case NavBarPage.profile:
        return FlutterRemix.a_b;
    }
  }
}

List<IconData> activeIcon = [
  FlutterRemix.eye_fill,
  FlutterRemix.stock_fill,
  FlutterRemix.home_3_fill,
  FlutterRemix.pie_chart_fill,
];

class NavBar extends ConsumerStatefulWidget {
  final NavBarPage activeNavPage;
  const NavBar({
    Key? key,
    this.activeNavPage = NavBarPage.home,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  late NavBarPage activeNavPage;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // status bar
      statusBarIconBrightness: Brightness.dark,
    ));
    activeNavPage = NavBarPage.home;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        var edgeInsets = Platform.isIOS
            ? const EdgeInsets.only(bottom: 30, top: 0)
            : const EdgeInsets.only(bottom: 0, top: 0);

        var kNavBarHeight = Platform.isIOS ? 73 : 60;

        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
            extendBody: true,
            body: Builder(
              builder: (context) {
                switch (activeNavPage) {
                  case NavBarPage.watchlist:
                    return const HomeScreen();
                  case NavBarPage.market:
                    return const HomeScreen();
                  case NavBarPage.home:
                    return const HomeScreen();
                  case NavBarPage.portfolio:
                    return const HomeScreen();
                  case NavBarPage.profile:
                    return const HomeScreen();
                }
              },
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: kNavBarHeight + 10,
              padding: edgeInsets,
              decoration: BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -8),
                    blurRadius: 16.0,
                    spreadRadius: 0.0,
                    color: kPureBlack.withOpacity(0.1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: NavBarPage.values
                    .map(
                      (e) => _NavBarButton(
                          index: e.index,
                          onTap: () => setState(() {
                                activeNavPage = e;
                              }),
                          active: activeNavPage == e,
                          asset: e.getAsset()),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    Key? key,
    required this.index,
    required this.onTap,
    required this.active,
    required this.asset,
    this.center = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final int index;
  final bool active;
  final IconData asset;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: center ? 50.0 : 45.0,
          width: center ? 50.0 : 45.0,
          decoration: BoxDecoration(
            color: active ? kNavBarBackgroundColor : kWhiteColor,
            shape: BoxShape.circle,
          ),
          child: index == 4
              ? const SizedBox()
              :
              // ? Center(
              //     child: Stack(
              //       children: [
              //         Consumer(
              //           builder: (BuildContext context, WidgetRef ref,
              //               Widget? child) {
              //             final userState = ref.watch(userNotifierProvider);
              //             return userState.userData == null
              //                 ? const CircleAvatar(
              //                     radius: 23,
              //                     backgroundImage: AssetImage(
              //                       ImageAsset.placeholderimage,
              //                     ),
              //                   )
              //                 : userState.userData!.image != null
              //                     ? ClipRRect(
              //                         borderRadius: BorderRadius.circular(50.0),
              //                         child: CachedNetworkImage(
              //                           imageUrl: ref
              //                               .read(userNotifierProvider)
              //                               .userData!
              //                               .image!,
              //                           fit: BoxFit.cover,
              //                           height: 60.0,
              //                           width: 60.0,
              //                           errorWidget: (context, url, error) {
              //                             return ClipRRect(
              //                               borderRadius:
              //                                   BorderRadius.circular(50.0),
              //                               child: Image.asset(
              //                                 ImageAsset.placeholderimage,
              //                                 height: 60.0,
              //                                 width: 60.0,
              //                               ),
              //                             );
              //                           },
              //                           placeholder: (context, url) {
              //                             return ClipRRect(
              //                               borderRadius:
              //                                   BorderRadius.circular(50.0),
              //                               child: Image.asset(
              //                                 ImageAsset.placeholderimage,
              //                                 height: 60.0,
              //                                 width: 60.0,
              //                               ),
              //                             );
              //                           },
              //                         ),
              //                       )
              //                     : const CircleAvatar(
              //                         radius: 23,
              //                         backgroundImage: AssetImage(
              //                           ImageAsset.placeholderimage,
              //                         ),
              //                       );
              //           },
              //         ),
              //       ],
              //     ),
              //   )
              // : Center(
              Center(
                  child: Stack(
                    children: [
                      Icon(
                        active ? activeIcon[index] : asset,
                        color:
                            active ? kNavBackgroundColor : knavbarInactiveColor,
                      )
                      // Image.asset(
                      //   asset,
                      //   height: center ? 50.0 : 35.0,
                      //   color:
                      //       active ? kNavBackgroundColor : knavbarInactiveColor,
                      // ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
