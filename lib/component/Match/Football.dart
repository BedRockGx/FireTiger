import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/SelectExpandedBar.dart';
import 'package:firetiger/component/Match/selectBarData/selectBarData.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Football extends StatefulWidget {
  @override
  _FootballState createState() => _FootballState();
}

class _FootballState extends State<Football> with TickerProviderStateMixin{

  TabController _tabController;
  PageController _pageController;

  int highlight;
  var api = Api();
  List<Map> _tabBar = [];
  var _futureClassBuilder;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    highlight = 1;
    _futureClassBuilder = _getLiveClassBar();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }


  Future _getLiveClassBar() async {

    Response res;
    res = await api.getData(context, 'getFootBallLeague');

    var v = json.decode(res.toString());

    v['data']['info']['list'].insert(0, {
        "leagueId": "0",
        "nameChsShort": "全部",
        "sort": "0",
        "type": "1",
        "logo": "http://qb1cwbwpw.bkt.clouddn.com/dejia.jpg"
    });

    _tabController = TabController(length: v['data']['info']['list'].length, vsync: this, initialIndex: 0);
    _pageController = PageController();
  

    setState(() {
      _tabBar = (v['data']['info']['list'] as List).cast();
    });


    return v;
  }

  @override
  Widget build(BuildContext context) {

    var now = new DateTime.now();
    
    var selectProvider = Provider.of<MatchBarProvider>(context);
    selectProvider.setHomeBarIndex(1);
    // Timer(Duration(milliseconds: 200), (){
      
    //   // selectProvider.setBarIndex(1);              // 每一次切换时都要变回0
    //   // selectProvider.setNowTime("${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}");
    // });
    
  
    return FutureBuilder(
      future: _futureClassBuilder,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
                  body: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
                        height: ScreenAdapter.setHeight(50),
                        child:  TabBar(
                          controller: _tabController,
                          indicatorWeight:3.0,
                          isScrollable: true,
                          indicatorColor:Theme.of(context).primaryColor,
                          labelPadding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(15)),
                          // indicator:Decoration.lerp(BoxDecoration(), BoxDecoration(), 1),
                          indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                          labelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
                          labelColor: Theme.of(context).primaryColor,
                          unselectedLabelColor: Color(0xff555555),
                          onTap: (index) {
                            _pageController.jumpToPage(index);
                          },
                          tabs: _tabBar.map((item) {
                                        return Tab(
                                          child: Text('${item['nameChsShort']}'),
                                        );
                                      }).toList()
                        ),
                      ),
                      SelectExpandedBar(),
                      Expanded(
                        child: FixTabBarView(
                        tabController: _tabController,
                        pageController: _pageController,
                        children:  _tabBar.map((item) {
                                    return SelectBarData(item, type: 0, selectProvider:selectProvider);
                                  }).toList()
                        ),
                      )
                    ],
                  )
                  
                );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    }
  );
     
  }


  
}