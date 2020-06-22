import 'package:firetiger/component/Match/selectBarData/match/match.dart';
import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {

    List<Map> data = [
        {'day':'11/20', 'time':'00:00', 'title':'足球 · 巴塞罗那vs尤文图斯', 'subtitle':'17/18赛季欧冠半决赛', 'status':1, 'bifen':'3:9', 'videoStatus':1},
        {'day':'11/20', 'time':'09:55', 'title':'足球 · 罗马vs利物浦', 'subtitle':'17/18赛季欧冠半决赛', 'status':1, 'bifen':'2:1', 'videoStatus':1},
        {'day':'11/20', 'time':'10:30', 'title':'足球 · 足球 · 巴塞罗那vs尤文图斯', 'subtitle':'欧冠经典比赛回放', 'status':2, 'bifen':'0:0', 'videoStatus':2},
        {'day':'11/20', 'time':'12:45', 'title':'足球 · 篮球 · 高速vs新疆喀什古城', 'subtitle':'CBA16/17赛季季后赛1/4决赛第4', 'status':3, 'bifen':'0:0', 'videoStatus':2},
        {'day':'11/20', 'time':'20:20', 'title':'足球 · 罗马vs利物浦', 'subtitle':'17/18赛季欧冠半决赛', 'status':3, 'bifen':'0:0', 'videoStatus':3},
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BarDataMatch(data),
      ),
    );
  }
}