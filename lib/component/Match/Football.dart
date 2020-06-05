import 'package:firetiger/PluginWidget/SelectExpandedBar.dart';
import 'package:firetiger/component/Match/selectBarData/selectBarData.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class Football extends StatefulWidget {
  @override
  _FootballState createState() => _FootballState();
}

class _FootballState extends State<Football> with TickerProviderStateMixin{

  TabController _tabController;

  List<Map> _selectExpandedBarData ;
  int highlight;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    _selectExpandedBarData = [
      {'title':'比赛', 'code':1},
      {'title':'排名', 'code':2},
      {'title':'球队榜', 'code':3},
      {'title':'球员榜', 'code':4},
    ];
    highlight = 1;
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
        elevation: 1,
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
                Tab(child: Text('德甲'),),
                Tab(child: Text('韩K联'),),
                Tab(child: Text('西甲'),),
                Tab(child: Text('英超'),),
                Tab(child: Text('意甲'),),
                Tab(child: Text('法家'),),
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
        bottom: PreferredSize(
          preferredSize:Size.fromHeight(60.0),
          child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: SelectExpandedBar()
            ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SelectBarData(),
            Center(child: Text('2'),),
            Center(child: Text('3'),),
            Center(child: Text('4'),),
            Center(child: Text('5'),),
            Center(child: Text('6'),),
          ]
        )
    );
  }


  
}