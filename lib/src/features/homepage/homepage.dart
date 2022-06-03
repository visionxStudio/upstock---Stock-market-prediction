import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/show_up_animations.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/bloc/home_page_notifier.dart';
import 'package:upstock/src/features/homepage/data/image_list.dart';
import 'package:upstock/src/features/homepage/models/nepse/nepse_news/nepse_news_mode.dart';
import 'package:upstock/src/features/homepage/widgets/nepse_chart.dart';
import 'package:upstock/src/features/homepage/widgets/nepse_description.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/appbar/appbar.dart';
import '../../common/utils/app_size_utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // status bar
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 2),
        child: Appbar(
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                height: 200.0,
                child: ShowUpTransition(
                  duration: Duration(milliseconds: 300),
                  forward: true,
                  slideSide: SlideFromSlide.BOTTOM,
                  child: NEPSEChart(),
                ),
              ),
            ),
            const ShowUpTransition(
              duration: Duration(milliseconds: 900),
              forward: true,
              slideSide: SlideFromSlide.RIGHT,
              child: NepseTimeIntervalWidget(),
            ),
            const HeightWidget(16.0),
            const ShowUpTransition(
                duration: Duration(milliseconds: 900),
                forward: true,
                slideSide: SlideFromSlide.BOTTOM,
                child: NepseDescription()),
            const HeightWidget(16.0),
            const Divider(),
            const HeightWidget(8.0),
            ShowUpTransition(
                duration: const Duration(milliseconds: 900),
                forward: true,
                slideSide: SlideFromSlide.TOP,
                child: NepseTopStoriesWidget(ref: ref)),
            const HeightWidget(kDefaultFontSize * 6)
          ],
        ),
      ),
    );
  }
}

class NepseTopStoriesWidget extends StatefulWidget {
  const NepseTopStoriesWidget({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  State<NepseTopStoriesWidget> createState() => _NepseTopStoriesWidgetState();
}

class _NepseTopStoriesWidgetState extends State<NepseTopStoriesWidget> {
  List<int> randomNumbers = [];
  Random random = Random();

  void addToRandomNumebers() {
    for (int i = 0; i < 4; i++) {
      int randomNumber = Random().nextInt(4) + 1;
      randomNumbers.add(randomNumber);
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  }

  @override
  void initState() {
    addToRandomNumebers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            widget.ref.watch(nepseProvider).asyncNews.when(
              data: ((data) {
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.news.length,
                  itemBuilder: (context, index) {
                    final NepseNewsModel news = data.news[index];
                    return GestureDetector(
                      onTap: () {
                        _launchURL(news.link);
                      },
                      child: Column(
                        children: [
                          Padding(
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
                                        fontSize: kDefaultFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: knewsTextColor,
                                      ),
                                      const HeightWidget(8.0),
                                      Row(
                                        children: [
                                          NormalText(
                                            news.source.replaceAll(".com", ""),
                                            fontSize: kDefaultFontSize - 6,
                                            fontWeight: FontWeight.bold,
                                            color: kgreyTextColor,
                                          ),
                                          const WidthWidget(8.0),
                                          NormalText(
                                            news.published,
                                            fontSize: kDefaultFontSize - 6,
                                            fontWeight: FontWeight.bold,
                                            color: kgreyTextColor,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  // height: 100.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageList[index],
                                      height: 80.0,
                                      width: 120.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
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
