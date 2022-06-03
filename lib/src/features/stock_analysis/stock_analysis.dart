import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/appbar/appbar.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/homepage/models/nepse_stock_model.dart';

import '../../common/constants/constants.dart';

class StockAnalysis extends StatefulWidget {
  const StockAnalysis({Key? key}) : super(key: key);

  @override
  State<StockAnalysis> createState() => _StockAnalysisState();
}

class _StockAnalysisState extends State<StockAnalysis> {
  final List<SalesData> data = [];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: kGreyColor.withOpacity(0.5),
    );
    // initializeData();
    super.initState();
  }

  // void initializeData() {
  //   if (NepseStockModel.fromStorage() != null) {
  //     for (int i = NepseStockModel.fromStorage()!.time.length - 20;
  //         i < NepseStockModel.fromStorage()!.time.length;
  //         i++) {
  //       data.add(SalesData(
  //         DateTime.fromMillisecondsSinceEpoch(
  //             NepseStockModel.fromStorage()!.time[i] * 1000),
  //         double.parse(NepseStockModel.fromStorage()!.oopeningPrice[i]),
  //         double.parse(NepseStockModel.fromStorage()!.dayHighPrice[i]),
  //         double.parse(NepseStockModel.fromStorage()!.dayLowPrice[i]),
  //         double.parse(NepseStockModel.fromStorage()!.closingPrice[i]),
  //         double.parse(NepseStockModel.fromStorage()!.volumeTraded[i]),
  //       ));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
              "Nepse Analysis",
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
          quarterTurns: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: SizeConfig.screenHeight * 0.81,
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(minimum: 1600, maximum: 3200),
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
                //   BollingerBandIndicator<SalesData, dynamic>(
                //     seriesName: "NEPSE",
                //     period: 10,
                //   )

                //   // MacdIndicator(
                //   //   seriesName: "NEPSE",
                //   //   period: 10,
                //   //   shortPeriod: 10,
                //   //   macdType: MacdType.both,
                //   //   longPeriod: 20,
                //   //   yAxisName: "secondary",
                //   // )
                // ],
                series: <ChartSeries>[
                  HiloOpenCloseSeries<SalesData, dynamic>(
                    enableTooltip: true,
                    dataSource: data,
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
