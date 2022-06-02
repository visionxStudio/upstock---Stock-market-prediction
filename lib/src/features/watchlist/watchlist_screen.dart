import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/bloc/home_page_notifier.dart';
import 'package:upstock/src/features/watchlist/bloc/watchlist_provider.dart';
import 'package:upstock/src/features/watchlist/widgets/company_chart.dart';

import '../../common/appbar/appbar.dart';
import '../homepage/models/chart_data/chart_data.dart';

class WatchListScreen extends ConsumerStatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends ConsumerState<WatchListScreen> {
  @override
  void initState() {
    scheduleMicrotask(
        () => ref.read(watchlistNotifierProvider).getCompanyData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight * 2),
        child: Appbar(
          showStockLearning: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightWidget(8.0),
              const NormalText(
                "My Watchlist",
                fontSize: kDefaultFontSize + 6,
                fontWeight: FontWeight.bold,
              ),
              Column(
                children: [
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              NormalText(
                                "Samriddhi Finance Company ",
                                fontSize: kDefaultFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              HeightWidget(4.0),
                              NormalText(
                                "SFCL ",
                                fontSize: kDefaultFontSize,
                                color: kgreyTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          const CompanyChartWidget(),
                          Column(
                            children: const [
                              NormalText(
                                "₹ 263.55",
                                fontSize: kDefaultFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              HeightWidget(4.0),
                              NormalText(
                                "(+9.77%)",
                                color: Color(0xFF21BF73),
                                fontSize: kDefaultFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // const NoWatchlistWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class NoWatchlistWidget extends StatelessWidget {
  const NoWatchlistWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeightWidget(SizeConfig.screenHeight * 0.1),
        Center(
          child: Lottie.asset(
            'assets/lottie/search_cat.json',
            height: SizeConfig.screenHeight * 0.3,
          ),
        ),
        const HeightWidget(16.0),
        const NormalText(
          "No stocks added yet",
          fontSize: kDefaultFontSize + 4,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
