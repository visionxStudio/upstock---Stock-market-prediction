import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/show_up_animations.dart';
import 'package:upstock/src/common/widgets/custom_container.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/models/chart_data/chart_data.dart';
import 'package:upstock/src/features/portfolio/bloc/portfolioi_state_notifier.dart';
import 'package:upstock/src/features/portfolio/database/buy_portfolio/buy_portfolio_model.dart';
import 'package:upstock/src/features/portfolio/database/buy_portfolio_list_model/buy_portfolio_list_model.dart';
import 'package:upstock/src/features/portfolio/widgets/portfolio_add_widget.dart';
import 'package:upstock/src/features/portfolio/widgets/portfolio_card_widget.dart';

import '../../common/appbar/appbar.dart';
import '../../common/utils/app_size_utils.dart';
import '../watchlist/widgets/company_chart.dart';

class MyPortfolioScreen extends ConsumerStatefulWidget {
  const MyPortfolioScreen({Key? key}) : super(key: key);

  @override
  _MyPortfolioScreenState createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends ConsumerState<MyPortfolioScreen> {
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: kScafoldColor, // status bar
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    ref.read(portfolioStateProvider.notifier).getPortfolioList();
    super.initState();
  }

  double getCurrentInvestment(BuyPortfolioModel data) {
    return (data.buyPrice * data.quantity);
  }

  double getCurrentPrice(BuyPortfolioModel data) {
    return (data.chartData[data.chartData.length - 1].y * data.quantity);
  }

  double calulateProfitorLoss(BuyPortfolioModel data) {
    return (getCurrentPrice(data) - getCurrentInvestment(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 1.5),
        child: Appbar(
          showPrice: false,
          showProfileImage: false,
          onTap: () {
            showModalBottomSheet(
              clipBehavior: Clip.hardEdge,
              isScrollControlled: true,
              barrierColor: kLightGrey.withOpacity(0.6),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: SizeConfig.screenHeight * 0.68,
                    padding: const EdgeInsets.all(16.0),
                    color: kWhiteColor,
                    child: const PortfolioAddWidget(),
                  );
                });
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const ShowUpTransition(
                duration: Duration(milliseconds: 1500),
                forward: true,
                slideSide: SlideFromSlide.TOP,
                child: PortfolioCardWidget(),
              ),
              const HeightWidget(kDefaultFontSize),
              ref.watch(portfolioStateProvider).totalInvestment == null
                  ? const SizedBox()
                  : CustomContainer(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleWidget(),
                            const HeightWidget(8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                NormalText(
                                  ref
                                              .watch(portfolioStateProvider)
                                              .totalInvestment !=
                                          null
                                      ? "₹${ref.watch(portfolioStateProvider).totalInvestment!.toStringAsFixed(2)}"
                                      : "",
                                  fontSize: kDefaultFontSize + 8,
                                  fontWeight: FontWeight.w500,
                                  letterspacing: 1.3,
                                ),
                                NormalText(
                                  // "+ 9,276 / +24.5%",
                                  "₹${ref.watch(portfolioStateProvider).profitOrLoss!.toStringAsFixed(2)} / ${((ref.watch(portfolioStateProvider).profitOrLoss!) / ref.watch(portfolioStateProvider).totalInvestment! * 100).toStringAsFixed(2)}%",
                                  fontSize: kDefaultFontSize + 2,
                                  fontWeight: FontWeight.w500,
                                  color: ref
                                          .watch(portfolioStateProvider)
                                          .profitOrLoss!
                                          .toString()
                                          .contains("-")
                                      ? Colors.red
                                      : const Color(0xFF57e07d),
                                  letterspacing: 1.3,
                                ),
                              ],
                            ),
                            const HeightWidget(16.0),
                          ],
                        ),
                      ),
                    ),

              ref.watch(portfolioStateProvider).buyPortfolioList == null
                  ? CustomContainer(
                      child: SizedBox(
                          height: SizeConfig.screenHeight * 0.5,
                          child: Column(
                            children: [
                              Center(
                                child:
                                    Lottie.asset("assets/lottie/no_data.json"),
                              ),
                              const NormalText(
                                "No Stocks added to portfolio",
                                fontSize: kDefaultFontSize + 4,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          )),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ref
                          .watch(portfolioStateProvider)
                          .buyPortfolioList!
                          .buyPortfolioList
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        final BuyPortfolioModel data = ref
                            .watch(portfolioStateProvider)
                            .buyPortfolioList!
                            .buyPortfolioList[index];
                        return ShowUpTransition(
                          duration: Duration(milliseconds: 300 * (index + 1)),
                          forward: true,
                          slideSide: SlideFromSlide.RIGHT,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                clipBehavior: Clip.hardEdge,
                                isScrollControlled: true,
                                barrierColor: kLightGrey.withOpacity(0.6),
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Container(
                                        height: SizeConfig.screenHeight * 0.6,
                                        padding: const EdgeInsets.all(16.0),
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
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NormalText(
                                        data.stock!.symbol,
                                        fontSize: kDefaultFontSize + 4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const HeightWidget(8.0),
                                      NormalText(
                                        "Gain/ Loss",
                                        fontSize: kDefaultFontSize - 2,
                                        fontWeight: FontWeight.w500,
                                        color: kGreyColor.withOpacity(0.8),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CompanyChartWidget(
                                        height: 40.0,
                                        width: 80,
                                        data: data.chartData,
                                        isDecreasing: calulateProfitorLoss(data)
                                            .toString()
                                            .contains("-"),
                                      ),
                                      const HeightWidget(16.0),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      NormalText(
                                        "₹ ${getCurrentInvestment(data)}",
                                        fontSize: kDefaultFontSize + 4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const HeightWidget(8.0),
                                      NormalText(
                                        // "+ Rs. 250.54 1.39%",
                                        "₹${getCurrentPrice(data) - getCurrentInvestment(data)}  / ${((getCurrentPrice(data) - getCurrentInvestment(data)) / getCurrentInvestment(data) * 100).toStringAsFixed(2)}%",
                                        fontSize: kDefaultFontSize,
                                        color: calulateProfitorLoss(data)
                                                .toString()
                                                .contains("-")
                                            ? Colors.red
                                            : const Color(0xFF57e07d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
              // faefaefaec
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NormalText(
          "Portfolio".toUpperCase(),
          fontSize: kDefaultFontSize + 2,
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
        const NormalText(
          "View All",
          color: Color(0xFF6cbbd4),
          fontSize: kDefaultFontSize - 2,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
