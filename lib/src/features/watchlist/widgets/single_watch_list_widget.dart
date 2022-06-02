import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';

import '../../../common/widgets/text/custom_normal_text_widget.dart';
import '../models/watchlist_model/watchlist_model.dart';
import 'company_chart.dart';

class SingleWatchListWidget extends StatefulWidget {
  const SingleWatchListWidget({
    required this.watchlist,
    required this.isDecreasing,
    Key? key,
  }) : super(key: key);
  final WatchlistModel watchlist;
  final bool isDecreasing;

  @override
  State<SingleWatchListWidget> createState() => _SingleWatchListWidgetState();
}

class _SingleWatchListWidgetState extends State<SingleWatchListWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.45,
                  child: NormalText(
                    widget.watchlist.fullName,
                    fontSize: kDefaultFontSize,
                    fontWeight: FontWeight.bold,
                    maxline: 1,
                  ),
                ),
                const HeightWidget(4.0),
                NormalText(
                  widget.watchlist.symbol,
                  fontSize: kDefaultFontSize,
                  color: kgreyTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            CompanyChartWidget(
              data: widget.watchlist.chartData,
              isDecreasing: widget.isDecreasing,
            ),
            Column(
              children: [
                NormalText(
                  "₹" +
                      widget.watchlist
                          .chartData[widget.watchlist.chartData.length - 1].y
                          .toString(),
                  fontSize: kDefaultFontSize,
                  fontWeight: FontWeight.bold,
                ),
                const HeightWidget(4.0),
                NormalText(
                  !widget.isDecreasing
                      ? "(+${widget.watchlist.percentChange.toStringAsFixed(2)}%)"
                      : "(${widget.watchlist.percentChange.toStringAsFixed(2)}%)",
                  color: widget.isDecreasing ? Colors.red : Colors.green,
                  fontSize: kDefaultFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
