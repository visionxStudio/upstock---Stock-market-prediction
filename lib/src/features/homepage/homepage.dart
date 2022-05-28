import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/widgets/nepse_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 2),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      Container(
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
                Padding(
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
        ),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 250.0,
            child: NEPSEChart(),
          ),
        ],
      ),
    );
  }
}
