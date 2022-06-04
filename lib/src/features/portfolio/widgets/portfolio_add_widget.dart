import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/common/widgets/button/custom_elevated_button.dart';
import 'package:upstock/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';

import '../../../common/utils/app_size_utils.dart';
import '../../stock_details/models/company_list_model.dart';
import '../../watchlist/widgets/company_search_list_widget.dart';

class PortfolioAddWidget extends StatelessWidget {
  const PortfolioAddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
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
                  MinimalInputField(
                    hintText: "Select Symbol",
                    backgroundColor: kScafoldColor,
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
                  ),
                  const NormalText(
                    "Quantity",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  const MinimalInputField(
                    hintText: "Quantity",
                    backgroundColor: kScafoldColor,
                  ),
                  const NormalText(
                    "Purchase Date",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  const MinimalInputField(
                    hintText: "Purchase Date",
                    backgroundColor: kScafoldColor,
                  ),
                  const NormalText(
                    "Type",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  const MinimalInputField(
                    hintText: "IPO",
                    backgroundColor: kScafoldColor,
                  ),
                  const NormalText(
                    "Purchase Price",
                    fontWeight: FontWeight.w500,
                  ),
                  const HeightWidget(4.0),
                  const MinimalInputField(
                    hintText: "Price",
                    backgroundColor: kScafoldColor,
                  ),
                  const HeightWidget(8.0),
                ],
              ),
              CustomElevatedButton(
                text: "Add to Portfolio",
                onTap: () {},
                backgroundColor: kPrimaryColor2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
