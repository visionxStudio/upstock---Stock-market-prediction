import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/constants/constants.dart';
import '../../homepage/models/chart_data/chart_data.dart';

class CompanyChartWidget extends StatefulWidget {
  const CompanyChartWidget(
      {required this.data,
      required this.isDecreasing,
      this.width,
      this.height,
      Key? key})
      : super(key: key);

  final List<ChartData> data;
  final bool isDecreasing;
  final double? width;
  final double? height;

  @override
  State<CompanyChartWidget> createState() => _CompanyChartWidgetState();
}

class _CompanyChartWidgetState extends State<CompanyChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50.0,
      width: widget.width ?? 50.0,
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
          SplineAreaSeries<ChartData, dynamic>(
            color: widget.isDecreasing ? Colors.red : Colors.green,
            dataSource: widget.data,
            gradient: LinearGradient(
              colors: [
                widget.isDecreasing ? Colors.red : Colors.green,
                widget.isDecreasing
                    ? Colors.red.withOpacity(0.4)
                    : Colors.green.withOpacity(0.4),
                widget.isDecreasing
                    ? Colors.white.withOpacity(0.1)
                    : Colors.white.withOpacity(0.1),
              ],
              stops: const [0.0, 0.6, 1.0],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
            enableTooltip: true,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ],
      ),
    );
  }
}
