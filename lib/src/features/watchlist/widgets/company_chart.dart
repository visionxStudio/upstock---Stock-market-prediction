import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/constants/constants.dart';
import '../../homepage/models/chart_data/chart_data.dart';

class CompanyChartWidget extends StatefulWidget {
  const CompanyChartWidget(
      {required this.data, required this.isDecreasing, Key? key})
      : super(key: key);

  final List<ChartData> data;
  final bool isDecreasing;

  @override
  State<CompanyChartWidget> createState() => _CompanyChartWidgetState();
}

class _CompanyChartWidgetState extends State<CompanyChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: SfCartesianChart(
        enableAxisAnimation: true,
        enableMultiSelection: true,
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.zero,
        backgroundColor: kWhiteColor,
        primaryXAxis: CategoryAxis(
          isVisible: false,
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
          FastLineSeries<ChartData, dynamic>(
            color: widget.isDecreasing ? Colors.red : Colors.green,
            dataSource: widget.data,
            enableTooltip: true,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ],
      ),
    );
  }
}
