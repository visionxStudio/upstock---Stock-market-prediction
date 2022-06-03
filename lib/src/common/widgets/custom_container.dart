import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key, required this.child, this.backgroundColor, this.borderRadius})
      : super(key: key);
  final Color? backgroundColor;
  final double? borderRadius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? kWhiteColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
      ),
      child: child,
    );
  }
}
