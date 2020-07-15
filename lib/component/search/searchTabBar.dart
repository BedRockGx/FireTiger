// import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'dart:convert';

import 'package:firetiger/component/search/tab/all.dart';
import 'package:firetiger/component/search/tab/anchor.dart';
import 'package:firetiger/component/search/tab/match.dart';
import 'package:firetiger/component/search/tab/video.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/searDataProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTabBar extends StatefulWidget {
  var data;
  SearchTabBar({this.data});
  @override
  _SearchTabBarState createState() => _SearchTabBarState(this.data);
}

class _SearchTabBarState extends State<SearchTabBar> with TickerProviderStateMixin{

   TabController _tabController;
   var data;
   _SearchTabBarState(this.data);
   var api = Api();

  double _elevation = 0;
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }



  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body:ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child:InkWell(
                    child:  Container(
                      child: Text('全部', textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(30))),
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(50)),
                      padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(10)),
                      decoration: BoxDecoration(
                        border: Border(bottom: _index == 0 ? BorderSide(width: 1, color: Theme.of(context).primaryColor) : BorderSide.none)
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        _index = 0;
                      });
                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      child: Text('主播', textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(30))),
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(50)),
                      padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(10)),
                      decoration: BoxDecoration(
                        border: Border(bottom: _index == 1 ? BorderSide(width: 1, color: Theme.of(context).primaryColor) : BorderSide.none)
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        _index = 1;
                      });
                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      child: Text('赛事', textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(30))),
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(50)),
                      padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(10)),
                      decoration: BoxDecoration(
                        border: Border(bottom: _index == 2 ? BorderSide(width: 1, color: Theme.of(context).primaryColor) : BorderSide.none)
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        _index = 2;
                      });
                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      child: Text('视频', textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(50)),
                      padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(10)),
                      decoration: BoxDecoration(
                        border: Border(bottom: _index == 3 ? BorderSide(width: 1, color: Theme.of(context).primaryColor) : BorderSide.none)
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        _index = 3;
                      });
                    },
                  )
                ),
              ],
            ),
          ),

          IndexedStack(
            index: _index,
            children: <Widget>[
              SearchTabAll(),
              AnchorPage(),
              MatchPage(),
              SearchVideoList()
            ],
          )

        ],
      )
        
      
    );
  }
}