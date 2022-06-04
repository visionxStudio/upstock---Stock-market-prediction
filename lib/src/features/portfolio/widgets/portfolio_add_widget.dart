import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/portfolio/bloc/portfolioi_state_notifier.dart';

import '../../../common/utils/app_size_utils.dart';
import '../../stock_details/models/company_list_model.dart';
import '../../watchlist/widgets/company_search_list_widget.dart';

class PortfolioAddWidget extends ConsumerStatefulWidget {
  const PortfolioAddWidget({Key? key}) : super(key: key);

  @override
  _PortfolioAddWidgetState createState() => _PortfolioAddWidgetState();
}

class _PortfolioAddWidgetState extends ConsumerState<PortfolioAddWidget> {
  List<String> items = ["IPO", "Secondary"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                NormalText(
                  "Manage Portfolio ",
                  fontSize: kDefaultFontSize + 4,
                  fontWeight: FontWeight.bold,
                  hasUnderline: true,
                ),
              ],
            ),
          ),
          const HeightWidget(16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NormalText(
                    "Stock Symbol",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        clipBehavior: Clip.hardEdge,
                        isScrollControlled: true,
                        barrierColor: kLightGrey.withOpacity(0.6),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              height: SizeConfig.screenHeight * 0.6,
                              padding: const EdgeInsets.all(16.0),
                              color: kWhiteColor,
                              child: CompanySearchListWidget(
                                CompanyListModel.fromStorage()!.data,
                                isFromPortfolio: true,
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      width: double.infinity,
                      height: 45.0,
                      decoration: BoxDecoration(
                          color: kScafoldColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: NormalText(
                        ref.watch(portfolioStateProvider).stock != null
                            ? ref.watch(portfolioStateProvider).stock!.symbol
                            : "Select stock symbol",
                        fontWeight:
                            ref.watch(portfolioStateProvider).stock != null
                                ? FontWeight.w600
                                : FontWeight.normal,
                        color: ref.watch(portfolioStateProvider).stock != null
                            ? kBlackText
                            : ksearchText,
                        fontSize: kDefaultFontSize - 2,
                      ),
                    ),
                  ),
                  const HeightWidget(8.0),
                  const NormalText(
                    "Quantity",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  MinimalInputField(
                    hintText: "Quantity",
                    backgroundColor: kScafoldColor,
                    textInputType: TextInputType.number,
                    onChanged: (String value) {
                      ref
                          .read(portfolioStateProvider.notifier)
                          .quantityChanged(int.parse(value));
                    },
                  ),
                  const NormalText(
                    "Purchase Date",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1800),
                        lastDate: DateTime(2040),
                      );
                      if (date != null) {
                        ref
                            .read(portfolioStateProvider.notifier)
                            .purchaseDateChanged(date);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      width: double.infinity,
                      height: 45.0,
                      decoration: BoxDecoration(
                          color: kScafoldColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: NormalText(
                        ref.watch(portfolioStateProvider).purchasedDate != null
                            ? "${ref.read(portfolioStateProvider).purchasedDate!.year}-${ref.read(portfolioStateProvider).purchasedDate!.month}-${ref.read(portfolioStateProvider).purchasedDate!.day}"
                            : "select purchase date",
                        fontWeight:
                            ref.watch(portfolioStateProvider).purchasedDate !=
                                    null
                                ? FontWeight.w600
                                : FontWeight.normal,
                        color:
                            ref.watch(portfolioStateProvider).purchasedDate !=
                                    null
                                ? kBlackText
                                : ksearchText,
                        fontSize: kDefaultFontSize - 2,
                      ),
                    ),
                  ),
                  const HeightWidget(8.0),
                  const NormalText(
                    "Type",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: kScafoldColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        isDense: true,
                        hint: NormalText(
                            ref.watch(portfolioStateProvider).ipoType,
                            color: kBlackColor),
                        items: items.map(
                          (String item) {
                            return buildMenuItems(
                              item: item,
                              selectedipoType:
                                  ref.watch(portfolioStateProvider).ipoType,
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            ref
                                .read(portfolioStateProvider.notifier)
                                .ipoTypeChanged(value);
                          }
                        },
                      ),
                    ),
                  ),
                  const HeightWidget(4.0),
                  const NormalText(
                    "Purchase Price",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  MinimalInputField(
                    hintText: "Price",
                    backgroundColor: kScafoldColor,
                    textInputType: TextInputType.number,
                    onChanged: ref
                        .read(portfolioStateProvider.notifier)
                        .buyPriceChanged,
                  ),
                  const HeightWidget(8.0),
                ],
              ),
              CustomElevatedButton(
                text: "Add to Portfolio",
                onTap: () {
                  ref.read(portfolioStateProvider.notifier).addToPortfolio();
                },
                backgroundColor: kPrimaryColor2,
              )
            ],
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(
          {required String item, required String selectedipoType}) =>
      DropdownMenuItem(
        enabled: true,
        value: item,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item,
                    style: TextStyle(
                      color:
                          selectedipoType == item ? kBottonColor : kBlackColor,
                    ),
                  ),
                  selectedipoType == item
                      ? const Icon(
                          Icons.done,
                          color: kBottonColor,
                          size: 16.0,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      );
}
