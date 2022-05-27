import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NEPSEChart extends StatelessWidget {
  const NEPSEChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SfCartesianChart(),
    );
  }
}
