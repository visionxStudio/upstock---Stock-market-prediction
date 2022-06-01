import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/bloc/home_page_notifier.dart';
import 'package:upstock/src/features/homepage/data/image_list.dart';
import 'package:upstock/src/features/homepage/models/nepse/nepse_news/nepse_news_mode.dart';
import 'package:upstock/src/features/homepage/widgets/nepse_chart.dart';
import 'package:upstock/src/features/homepage/widgets/nepse_description.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            const NepseDescription(),
            const HeightWidget(16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NormalText(
                      "Top Stories",
                      fontSize: kDefaultFontSize + 6,
                      fontWeight: FontWeight.bold,
                    ),
                    ref.watch(nepseProvider).asyncNews.when(
                      data: ((data) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.news.length,
                          itemBuilder: (context, index) {
                            final NepseNewsModel news = data.news[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenWidth * 0.55,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        NormalText(
                                          news.title,
                                          maxline: 3,
                                          fontSize: kDefaultFontSize + 2,
                                          fontWeight: FontWeight.w600,
                                          color: knewsTextColor,
                                        ),
                                        const HeightWidget(8.0),
                                        Row(
                                          children: [
                                            NormalText(
                                              news.source
                                                  .replaceAll(".com", ""),
                                              fontSize: kDefaultFontSize - 4,
                                              fontWeight: FontWeight.bold,
                                              color: kgreyTextColor,
                                            ),
                                            const WidthWidget(8.0),
                                            NormalText(
                                              news.published,
                                              fontSize: kDefaultFontSize - 4,
                                              fontWeight: FontWeight.bold,
                                              color: kgreyTextColor,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 100.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        imageList[0],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                      error: (err, stackTrace) {
                        return ErrorWidget(err);
                      },
                      loading: () {
                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
            ),
            const HeightWidget(kDefaultFontSize * 6)
          ],
        ),
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
