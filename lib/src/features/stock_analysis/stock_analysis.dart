import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/stock_analysis/bloc/stock_analysis.dart';

import '../../common/constants/constants.dart';

class StockAnalysis extends ConsumerStatefulWidget {
  const StockAnalysis({Key? key, required this.chartData}) : super(key: key);
  final List<SalesData> chartData;

  @override
  _StockAnalysisState createState() => _StockAnalysisState();
}

class _StockAnalysisState extends ConsumerState<StockAnalysis> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: kGreyColor.withOpacity(0.5),
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
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);

              context.router.pop();
            },
          ),
          backgroundColor: kWhiteColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: kBlackColor,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const NormalText(
                "Stock Analysis",
                fontWeight: FontWeight.bold,
                fontSize: kDefaultFontSize + 6,
              ),
              const WidthWidget(4.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: kPrimaryColor2,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const NormalText(
                  "Beta",
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            //  IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     FlutterRemix.rotate_lock_line,
            //   ),
            // ),
            IconButton(
              onPressed: () {
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
                        height: SizeConfig.screenWidth * 0.65,
                        padding: const EdgeInsets.all(16.0),
                        color: kWhiteColor,
                        child: Column(
                          children: [
                            const NormalText(
                              "Technical Analysis Indicators",
                              fontWeight: FontWeight.bold,
                              fontSize: kDefaultFontSize + 4,
                            ),
                            Consumer(
                              builder: (context, ref, child) {
                                final state = ref.watch(stockAnalysisProvider);
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const NormalText(
                                        "Enable Bollinger Band Indicator"),
                                    Switch(
                                        value:
                                            state.enableBollingerBandIndicator,
                                        onChanged: (bool value) {
                                          state.toggleBollingerBandIndicator(
                                              value);
                                        }),
                                  ],
                                );
                              },
                            ),
                            const HeightWidget(16.0),
                            Consumer(
                              builder: (context, ref, child) {
                                final state = ref.watch(stockAnalysisProvider);
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const NormalText("Enable MACD Indicator"),
                                    Switch(
                                        value: state.enableMACD,
                                        onChanged: (bool value) {
                                          state.toggleMACD(value);
                                        }),
                                  ],
                                );
                              },
                            ),
                            const HeightWidget(16.0),
                            CustomElevatedButton(
                                text: "Done",
                                onTap: () {
                                  context.router.pop();
                                })
                          ],
                        ),
                      );
                    });
                  },
                );
              },
              icon: const Icon(
                FlutterRemix.settings_line,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: RotatedBox(
            quarterTurns: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: SizedBox(
                width: SizeConfig.screenHeight * 0.9,
                child: Consumer(builder: (context, ref, child) {
                  final state = ref.watch(stockAnalysisProvider);
                  return SfCartesianChart(
                    zoomPanBehavior: _zoomPanBehavior,
                    primaryXAxis: DateTimeAxis(),
                    // primaryYAxis: NumericAxis(minimum: 1600, maximum: 3200),
                    tooltipBehavior: _tooltipBehavior,
                    margin: EdgeInsets.zero,
                    backgroundColor: kWhiteColor,
                    axes: [
                      NumericAxis(
                        name: 'secondary',
                        opposedPosition: true,
                      )
                    ],
                    trackballBehavior: TrackballBehavior(
                      enable: true,
                      tooltipSettings: const InteractiveTooltip(
                        enable: true,
                      ),
                    ),
                    indicators: <TechnicalIndicators<SalesData, dynamic>>[
                      BollingerBandIndicator<SalesData, dynamic>(
                        seriesName: state.enableBollingerBandIndicator
                            ? "NEPSE"
                            : "Disable",
                        period: 7,
                      ),
                      MacdIndicator(
                        seriesName: state.enableMACD ? "NEPSE" : "Disable",
                        period: 7,
                        shortPeriod: 5,
                        longPeriod: 20,
                        macdType: MacdType.both,
                        signalLineColor: Colors.red,
                        macdLineColor: Colors.green,
                        yAxisName: "secondary",
                      )
                    ],
                    series: <ChartSeries>[
                      HiloOpenCloseSeries<SalesData, dynamic>(
                        enableTooltip: true,
                        dataSource: widget.chartData,
                        xValueMapper: (SalesData sales, _) => sales.x,
                        lowValueMapper: (SalesData sales, _) => sales.low,
                        highValueMapper: (SalesData sales, _) => sales.high,
                        openValueMapper: (SalesData sales, _) => sales.open,
                        closeValueMapper: (SalesData sales, _) => sales.close,
                        volumeValueMapper: (SalesData sales, _) =>
                            sales.volumne,
                        name: "NEPSE",
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volumne;

  SalesData(this.x, this.open, this.high, this.low, this.close, this.volumne);
}
