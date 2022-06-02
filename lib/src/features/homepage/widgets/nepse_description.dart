import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/bloc/home_page_notifier.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/size/custom_size_widget.dart';
import '../../../common/widgets/text/custom_normal_text_widget.dart';
import '../models/nepse/nepse_trading_menu/nepse_trading_menu.dart';
import '../models/nepse_stock_model.dart';

class NepseDescription extends StatefulWidget {
  const NepseDescription({Key? key}) : super(key: key);

  @override
  State<NepseDescription> createState() => _NepseDescriptionState();
}

class _NepseDescriptionState extends State<NepseDescription> {
  String kmbGenerator(String num) {
    int num1 = double.parse(num).toInt();
    if (num1 > 999 && num1 < 99999) {
      return "${(num1 / 1000).toStringAsFixed(1)} K";
    } else if (num1 > 99999 && num1 < 999999) {
      return "${(num1 / 1000).toStringAsFixed(0)} K";
    } else if (num1 > 999999 && num1 < 999999999) {
      return "${(num1 / 1000000).toStringAsFixed(1)} M";
    } else if (num1 > 999999999) {
      return "${(num1 / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num1.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NormalText(
              "Market Stats",
              fontSize: kDefaultFontSize + 6,
              fontWeight: FontWeight.bold,
            ),
            const HeightWidget(8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FlutterRemix.funds_box_line,
                      color: kbluePrimaryColor,
                    ),
                    WidthWidget(8.0),
                    NormalText(
                      'Nepse Index ',
                      fontSize: kDefaultFontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: kgreyTextColor,
                    ),
                  ],
                ),
                const HeightWidget(kDefaultFontSize * 2),
                NepseStockModel.fromStorage() == null
                    ? const NormalText("")
                    : Row(
                        children: [
                          NormalText(
                            NepseStockModel.fromStorage()!
                                .closingPrice[NepseStockModel.fromStorage()!
                                        .closingPrice
                                        .length -
                                    1]
                                .toString(),
                            fontSize: kDefaultFontSize + 2,
                            fontWeight: FontWeight.bold,
                          ),
                          NormalText(
                            " (${NepseTradingMenuModel.fromStorage()!.price.percentageChange}%)",
                            fontSize: kDefaultFontSize + 2,
                            color: NepseTradingMenuModel.fromStorage()!
                                    .price
                                    .percentageChange
                                    .contains("-")
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      )
              ],
            ),
            const HeightWidget(8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FlutterRemix.bar_chart_2_line,
                      color: kbluePrimaryColor,
                    ),
                    WidthWidget(8.0),
                    NormalText(
                      'Volume ',
                      fontSize: kDefaultFontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: kgreyTextColor,
                    ),
                  ],
                ),
                NepseStockModel.fromStorage() == null
                    ? const NormalText("")
                    : NormalText(
                        kmbGenerator(NepseStockModel.fromStorage()!
                                .volumeTraded[NepseStockModel.fromStorage()!
                                    .volumeTraded
                                    .length -
                                1])
                            .toString(),
                        fontSize: kDefaultFontSize + 2,
                        fontWeight: FontWeight.bold,
                      )
              ],
            ),
            const HeightWidget(kDefaultFontSize),
            const NormalText(
              "About",
              fontSize: kDefaultFontSize + 6,
              fontWeight: FontWeight.bold,
            ),
            const HeightWidget(16.0),
            Consumer(
              builder: (context, ref, child) {
                final readMore = ref.watch(nepseProvider).readMore;
                final descriptionProvider = ref.watch(nepseProvider);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref.read(nepseProvider).readMoreToggled();
                      },
                      child: NormalText(
                        readMore
                            ? descriptionProvider.nepseLongDescription
                            : descriptionProvider.nepseShortDescription,
                        color: kgreyTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: kDefaultFontSize - 2,
                      ),
                    ),
                    const HeightWidget(8.0),
                    GestureDetector(
                      onTap: () {
                        ref.read(nepseProvider).readMoreToggled();
                      },
                      child: NormalText(
                        readMore ? "Read Less" : "Read More",
                        color: kbluePrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
