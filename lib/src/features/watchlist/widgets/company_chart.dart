import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/constants/constants.dart';
import '../../homepage/models/chart_data/chart_data.dart';

class CompanyChartWidget extends StatefulWidget {
  const CompanyChartWidget({Key? key}) : super(key: key);

  @override
  State<CompanyChartWidget> createState() => _CompanyChartWidgetState();
}

class _CompanyChartWidgetState extends State<CompanyChartWidget> {
  List<ChartData> data = [
    const ChartData(x: "1", y: 10.0),
    const ChartData(x: "12", y: 7.0),
    const ChartData(x: "13", y: 11.0),
    const ChartData(x: "14", y: 8.0),
    const ChartData(x: "15", y: 12.0),
    const ChartData(x: "16", y: 13.0),
    const ChartData(x: "17", y: 14.0),
  ];
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
          FastLineSeries<ChartData, String>(
            color: Colors.green,
            dataSource: data,
            enableTooltip: true,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ],
      ),
    );
  }
}
