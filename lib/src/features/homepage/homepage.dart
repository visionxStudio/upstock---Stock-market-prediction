import 'package:flutter/material.dart';
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
          SizedBox(
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
                      print(ChartDataList.fromStorage());
                    },
                    child: Container(
                      width: width(50),
                      margin: const EdgeInsets.all(kDefaultmargin / 2 - 4),
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDFE2E4)),
                        color: const Color(0xFFF8F9FA),
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
          ),
        ],
      ),
    );
  }
}
