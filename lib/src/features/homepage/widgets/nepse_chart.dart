import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/features/homepage/bloc/home_page_notifier.dart';
import '../models/chart_data/chart_data.dart';

class NEPSEChart extends ConsumerStatefulWidget {
  const NEPSEChart({Key? key}) : super(key: key);

  @override
  _NEPSEChartState createState() => _NEPSEChartState();
}

class _NEPSEChartState extends ConsumerState<NEPSEChart> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: kGreyColor.withOpacity(0.5),
      format: 'point.y',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: _tooltipBehavior,
          enableMultiSelection: true,
          plotAreaBorderWidth: 0,
          margin: EdgeInsets.zero,
          backgroundColor: kWhiteColor,
          primaryXAxis: CategoryAxis(
            labelStyle: const TextStyle(
              fontSize: kDefaultFontSize - 8,
            ),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
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
            FastLineSeries<ChartData, String>(
              color: kPrimaryColor2,
              dataSource: ref.watch(nepseProvider).chartData,
              enableTooltip: true,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            )
          ],
        ),
      ),
    );
  }
}
