import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XMargin extends StatelessWidget {
  final double x;
  const XMargin(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

double screenHeight(BuildContext context, {double percent = 100}) =>
    Get.size.height * (percent / 100);

double screenWidth(BuildContext context, {double percent = 100}) =>
    Get.size.width * (percent / 100);