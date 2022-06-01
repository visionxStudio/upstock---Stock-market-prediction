import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';

import '../homepage/homepage.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight * 2),
        child: Appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("floating action button pressed ");
        },
      ),
    );
  }
}
