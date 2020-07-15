import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/HorseLantern.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/PluginWidget/swiper.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ClassWidget extends StatefulWidget {
  var data;
  ClassWidget(this.data);
  @override
  _ClassWidgetState createState() => _ClassWidgetState();
}

class _ClassWidgetState extends State<ClassWidget> {

  var api = Api();
  var _futureDataBuilderFuture;
  var page = 1;
  List<Map> videoData = [];

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _futureDataBuilderFuture = _getVideoData(widget.data['id']); // 获取直播数据
  }

   Future _getVideoData(vcid) async {
    Response response;
    response = await api.getData(context, 'getVideoList', formData: {'page':page, 'vcid':vcid});

    var v = json.decode(response.toString());

    videoData = (v['data']['info']['list'] as List).cast();
    print(v);
    if(v['data']['info']['list'].length == 0){
      Fluttertoast.showToast(msg: '没有数据啦~');
      page--;
    }

    

    setState(() {});

    return v;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: _futureDataBuilderFuture,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){


                return 
                SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: true,
                        header: WaterDropHeader(
                          complete:Text('刷新成功~', style: TextStyle(color: Color(0xffA4A4A4)),)
                        ),
                        footer: ClassicFooter(
                          loadStyle: LoadStyle.ShowWhenLoading,
                          canLoadingText:'松手即可加载更多……',
                          failedText:'456',
                          loadingText:'加载中……',
                          idleText:'加载完毕', 
                          noDataText:'已经到底了~', 
                          completeDuration: Duration(milliseconds: 500),
                        ),
                        onRefresh: () async {
                          await Future.delayed(Duration(milliseconds: 1000));
                          
                          page = 1;

                          _getVideoData(widget.data['id']);

                          if (mounted) setState(() {});
                          _refreshController.refreshCompleted();
                        
                        },
                        onLoading: () async {
                          await Future.delayed(Duration(milliseconds: 1000));

                          page++;

                          _getVideoData(widget.data['id']);

                          if (mounted) setState(() {});
                          _refreshController.loadComplete();
                        },
                        child: CustomScrollView(
                          slivers:<Widget>[
                            SliverToBoxAdapter(
                              child:VideoList(isUnpublished:false, isLiveAnchor:false, videoListData: videoData,) ,
                            )
                          ]
                        )
                      );
              }else{
                return Container();
              }
            },
          );
     
  }
}