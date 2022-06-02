import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/watchlist/bloc/watchlist_provider.dart';
import 'package:upstock/src/features/watchlist/models/watch_list_model/watchlist_collection_model.dart';
import 'package:upstock/src/features/watchlist/models/watchlist_model/watchlist_model.dart';
import 'package:upstock/src/features/watchlist/widgets/single_watch_list_widget.dart';

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
              const HeightWidget(8.0),
              const NormalText(
                "My Watchlist",
                fontSize: kDefaultFontSize + 6,
                fontWeight: FontWeight.bold,
              ),
              ref.watch(watchlistNotifierProvider).watchLists != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: ref
                          .watch(watchlistNotifierProvider)
                          .watchLists!
                          .data
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        final WatchlistModel watchList = ref
                            .watch(watchlistNotifierProvider)
                            .watchLists!
                            .data[index];

                        return SingleWatchListWidget(
                          watchlist: watchList,
                          isDecreasing: true,
                        );
                      },
                    )
                  : const NoWatchlistWidget(),

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
