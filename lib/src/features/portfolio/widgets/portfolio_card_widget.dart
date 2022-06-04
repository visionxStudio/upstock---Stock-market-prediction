import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/portfolio/bloc/credit_state_notifier.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/text/custom_normal_text_widget.dart';

class PortfolioCardWidget extends ConsumerStatefulWidget {
  const PortfolioCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  _PortfolioCardWidgetState createState() => _PortfolioCardWidgetState();
}

class _PortfolioCardWidgetState extends ConsumerState<PortfolioCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor2,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Image.asset("assets/images/worls.png"),
        ),
        SizedBox(
          height: 160.0,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NormalText(
                      "Welcome,",
                      fontSize: kDefaultFontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FlutterRemix.information_line,
                        color: kWhiteColor,
                      ),
                    )
                  ],
                ),
                const NormalText(
                  "Make your first investment today!",
                  fontSize: kDefaultFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => ref
                          .read(creditStateProvider.notifier)
                          .creditClaimed(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Center(
                          child: NormalText(
                            "Claim Now!",
                            color: kPrimaryColor2,
                            fontSize: kDefaultFontSize - 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    NormalText(
                      "Available Balance : ₹ ${ref.watch(creditStateProvider).creditAmount}",
                      fontWeight: FontWeight.bold,
                      fontSize: kDefaultFontSize + 2,
                      color: kWhiteColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
