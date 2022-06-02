import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/watchlist/bloc/watchlist_provider.dart';

import '../../common/appbar/appbar.dart';

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
              const NormalText(
                "My Watchlist",
                fontSize: kDefaultFontSize + 6,
                fontWeight: FontWeight.bold,
              ),
              Column(
                children: [
                  HeightWidget(SizeConfig.screenHeight * 0.1),
                  Center(
                    child: Lottie.asset(
                      'assets/lottie/search_cat.json',
                      height: SizeConfig.screenHeight * 0.35,
                    ),
                  ),
                  const HeightWidget(16.0),
                  const NormalText(
                    "Nothing here",
                    fontSize: kDefaultFontSize + 4,
                    fontWeight: FontWeight.bold,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
