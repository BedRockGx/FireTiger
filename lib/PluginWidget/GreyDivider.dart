import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

// 灰色线条
class GreyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.setHeight(20),
      color: Color(0xffF5F5F5),
    );
  }
}