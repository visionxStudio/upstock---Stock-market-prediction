import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/bloc/home_page_notifier.dart';
import 'package:upstock/src/features/homepage/models/chart_data/chart_data_list/chart_data_list.dart';
import 'package:upstock/src/features/homepage/models/nepse_stock_model.dart';
import 'package:upstock/src/features/homepage/widgets/nepse_chart.dart';

import '../../common/utils/app_size_utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // ref.read(nepseProvider).getNepseStockData();
    super.initState();
  }

  String k_m_b_generator(String num) {
    int num1 = double.parse(num).toInt();
    if (num1 > 999 && num1 < 99999) {
      return "${(num1 / 1000).toStringAsFixed(1)} K";
    } else if (num1 > 99999 && num1 < 999999) {
      return "${(num1 / 1000).toStringAsFixed(0)} K";
    } else if (num1 > 999999 && num1 < 999999999) {
      return "${(num1 / 1000000).toStringAsFixed(1)} M";
    } else if (num1 > 999999999) {
      return "${(num1 / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num1.toString();
    }
  }

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
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              height: 200.0,
              child: NEPSEChart(),
            ),
          ),
          const NepseTimeIntervalWidget(),
          const HeightWidget(16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NormalText(
                    "Market Stats",
                    fontSize: kDefaultFontSize + 6,
                    fontWeight: FontWeight.bold,
                  ),
                  const HeightWidget(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FlutterRemix.funds_box_line,
                            color: kbluePrimaryColor,
                          ),
                          WidthWidget(8.0),
                          NormalText(
                            'Nepse Index ',
                            fontSize: kDefaultFontSize + 2,
                            fontWeight: FontWeight.bold,
                            color: kgreyTextColor,
                          ),
                        ],
                      ),
                      NepseStockModel.fromStorage() == null
                          ? const NormalText("")
                          : NormalText(
                              NepseStockModel.fromStorage()!
                                  .closingPrice[NepseStockModel.fromStorage()!
                                          .closingPrice
                                          .length -
                                      1]
                                  .toString(),
                              fontSize: kDefaultFontSize + 2,
                              fontWeight: FontWeight.bold,
                            )
                    ],
                  ),
                  const HeightWidget(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FlutterRemix.bar_chart_2_line,
                            color: kbluePrimaryColor,
                          ),
                          WidthWidget(8.0),
                          NormalText(
                            'Volume ',
                            fontSize: kDefaultFontSize + 2,
                            fontWeight: FontWeight.bold,
                            color: kgreyTextColor,
                          ),
                        ],
                      ),
                      NepseStockModel.fromStorage() == null
                          ? const NormalText("")
                          : NormalText(
                              k_m_b_generator(NepseStockModel.fromStorage()!
                                          .volumeTraded[
                                      NepseStockModel.fromStorage()!
                                              .volumeTraded
                                              .length -
                                          1])
                                  .toString(),
                              fontSize: kDefaultFontSize + 2,
                              fontWeight: FontWeight.bold,
                            )
                    ],
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

class NepseTimeIntervalWidget extends StatelessWidget {
  const NepseTimeIntervalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return SizedBox(
        width: double.infinity,
        height: 45.0,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: ref.read(nepseProvider).nepseDataInterval.length,
            itemBuilder: (BuildContext context, int index) {
              final String interval =
                  ref.read(nepseProvider).nepseDataInterval[index];
              return GestureDetector(
                onTap: () {
                  ref.read(nepseProvider).changeSelectedIntervalIndex(index);
                },
                child: Container(
                  width: width(50),
                  margin: const EdgeInsets.all(kDefaultmargin / 2 - 4),
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: ref.watch(nepseProvider).selectedIntervalIndex ==
                                index
                            ? const Color(0xFF0063F5)
                            : const Color(0xFFDFE2E4)),
                    color:
                        ref.watch(nepseProvider).selectedIntervalIndex == index
                            ? const Color(0xFFECF4FF)
                            : const Color(0xFFF8F9FA),
                  ),
                  child: NormalText(
                    interval,
                    fontSize: kDefaultFontSize - 4,
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
