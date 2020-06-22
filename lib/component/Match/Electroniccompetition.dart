import 'package:firetiger/component/Match/selectBarData/match/match.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class Electroniccompetition extends StatefulWidget {
  @override
  _ElectroniccompetitionState createState() => _ElectroniccompetitionState();
}

class _ElectroniccompetitionState extends State<Electroniccompetition> with TickerProviderStateMixin{

  TabController _tabController;

  List<Map> data = [
    {'day':'11/20', 'time':'00:00', 'title':'FPX VS IG', 'subtitle':'LPL春季淘汰赛/BO3', 'status':1, 'bifen':'0:1', 'videoStatus':1},
    {'day':'11/20', 'time':'09:55', 'title':'FPX VS IG', 'subtitle':'LPL春季淘汰赛/BO3', 'status':1, 'bifen':'1:1', 'videoStatus':1},
    {'day':'11/20', 'time':'10:30', 'title':'FPX VS IG', 'subtitle':'LPL春季淘汰赛/BO3', 'status':2, 'bifen':'2:1', 'videoStatus':2},
    {'day':'11/20', 'time':'12:45', 'title':'RNG VS EDG', 'subtitle':'LPL夏季赛冠军赛/BO5', 'status':3, 'bifen':'0:1', 'videoStatus':2},
    {'day':'11/20', 'time':'20:20', 'title':'RNG VS EDG', 'subtitle':'LPL夏季赛冠军赛/BO5', 'status':3, 'bifen':'1:1', 'videoStatus':3},
  ];


  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
        title: Stack(
          children: <Widget>[
            NoShadowTabBar(
              controller: _tabController,
              indicatorWeight:1.0,
              isScrollable: true,
              indicator:Decoration.lerp(BoxDecoration(), BoxDecoration(), 1),
              indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
              labelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Color(0xff555555),
              tabs: <Widget>[
                Tab(child: Text('英雄联盟'),),
                Tab(child: Text('DOTA2'),),
                Tab(child: Text('王者荣耀'),),
                Tab(child: Text('CS:GO'),),
                Tab(child: Text('PUBG'),),
              ],
            ),
            Positioned(
              right: 0,
              child: Container(
                width: ScreenAdapter.setWidth(30),
                height: ScreenAdapter.setHeight(100),
                color: Color.fromRGBO(250, 250, 250, 0.8),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          BarDataMatch(data),
          Center(child: Text('2'),),
          Center(child: Text('3'),),
          Center(child: Text('4'),),
          Center(child: Text('5'),),
        ]
      )
    );
  }
}