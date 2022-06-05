import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';

import '../../common/constants/constants.dart';

class StockAnalysis extends StatefulWidget {
  const StockAnalysis({Key? key, required this.chartData}) : super(key: key);
  final List<SalesData> chartData;

  @override
  State<StockAnalysis> createState() => _StockAnalysisState();
}

class _StockAnalysisState extends State<StockAnalysis> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
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
    print(widget.chartData);
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
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
            onPressed: () {},
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
              child: SfCartesianChart(
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
                // indicators: <TechnicalIndicators<SalesData, dynamic>>[
                //   // BollingerBandIndicator<SalesData, dynamic>(
                //   //   seriesName: "NEPSE",
                //   //   period: 7,
                //   // )

                //   MacdIndicator(
                //     seriesName: "NEPSE",
                //     period: 3,
                //     shortPeriod: 3,
                //     macdType: MacdType.both,
                //     longPeriod: 10,
                //     yAxisName: "secondary",
                //   )
                // ],
                series: <ChartSeries>[
                  HiloOpenCloseSeries<SalesData, dynamic>(
                    enableTooltip: true,
                    dataSource: widget.chartData,
                    xValueMapper: (SalesData sales, _) => sales.x,
                    lowValueMapper: (SalesData sales, _) => sales.low,
                    highValueMapper: (SalesData sales, _) => sales.high,
                    openValueMapper: (SalesData sales, _) => sales.open,
                    closeValueMapper: (SalesData sales, _) => sales.close,
                    volumeValueMapper: (SalesData sales, _) => sales.volumne,
                    name: "NEPSE",
                  )
                ],
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
