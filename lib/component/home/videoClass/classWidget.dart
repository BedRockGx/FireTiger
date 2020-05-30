import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/HorseLantern.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/PluginWidget/swiper.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ClassWidget extends StatefulWidget {
  @override
  _ClassWidgetState createState() => _ClassWidgetState();
}

class _ClassWidgetState extends State<ClassWidget> {

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
        children: <Widget>[
          VideoList()
        ]));
  }
}