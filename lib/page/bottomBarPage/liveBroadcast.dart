import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/liveBroadcast/liveCurrencyWidget.dart';
import 'package:firetiger/component/liveBroadcast/liveListWidget.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveBroadcase extends StatefulWidget {
  @override
  _LiveBroadcaseState createState() => _LiveBroadcaseState();
}

class _LiveBroadcaseState extends State<LiveBroadcase> with TickerProviderStateMixin {

    TabController _tabController;
    var _userInfo;
    var api = Api();
    List<Map> _tabBar;
    var _futureBuilderFuture;

  @override
  void initState() {
    super.initState();
    // _tabController.addListener((){
    //   print('监听:${_tabController.index}');
    // });
    _tabController = TabController(length:3, vsync: this, initialIndex: 0);
    _futureBuilderFuture = _getLiveClassBar(); // 获取直播分类
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

    Future _getLiveClassBar() async {

      Response res;
      res = await api.getData(context, 'getLiveClass');

      var v = json.decode(res.toString());

      
      // _pageController = PageController();
      
      setState(() {
        _tabBar = (v['data']['info']['football'] as List).cast();
      });

      return v;
    }

  @override
  Widget build(BuildContext context) {

    var userInfoProvider = Provider.of<UserInfoProvider>(context);
    setState(() {
      _userInfo = userInfoProvider.userInfo;
    });

    return FutureBuilder(
      future: _futureBuilderFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xffFAFAFA),
                    brightness: Brightness.light,
                    title: Row(
                      children: <Widget>[
                        Container(
                          child: IconButton(
                              icon: _userInfo.isEmpty ? 
                              Icon(IconData(0xe684, fontFamily: 'myIcon'), color: Color(0xffA4A4A4),)
                              :
                              Container(
                                child:ImageRoud('${_userInfo['avatar']}', 100)
                              ),
                            onPressed: (){
                              Navigator.pushNamed(context, '/userCenter');
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                                  child: TabBar(
                                    controller: _tabController,
                                    indicatorWeight:1.0,
                                    isScrollable: true,
                                    indicatorColor:Theme.of(context).primaryColor,
                                    indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                                    labelStyle: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),
                                    labelColor: Color(0xff333333),
                                    unselectedLabelColor: Color(0xff555555),
                                    unselectedLabelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
                                    onTap: (index){
                                      // print('点击了哪一个：$index');
                                    },
                                    tabs: <Widget>[
                                      Tab(child: Text('推荐')),
                                      Tab(child: Text('足球')),
                                      Tab(child: Text('篮球')),
                                    ],
                                  )
                                ),
                        ),
                        Container(
                          width: ScreenAdapter.setWidth(60),
                          child: IconButton(
                              icon:Icon(IconData(0xe652, fontFamily: 'myIcon'), color: Color(0xffE5E5E5),),
                              onPressed: (){
                                Navigator.pushNamed(context, '/search');
                              },
                          ),
                        ),
                      ],
                    ),
                    
                    elevation: 0,
                  ),
                  body:TabBarView(
                        controller: _tabController,
                        // physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          LiveCurrencyWidget(),
                          LiveListWidget(1),
                          LiveListWidget(2),
                        ],
                      ),
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