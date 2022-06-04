import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';
import '../widgets/size/custom_size_widget.dart';
import '../widgets/text/custom_normal_text_widget.dart';

class Appbar extends ConsumerStatefulWidget {
  const Appbar({
    Key? key,
    this.showProfileImage = true,
    this.showPrice = true,
    required this.onTap,
  }) : super(key: key);

  final bool showProfileImage;
  final bool showPrice;
  final VoidCallback onTap;

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends ConsumerState<Appbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    color: kBlackColor,
                  ),
                  const WidthWidget(4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      NormalText(
                        "UPSTOCK",
                        fontSize: kDefaultFontSize + 6,
                        fontWeight: FontWeight.bold,
                      ),
                      NormalText(
                        "Learn, Invest & Grow",
                        fontSize: kDefaultFontSize - 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  !widget.showProfileImage
                      ? GestureDetector(
                          onTap: widget.onTap,
                          child: LottieBuilder.asset(
                            "assets/lottie/add.json",
                            height: 50.0,
                            width: 50.0,
                          ),
                        )
                      : Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBFDBFE),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/placeholder.png",
                            ),
                          ),
                        ),
                ],
              ),
            ),
            !widget.showPrice
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: const [
                        NormalText(
                          "₹98,509.75",
                          fontSize: kDefaultFontSize + 8,
                          fontWeight: FontWeight.bold,
                        ),
                        WidthWidget(16.0),
                        NormalText(
                          "+ 1700.254 (9.77%)",
                          color: kProfitColor,
                          fontSize: kDefaultFontSize + 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
