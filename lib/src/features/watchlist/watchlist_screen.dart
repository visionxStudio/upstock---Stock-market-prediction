import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/custom_container.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/watchlist/bloc/watchlist_provider.dart';
import 'package:upstock/src/features/watchlist/models/watchlist_model/watchlist_model.dart';
import 'package:upstock/src/features/watchlist/widgets/company_chart.dart';
import 'package:upstock/src/features/watchlist/widgets/single_watch_list_widget.dart';

import '../../common/show_up_animations.dart';
import '../stock_details/models/company_model.dart';

import '../stock_predicton/prediction_screen.dart';

class WatchListScreen extends ConsumerStatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends ConsumerState<WatchListScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    scheduleMicrotask(
        () => ref.read(watchlistNotifierProvider).getCompanyData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PredictionTopBar(
                searchController: _searchController,
                ref: ref,
                title: "Stock Market Watchlist",
                isFromPredictionScreen: false,
              ),

              ref.watch(watchlistNotifierProvider).isSearching
                  ? Lottie.asset("assets/lottie/search.json")
                  : ref.watch(watchlistNotifierProvider).filteredStocks.isEmpty
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomContainer(
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ref
                                      .watch(watchlistNotifierProvider)
                                      .filteredStocks
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    CompanyModel stock = ref
                                        .watch(watchlistNotifierProvider)
                                        .filteredStocks[index];

                                    return SingleStockWidget(
                                      stock: stock,
                                      textEditingController: _searchController,
                                      onTap: () {
                                        _searchController.text = "";
                                        ref
                                            .read(watchlistNotifierProvider)
                                            .resetIsSearching();
                                        ref
                                            .read(watchlistNotifierProvider)
                                            .getCompanyDetails(
                                                stock: stock, isRefresh: false);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
              ref.watch(watchlistNotifierProvider).watchLists != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            "My Watchlist (${ref.watch(watchlistNotifierProvider).watchLists!.data.length})",
                            fontSize: kDefaultFontSize + 6,
                            fontWeight: FontWeight.bold,
                          ),
                          const HeightWidget(8.0),
                          ref.watch(watchlistNotifierProvider).watchLists !=
                                  null
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ref
                                      .watch(watchlistNotifierProvider)
                                      .watchLists!
                                      .data
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final WatchlistModel watchList = ref
                                        .watch(watchlistNotifierProvider)
                                        .watchLists!
                                        .data[index];
                                    return ShowUpTransition(
                                      duration: Duration(
                                          milliseconds: 300 * (index + 1)),
                                      forward: true,
                                      slideSide: SlideFromSlide.RIGHT,
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            clipBehavior: Clip.hardEdge,
                                            isScrollControlled: true,
                                            barrierColor:
                                                kLightGrey.withOpacity(0.6),
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter setState) {
                                                return Container(
                                                    height: SizeConfig
                                                            .screenHeight *
                                                        0.6,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    color: kWhiteColor,
                                                    child: Column(
                                                      children: [],
                                                    ));
                                              });
                                            },
                                          );
                                        },
                                        child: CustomContainer(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  NormalText(
                                                    watchList.symbol,
                                                    fontSize:
                                                        kDefaultFontSize + 4,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  const HeightWidget(8.0),
                                                  NormalText(
                                                    "Gain/ Loss",
                                                    fontSize:
                                                        kDefaultFontSize - 2,
                                                    fontWeight: FontWeight.w500,
                                                    color: kGreyColor
                                                        .withOpacity(0.8),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CompanyChartWidget(
                                                    height: 40.0,
                                                    width: 80,
                                                    data: watchList.chartData,
                                                    isDecreasing: watchList
                                                        .percentChange
                                                        .toString()
                                                        .contains("-"),
                                                  ),
                                                  const HeightWidget(16.0),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  NormalText(
                                                    // "₹ ${getCurrentInvestment(data)}",
                                                    "₹ ${watchList.chartData[watchList.chartData.length - 1].y}",
                                                    fontSize:
                                                        kDefaultFontSize + 4,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  const HeightWidget(8.0),
                                                  NormalText(
                                                    "(${watchList.percentChange.toStringAsFixed(2)}%)",
                                                    fontSize: kDefaultFontSize,
                                                    color: watchList
                                                            .percentChange
                                                            .toString()
                                                            .contains("-")
                                                        ? Colors.red
                                                        : const Color(
                                                            0xFF57e07d),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );

                                    // return GestureDetector(
                                    //   onTap: () {
                                    //     ref
                                    //         .read(watchlistNotifierProvider)
                                    //         .removeFromWatchList(index);
                                    //   },
                                    //   child: SingleWatchListWidget(
                                    //     watchlist: watchList,
                                    //     isDecreasing: watchList.percentChange
                                    //         .toString()
                                    //         .contains("-"),
                                    //   ),
                                    // );
                                  },
                                )
                              : CustomContainer(
                                  child: SizedBox(
                                      height: SizeConfig.screenHeight * 0.5,
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Lottie.asset(
                                                "assets/lottie/no_data.json"),
                                          ),
                                          const NormalText(
                                            "No Stocks added to Watchlist",
                                            fontSize: kDefaultFontSize + 4,
                                            fontWeight: FontWeight.bold,
                                          )
                                        ],
                                      )),
                                )
                        ],
                      ),
                    )
                  : CustomContainer(
                      child: SizedBox(
                          height: SizeConfig.screenHeight * 0.5,
                          child: Column(
                            children: [
                              Center(
                                child:
                                    Lottie.asset("assets/lottie/no_data.json"),
                              ),
                              const NormalText(
                                "No Stocks added to Watchlist",
                                fontSize: kDefaultFontSize + 4,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          )),
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
