import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:statusbarz/statusbarz.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/custom_container.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/stock_analysis/stock_analysis.dart';
import 'package:upstock/src/features/stock_predicton/bloc/stock_prediction_notifier.dart';
import 'package:upstock/src/features/stock_predicton/widgets/search_input_fiel_widget.dart';

import '../../common/appbar/appbar.dart';
import '../../common/constants/constants.dart';
import '../../routes/app_router.gr.dart';
import '../homepage/models/chart_data/chart_data.dart';
import '../stock_details/models/company_model.dart';

class StockPredictionScreen extends ConsumerStatefulWidget {
  const StockPredictionScreen({
    Key? key,
  }) : super(key: key);

  @override
  _StockPredictionScreenState createState() => _StockPredictionScreenState();
}

class _StockPredictionScreenState extends ConsumerState<StockPredictionScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: kScafoldColor, // status bar
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PredictionTopBar(searchController: _searchController, ref: ref),
            // const HeightWidget(8.0),
            ref.watch(stockPredictionProvider).isLoading
                ? SizedBox(
                    height: SizeConfig.screenHeight * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: LottieBuilder.asset(
                            "assets/lottie/waiting.json",
                            frameRate: FrameRate(60),
                            height: 150.0,
                            width: 150.0,
                          ),
                        ),
                      ],
                    ),
                  )
                : ref.watch(stockPredictionProvider).predictedStockData ==
                            null ||
                        ref.watch(stockPredictionProvider).isSearching
                    ? const SizedBox()
                    : Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: PredictedWidget(ref: ref),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NormalText(
                                    "Predicted Stock Price",
                                    fontSize: kDefaultFontSize + 4,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const HeightWidget(16.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: NormalText(
                                          "The predicted price after 10 days:-  ₹ ${(ref.watch(stockPredictionProvider).predictedStockData!.payload[ref.watch(stockPredictionProvider).predictedStockData!.payload.length - 1]).toStringAsFixed(2)}",
                                          fontSize: kDefaultFontSize,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const HeightWidget(16.0),
                                  CustomElevatedButton(
                                    backgroundColor: kPrimaryColor2,
                                    text: "Analyze Stock",
                                    onTap: () {
                                      context.router.push(
                                        StockAnalysisRoute(
                                          chartData: ref
                                              .read(stockPredictionProvider)
                                              .salesData,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
            ref.watch(stockPredictionProvider).isSearching
                ? Lottie.asset("assets/lottie/search.json")
                : ref.watch(stockPredictionProvider).filteredStocks.isEmpty
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
                                    .watch(stockPredictionProvider)
                                    .filteredStocks
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  CompanyModel stock = ref
                                      .watch(stockPredictionProvider)
                                      .filteredStocks[index];

                                  return SingleStockWidget(
                                    stock: stock,
                                    textEditingController: _searchController,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 1.3),
        child: Appbar(
          showPrice: false,
          showProfileImage: true,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        child: SearchStockWidget(
                            searchController: _searchController, ref: ref),
                      ),
                      const HeightWidget(8.0),
                      ref.watch(stockPredictionProvider).isLoading
                          ? SizedBox(
                              height: SizeConfig.screenHeight * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: LottieBuilder.asset(
                                      "assets/lottie/waiting.json",
                                      frameRate: FrameRate(60),
                                      height: 150.0,
                                      width: 150.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ref
                                          .watch(stockPredictionProvider)
                                          .predictedStockData ==
                                      null ||
                                  ref.watch(stockPredictionProvider).isSearching
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    PredictedWidget(ref: ref),
                                    CustomContainer(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const NormalText(
                                            "Predicted Stock Price",
                                            fontSize: kDefaultFontSize + 4,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const HeightWidget(16.0),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: NormalText(
                                                  "The predicted price after 30 days:-  ₹ ${(ref.watch(stockPredictionProvider).predictedStockData!.payload[ref.watch(stockPredictionProvider).predictedStockData!.payload.length - 1]).toStringAsFixed(2)}",
                                                  fontSize: kDefaultFontSize,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const HeightWidget(16.0),
                                          CustomElevatedButton(
                                            backgroundColor: kPrimaryColor2,
                                            text: "Analyze Stock",
                                            onTap: () {
                                              context.router.push(
                                                StockAnalysisRoute(
                                                  chartData: ref
                                                      .read(
                                                          stockPredictionProvider)
                                                      .salesData,
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                      ref.watch(stockPredictionProvider).isSearching
                          ? Lottie.asset("assets/lottie/search.json")
                          : ref
                                  .watch(stockPredictionProvider)
                                  .filteredStocks
                                  .isEmpty
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: ref
                                          .watch(stockPredictionProvider)
                                          .filteredStocks
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        CompanyModel stock = ref
                                            .watch(stockPredictionProvider)
                                            .filteredStocks[index];

                                        return SingleStockWidget(
                                          stock: stock,
                                          textEditingController:
                                              _searchController,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PredictionTopBar extends StatelessWidget {
  const PredictionTopBar({
    Key? key,
    required TextEditingController searchController,
    required this.ref,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          decoration: const BoxDecoration(color: kPrimaryColor2),
        ),
        SizedBox(
          // height: 280,
          width: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                const HeightWidget(8.0),
                const PredictionAppBar(),
                const HeightWidget(16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchStockWidget(
                      searchController: _searchController, ref: ref),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        NormalText(
                          "Note:- stock market are subjected to market risk.",
                          color: kWhiteColor,
                          fontSize: kDefaultFontSize - 2,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PredictionAppBar extends StatelessWidget {
  const PredictionAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
            color: kWhiteColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NormalText("UPSTOCK",
                  fontSize: kDefaultFontSize + 6,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor),
              NormalText("Learn, Invest & Grow",
                  fontSize: kDefaultFontSize - 2,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor),
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
    );
  }
}

class PredictedWidget extends StatefulWidget {
  const PredictedWidget({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  State<PredictedWidget> createState() => _PredictedWidgetState();
}

class _PredictedWidgetState extends State<PredictedWidget> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: kGreyColor.withOpacity(0.5),
      format: 'point.y',
    );
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      enableSelectionZooming: true,
      enableDoubleTapZooming: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          NormalText(
            widget.ref.watch(stockPredictionProvider).searchingCompany!.symbol +
                " Trading Chart",
            fontSize: kDefaultFontSize + 2,
            fontWeight: FontWeight.bold,
            hasUnderline: true,
          ),
          SizedBox(
            height: 200.0,
            child: SfCartesianChart(
              enableAxisAnimation: true,
              zoomPanBehavior: _zoomPanBehavior,
              tooltipBehavior: _tooltipBehavior,
              enableMultiSelection: true,
              plotAreaBorderWidth: 0,
              margin: EdgeInsets.zero,
              backgroundColor: kWhiteColor,
              primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.days,
                isVisible: true,
                labelStyle: const TextStyle(
                  fontSize: kDefaultFontSize - 8,
                ),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 1),
                majorTickLines: const MajorTickLines(
                  size: 8,
                  width: 1,
                  color: Color(0xFFDFE2E4),
                ),
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
              ),
              series: <ChartSeries>[
                FastLineSeries<ChartData, dynamic>(
                  color: kPrimaryColor2,
                  dataSource:
                      widget.ref.watch(stockPredictionProvider).chartData,
                  enableTooltip: true,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SingleStockWidget extends StatelessWidget {
  const SingleStockWidget({
    Key? key,
    required this.stock,
    this.textEditingController,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final CompanyModel stock;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () {
            ref.read(stockPredictionProvider).searchCompanyChanged(stock);
            textEditingController!.text = "";
            ref.read(stockPredictionProvider).resetIsSearching();
            ref
                .read(stockPredictionProvider)
                .getStockPredictionData(symbol: stock.symbol);
          },
          child: SizedBox(
            height: 50.0,
            child: Row(
              children: [
                SizedBox(
                  width: 70.0,
                  child: NormalText(
                    stock.symbol,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const WidthWidget(16.0),
                Expanded(
                  child: NormalText(
                    stock.description,
                    color: kbuttonsheetText,
                    maxline: 1,
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 60.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color: stock.type == "stock" ? kGreen : Colors.red,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Center(
                    child: NormalText(
                      stock.type,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchStockWidget extends StatelessWidget {
  const SearchStockWidget({
    Key? key,
    required TextEditingController searchController,
    required this.ref,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NormalText(
          "Stock Market Prediction",
          fontSize: kDefaultFontSize + 6,
          fontWeight: FontWeight.bold,
          color: kWhiteColor,
        ),
        const HeightWidget(8.0),
        SearchInputFieldWidget(
          hasFilter: false,
          searchcontroller: _searchController,
          onChanged: (String value) {
            ref.read(stockPredictionProvider).startSearch(value);
          },
        ),
      ],
    );
  }
}
