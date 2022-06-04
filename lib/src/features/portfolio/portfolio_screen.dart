import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/show_up_animations.dart';
import 'package:upstock/src/common/widgets/custom_container.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/models/chart_data/chart_data.dart';
import 'package:upstock/src/features/portfolio/database/buy_portfolio/buy_portfolio_model.dart';
import 'package:upstock/src/features/portfolio/database/buy_portfolio_list_model/buy_portfolio_list_model.dart';
import 'package:upstock/src/features/portfolio/widgets/portfolio_add_widget.dart';
import 'package:upstock/src/features/portfolio/widgets/portfolio_card_widget.dart';

import '../../common/appbar/appbar.dart';
import '../../common/utils/app_size_utils.dart';
import '../watchlist/widgets/company_chart.dart';

class MyPortfolioScreen extends StatefulWidget {
  const MyPortfolioScreen({Key? key}) : super(key: key);

  @override
  State<MyPortfolioScreen> createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends State<MyPortfolioScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kScafoldColor, // status bar
      statusBarIconBrightness: Brightness.dark,
    ));
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
                    height: SizeConfig.screenHeight * 0.66,
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
              CustomContainer(
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
                        children: const [
                          NormalText(
                            "₹ 25,582",
                            fontSize: kDefaultFontSize + 8,
                            fontWeight: FontWeight.w500,
                            letterspacing: 1.3,
                          ),
                          NormalText(
                            "+ 9,276 / +24.5%",
                            fontSize: kDefaultFontSize + 2,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF57e07d),
                            letterspacing: 1.3,
                          ),
                        ],
                      ),
                      const HeightWidget(16.0),
                    ],
                  ),
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: BuyPortfolioListModel.fromStorage()!
                    .buyPortfolioList
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  final BuyPortfolioModel data =
                      BuyPortfolioListModel.fromStorage()!
                          .buyPortfolioList[index];
                  return ShowUpTransition(
                    duration: Duration(milliseconds: 300 * (index + 1)),
                    forward: true,
                    slideSide: SlideFromSlide.RIGHT,
                    child: CustomContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
