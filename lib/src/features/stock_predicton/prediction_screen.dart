import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:upstock/src/common/utils/app_size_utils.dart';
import 'package:upstock/src/common/widgets/custom_container.dart';
import 'package:upstock/src/common/widgets/size/custom_size_widget.dart';
import 'package:upstock/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:upstock/src/features/stock_predicton/bloc/stock_prediction_notifier.dart';
import 'package:upstock/src/features/stock_predicton/widgets/search_input_fiel_widget.dart';

import '../../common/appbar/appbar.dart';
import '../../common/constants/constants.dart';
import '../stock_details/models/company_model.dart';

class StockPredictionScreen extends ConsumerStatefulWidget {
  const StockPredictionScreen({
    Key? key,
  }) : super(key: key);

  @override
  _StockPredictionScreenState createState() => _StockPredictionScreenState();
}

class _StockPredictionScreenState extends ConsumerState<StockPredictionScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kWhiteColor, // status bar
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 1.3),
        child: Appbar(
          showPrice: false,
          showProfileImage: true,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.8,
                child: CustomContainer(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchStockWidget(
                            searchController: _searchController, ref: ref),
                        const HeightWidget(16.0),
                        ref.watch(stockPredictionProvider).isSearching
                            ? Lottie.asset("assets/lottie/search.json")
                            : ref
                                    .watch(stockPredictionProvider)
                                    .filteredStocks
                                    .isEmpty
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: ref
                                            .watch(stockPredictionProvider)
                                            .filteredStocks
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          CompanyModel stock = ref
                                              .watch(stockPredictionProvider)
                                              .filteredStocks[index];

                                          return SingleStockWidget(
                                            stock: stock,
                                            textEditingController:
                                                _searchController,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleStockWidget extends StatelessWidget {
  const SingleStockWidget({
    Key? key,
    required this.stock,
    this.textEditingController,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final CompanyModel stock;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () {
            // print(stock.symbol);
            // textEditingController!.text = "";
            // ref.read(stockPredictionProvider).resetIsSearching();
            ref
                .read(stockPredictionProvider)
                .getStockPredictionData(symbol: stock.symbol);
          },
          child: SizedBox(
            height: 50.0,
            child: Row(
              children: [
                SizedBox(
                  width: 70.0,
                  child: NormalText(
                    stock.symbol,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const WidthWidget(16.0),
                Expanded(
                  child: NormalText(
                    stock.description,
                    color: kbuttonsheetText,
                    maxline: 1,
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 60.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color: stock.type == "stock" ? kGreen : Colors.red,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Center(
                    child: NormalText(
                      stock.type,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchStockWidget extends StatelessWidget {
  const SearchStockWidget({
    Key? key,
    required TextEditingController searchController,
    required this.ref,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NormalText(
          "Stock Market Prediction",
          fontSize: kDefaultFontSize + 6,
          fontWeight: FontWeight.bold,
        ),
        const HeightWidget(16.0),
        SearchInputFieldWidget(
          hasFilter: false,
          searchcontroller: _searchController,
          onChanged: (String value) {
            ref.read(stockPredictionProvider).startSearch(value);
          },
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              NormalText(
                "* Stock market are subjected to market risks.",
                fontSize: kDefaultFontSize - 4,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
