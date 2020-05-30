import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/HorseLantern.dart';
import 'package:firetiger/PluginWidget/HomeVideoList.dart';
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
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
            constraints: BoxConstraints(maxHeight: ScreenAdapter.setHeight(270), maxWidth:double.infinity),
            child: SwiperPage(),
          ),
          HorseLantern(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
            child: Column(
              children: <Widget>[
                
                Container(
                  alignment: Alignment.centerLeft,
                  margin:EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                  child: Text('最新资讯', style: TextStyle(fontSize: ScreenAdapter.size(30), color:Color(0xff333333), fontWeight: FontWeight.w600),),
                ),
                Consultation(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                  child: Text('猜你喜欢', style: TextStyle(fontSize: ScreenAdapter.size(30), color:Color(0xff333333), fontWeight: FontWeight.w600),),
                ),
                HomeVideoList()
              ],
            ),
          )
        ]));
  }
}