import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';

import '../../common/appbar/appbar.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

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
