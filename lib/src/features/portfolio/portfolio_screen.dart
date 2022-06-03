import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/show_up_animations.dart';
import 'package:upstock/src/common/widgets/custom_container.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/models/chart_data/chart_data.dart';
import 'package:upstock/src/features/portfolio/widgets/portfolio_card_widget.dart';

import '../../common/appbar/appbar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 1.5),
        child: Appbar(
          showPrice: false,
          showProfileImage: false,
          onTap: () {},
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
                // backgroundColor: kScafoldColor,
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
              // faefaefaec
              CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NormalText(
                          "SFCL",
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
                          data: [
                            ChartData(x: DateTime.utc(1999), y: 10),
                            ChartData(x: DateTime.utc(2000), y: 12),
                            ChartData(x: DateTime.utc(2001), y: 32),
                            ChartData(x: DateTime.utc(2002), y: 15),
                            ChartData(x: DateTime.utc(2003), y: 33),
                            ChartData(x: DateTime.utc(2004), y: 32),
                            ChartData(x: DateTime.utc(2005), y: 35),
                          ],
                          isDecreasing: false,
                        ),
                        const HeightWidget(16.0),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        NormalText(
                          "Rs. 7,599",
                          fontSize: kDefaultFontSize + 4,
                          fontWeight: FontWeight.bold,
                        ),
                        HeightWidget(8.0),
                        NormalText(
                          "+ Rs. 250.54 1.39%",
                          fontSize: kDefaultFontSize,
                          color: Color(0xFF57e07d),
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
