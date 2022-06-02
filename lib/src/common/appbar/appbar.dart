import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/stock_details/models/company_list_model.dart';

import '../../features/watchlist/widgets/company_search_list_widget.dart';
import '../constants/constants.dart';
import '../utils/app_size_utils.dart';
import '../widgets/size/custom_size_widget.dart';
import '../widgets/text/custom_normal_text_widget.dart';

class Appbar extends ConsumerStatefulWidget {
  const Appbar({
    Key? key,
    this.showStockLearning = true,
  }) : super(key: key);

  final bool showStockLearning;

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends ConsumerState<Appbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    color: kBlackColor,
                  ),
                  const WidthWidget(4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      NormalText(
                        "UPSTOCK",
                        fontSize: kDefaultFontSize + 6,
                        fontWeight: FontWeight.bold,
                      ),
                      NormalText(
                        "Learn, Invest & Grow",
                        fontSize: kDefaultFontSize - 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  !widget.showStockLearning
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kChatButtonColor.withOpacity(0.5),
                          ),
                          child: IconButton(
                            icon: const Icon(FlutterRemix.add_line),
                            onPressed: () {
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
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Container(
                                      height: SizeConfig.screenHeight * 0.6,
                                      padding: const EdgeInsets.all(16.0),
                                      color: kWhiteColor,
                                      child: CompanySearchListWidget(
                                        CompanyListModel.fromStorage()!.data,
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        )
                      : Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBFDBFE),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/placeholder.png",
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: const [
                  NormalText(
                    "₹98,509.75",
                    fontSize: kDefaultFontSize + 8,
                    fontWeight: FontWeight.bold,
                  ),
                  WidthWidget(16.0),
                  NormalText(
                    "+ 1700.254 (9.77%)",
                    color: kProfitColor,
                    fontSize: kDefaultFontSize + 2,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
