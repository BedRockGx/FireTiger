import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/consultationSwiper.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ConsulationPage extends StatefulWidget {
  @override
  _ConsulationPageState createState() => _ConsulationPageState();
}

class _ConsulationPageState extends State<ConsulationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
          constraints: BoxConstraints(maxHeight: ScreenAdapter.setHeight(270), maxWidth:double.infinity),
          child: ConsulationSwiper()
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
          child: Consultation(),
        )
      ],
    );
  }
}