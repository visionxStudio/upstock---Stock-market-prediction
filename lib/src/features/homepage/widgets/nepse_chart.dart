import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upstock/src/common/constants/constants.dart';

class NEPSEChart extends StatefulWidget {
  const NEPSEChart({Key? key}) : super(key: key);

  @override
  State<NEPSEChart> createState() => _NEPSEChartState();
}

class _NEPSEChartState extends State<NEPSEChart> {
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
    final List<ChartData> chartData = [
      ChartData(2010, 2200.88),
      ChartData(2011, 2265.52),
      ChartData(2012, 2274.42),
      ChartData(2013, 2250.91),
      ChartData(2014, 2235.09),
      ChartData(2015, 2200.88),
      ChartData(2016, 2217.19),
      ChartData(2017, 2231.57),
      ChartData(2018, 2239.6),
      ChartData(2019, 2223.7)
    ];
    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          enableMultiSelection: true,
          plotAreaBorderWidth: 0,
          margin: EdgeInsets.zero,
          backgroundColor: kWhiteColor,
          primaryXAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(
                size: 6, width: 2, color: Color(0xFFDFE2E4)),
          ),
          primaryYAxis: NumericAxis(
            isVisible: false,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
          ),
          series: <ChartSeries>[
            SplineSeries<ChartData, int>(
              color: kPrimaryColor2,
              dataSource: chartData,
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

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
