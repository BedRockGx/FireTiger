import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

import 'homeClass/classWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _tabController;

  double _elevation = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this, initialIndex: 0);
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
        elevation: _elevation,
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
                Tab(child: Text('分类'),),
                Tab(child: Text('推荐'),),
                Tab(child: Text('足球'),),
                Tab(child: Text('篮球'),),
                Tab(child: Text('电竞'),),
                Tab(child: Text('高尔夫'),),
                Tab(child: Text('网球'),),
                Tab(child: Text('乒乓球'),),
                Tab(child: Text('羽毛球'),),
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
        )
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Listener(
              onPointerDown: (PointerDownEvent pointerDownEvent) {
                // print('$pointerDownEvent');
                setState(() {
                  _elevation = 0;
                });
              },
              onPointerMove: (PointerMoveEvent pointerMoveEvent) {
                setState(() {
                  _elevation = 5;
                });
              },
              onPointerUp: (PointerUpEvent upEvent) {
                setState(() {
                  _elevation = 0;
                });
              },
              child: ClassWidget(),
            ),


            Center(child: Text('2'),),
            Center(child: Text('3'),),
            Center(child: Text('4'),),
            Center(child: Text('5'),),
            Center(child: Text('6'),),
            Center(child: Text('7'),),
            Center(child: Text('8'),),
            Center(child: Text('9'),),
          ]
        )
    );
    
  }
}