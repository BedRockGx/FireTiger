import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/swiper.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

import 'homeClass/classWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  TabController _tabController;
  PageController _pageController;

  var _futureBuilderFuture;

  var api = Api();
  List<Map> _tabBar;
  var bannerArr = [];
  double _elevation = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();       
    getBanner();
    _futureBuilderFuture = _getLiveClassBar(); // 获取直播分类
  }

  getBanner(){
    api.getData(context, 'getBanner', formData: {
      'cid':'9'
    }).then((res){
      var response = json.decode(res.toString());
      setState(() {
        bannerArr = response['data']['info'];
      });
    });
  }

    Future _getLiveClassBar() async {

      Response res;
      res = await api.getData(context, 'getLiveClass');

      var v = json.decode(res.toString());

      v['data']['info']['football'].insert(0, {
          "leagueId": "0",
          "nameChsShort": "推荐",
          "logo": "http://qb1cwbwpw.bkt.clouddn.com/dejia.jpg",
          "sort": "0"
      });

      _tabController = TabController(length: v['data']['info']['football'].length, vsync: this, initialIndex: 0);
      _pageController = PageController();
      
      setState(() {
        _tabBar = (v['data']['info']['football'] as List).cast();
      });
      print(_tabBar);
      return v;
    }

  @override
  void dispose() {
    // _tabController.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  

   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureBuilderFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffFAFAFA),
            brightness: Brightness.light,
            elevation: _elevation,
              title: Container(
                height: ScreenAdapter.setHeight(50),
                child: TabBar(
                      controller: _tabController,
                      indicatorWeight: 3.0,
                      labelPadding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(15)),
                      isScrollable: true,
                      indicatorColor:Theme.of(context).primaryColor,
                      // indicator: Decoration.lerp(BoxDecoration(), BoxDecoration(), 1),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                      labelStyle:TextStyle(fontSize: ScreenAdapter.size(25)),
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Color(0xff555555),
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                      },
                      tabs: _tabBar.map((item) {
                        return Tab(
                          child: Text('${item['nameChsShort']}'),
                        );
                      }).toList()),
              )
            ),
              body:NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        // SliverToBoxAdapter(
                        //   child: Container(
                        //     height: ScreenAdapter.setHeight(50),
                        //      decoration: BoxDecoration(
                         
                        //   // borderRadius: BorderRadius.all(Radius.circular(10))
                        // ),
                        //         child: 
                        //       ),
                        // ),
                        SliverToBoxAdapter(
                          child: bannerArr.length == 0
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                    top: ScreenAdapter.setHeight(20),
                                      bottom: ScreenAdapter.setHeight(20)),
                                  constraints: BoxConstraints(
                                      maxHeight: ScreenAdapter.setHeight(270),
                                      maxWidth: double.infinity),
                                  child: SwiperPage(bannerArr: bannerArr),
                                ),
                        ),
                      ];
                    },
                    body: FixTabBarView(
                        pageController: _pageController,
                        tabController: _tabController,
                        children: _tabBar.map((item) {
                          return Listener(
                            onPointerDown: (PointerDownEvent pointerDownEvent) {
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
                            child: ClassWidget(item),
                          );
                        }).toList()),
                  )
              
              );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}