import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';

import '../../../common/widgets/input_field/custom_input_filed.dart';

class SearchInputFieldWidget extends ConsumerStatefulWidget {
  final bool hasFilter;
  const SearchInputFieldWidget({
    required this.hasFilter,
    required this.searchcontroller,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final TextEditingController searchcontroller;
  final Function(String)? onChanged;
  @override
  _SearchInputFieldWidgetState createState() => _SearchInputFieldWidgetState();
}

class _SearchInputFieldWidgetState
    extends ConsumerState<SearchInputFieldWidget> {
  FocusNode? searchFocusNode;

  Timer? searchOnStoppedTyping;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // final searchState = ref.watch(coachStateNotifierProvider);
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: InputField(
                  controller: widget.searchcontroller,
                  borderRadius: 32.0,
                  hintText: "Search Stock",
                  focusNode: searchFocusNode,
                  onChanged: widget.onChanged,
                  icon: const Icon(
                    Icons.search,
                    color: kBlackColor,
                  ),
                  suffix: widget.hasFilter
                      ? const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            FlutterRemix.filter_3_fill,
                            color: kDarkGrey,
                          ),
                        )
                      : const Text(''),
                  backgroundColor: kScafoldColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
