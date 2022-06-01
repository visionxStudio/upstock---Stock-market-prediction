import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/features/watchlist/bloc/watchlist_provider.dart';

import '../../common/appbar/appbar.dart';

class WatchListScreen extends ConsumerStatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends ConsumerState<WatchListScreen> {
  @override
  void initState() {
    scheduleMicrotask(
        () => ref.read(watchlistNotifierProvider).getCompanyData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight * 2),
        child: Appbar(
          showStockLearning: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
