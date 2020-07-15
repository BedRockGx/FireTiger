import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/component/home/videoClass/classWidget.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  TabController _tabController;
  double _elevation = 0;
  var _futureClassBuilderFuture;
  var api = Api();
  List<Map> _tabBar = [];
  var data;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
     
    _futureClassBuilderFuture = _getVideoClass(); // 获取直播分类
    

  }

  Future _getVideoClass() async {
    Response response;
    response = await api.getData(context, 'getVideoClass');

    var v = json.decode(response.toString());

    _tabController = TabController(length: v['data']['info'].length, vsync: this, initialIndex: 0);

    setState(() {
      _tabBar = (v['data']['info'] as List).cast();
    });

    return v;
  }

 

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
              future: _futureClassBuilderFuture,
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0xffFAFAFA),
                      elevation: _elevation,
                      title: Container(
                            child: Stack( 
                                    children: <Widget>[
                                      TabBar(
                                        controller: _tabController,
                                        indicatorWeight:1.0,
                                        isScrollable: true,
                                        indicator:Decoration.lerp(BoxDecoration(), BoxDecoration(), 1),
                                        indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                                        labelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
                                        labelColor: Theme.of(context).primaryColor,
                                        unselectedLabelColor: Color(0xff555555),
                                        tabs: 
                                        _tabBar.map((item){
                                          return Tab(child: Text('${item['name']}'),);
                                        }).toList()
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
                    ),
                    body: TabBarView(
                            controller: _tabController,
                            children: _tabBar.map((item){
                              return Listener(
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
                                child: ClassWidget(item)
                                
                              );
                            }).toList()
                          ),
                  );
                }else{
                  return Container();
                }
              }
            );
        
      
  }
}