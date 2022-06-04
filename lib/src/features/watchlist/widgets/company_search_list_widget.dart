import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upstock/src/features/portfolio/bloc/portfolioi_state_notifier.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';
import 'package:upstock/src/features/watchlist/bloc/watchlist_provider.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/input_field/minimal_input_field.dart';
import '../../../common/widgets/size/custom_size_widget.dart';
import '../../../common/widgets/text/custom_normal_text_widget.dart';

/// Creates a list of Countries with a search textfield.
class CompanySearchListWidget extends StatefulWidget {
  final List<CompanyModel> countries;
  final InputDecoration? searchBoxDecoration;
  final ScrollController? scrollController;
  final bool autoFocus;
  final bool? showFlags;
  final bool? useEmoji;
  final bool isFromPortfolio;

  const CompanySearchListWidget(this.countries,
      {Key? key,
      this.searchBoxDecoration,
      this.scrollController,
      this.showFlags,
      this.useEmoji,
      this.isFromPortfolio = false,
      this.autoFocus = false})
      : super(key: key);

  @override
  _CompanySearchListWidgetState createState() =>
      _CompanySearchListWidgetState();
}

class _CompanySearchListWidgetState extends State<CompanySearchListWidget> {
  final TextEditingController _searchController = TextEditingController();
  late List<CompanyModel> filteredStocks;

  @override
  void initState() {
    filteredStocks = filterStocks();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  InputDecoration getSearchBoxDecoration() {
    return widget.searchBoxDecoration ??
        const InputDecoration(labelText: 'Search by stock symbol or name');
  }

  List<CompanyModel> filterStocks() {
    final value = _searchController.text.trim();

    if (value.isNotEmpty) {
      return widget.countries
          .where(
            (CompanyModel stock) =>
                stock.symbol.toLowerCase().contains(value.toLowerCase()) ||
                getstockName(stock)!
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                stock.description.contains(value.toLowerCase()),
          )
          .toList();
    }

    return widget.countries;
  }

  String? getstockName(CompanyModel stock) {
    return stock.symbol;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const NormalText(
          "Search by stock symbol or name",
          color: kPrimaryColor,
          isBold: true,
          fontSize: kDefaultFontSize - 4,
          isCentered: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: MinimalInputField(
            hintText: "Search by stock symbol",
            backgroundColor: const Color(0xFFF5F6FA),
            textEditingController: _searchController,
            onChanged: (String value) {
              setState(() => filteredStocks = filterStocks());
            },
          ),
        ),
        Flexible(
          child: ListView.builder(
            controller: widget.scrollController,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: filteredStocks.length,
            itemBuilder: (BuildContext context, int index) {
              CompanyModel stock = filteredStocks[index];

              return Consumer(builder: (context, ref, child) {
                return InkWell(
                  onTap: () {
                    if (widget.isFromPortfolio) {
                      ref
                          .read(portfolioStateProvider.notifier)
                          .stockSymbolChanged(stock);
                    } else {
                      ref
                          .read(watchlistNotifierProvider)
                          .getCompanyDetails(stock: stock, isRefresh: false);
                    }

                    context.router.pop();
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
                              color:
                                  stock.type == "stock" ? kGreen : Colors.red,
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Center(
                              child: NormalText(
                            stock.type,
                            color: kWhiteColor,
                          )),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
