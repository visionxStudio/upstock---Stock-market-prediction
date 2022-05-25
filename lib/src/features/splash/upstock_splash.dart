import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/routes/app_router.gr.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

class UpStockSplash extends ConsumerStatefulWidget {
  const UpStockSplash({
    Key? key,
  }) : super(key: key);

  @override
  _UpStockSplashState createState() => _UpStockSplashState();
}

class _UpStockSplashState extends ConsumerState<UpStockSplash>
    with TickerProviderStateMixin {
  int duration = 3000;
  // Completer is used to await for splash animation complete then
  // preform required route change
  final Completer<bool> _completer = Completer();
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: duration),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    // start animating the splash
    _controller.animateTo(1.0);

    // SharedPref.instance.clear();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // when completed complete the completer
    _animation.addListener(() {
      if (_animation.isCompleted) {
        _completer.complete(true);
        completeSplashScreen();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> completeSplashScreen() async {
    await _completer.future.then(
        (value) => AutoRouter.of(context).replace(const WelcomeScreenRoute()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: FadeTransition(
          opacity: _animation,
          child: Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blueAccent.withOpacity(0.8),
                      const Color(0xFF002D64),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "assets/images/applogoTransparent.png",
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: kDefaultFontSize + 2,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Learn, Invest & Grow',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    LoadingAnimationWidget.fourRotatingDots(
                      color: kWhiteColor,
                      size: 50,
                    ),
                    const HeightWidget(kDefaultFontSize * 4),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
