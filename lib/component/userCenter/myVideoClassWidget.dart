import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/HorseLantern.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/PluginWidget/swiper.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyVideoClassWidget extends StatefulWidget {
  var data;
  MyVideoClassWidget(this.data);
  @override
  _MyVideoClassWidgetState createState() => _MyVideoClassWidgetState();
}

class _MyVideoClassWidgetState extends State<MyVideoClassWidget> {

  var api = Api();
  var _futureDataBuilderFuture;
  var page = 1;
  List<Map> videoData = [];

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _futureDataBuilderFuture = _getVideoData(); // 获取直播数据
  }

   Future _getVideoData() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var token = await PublicStorage.getHistoryList('token');
    Response response;
    response = await api.getData(context, 'getMyVideo', formData: {'uid':uuid[0], 'token':token[0], 'p':page, 'type':widget.data['id']});

    var v = json.decode(response.toString());

    videoData = (v['data']['info']['list'] as List).cast();

    setState(() {});

    return v;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: _futureDataBuilderFuture,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(videoData.length == 0){ 
                  return Center(
                    child: Text('暂时没有数据'),
                  );
                }else{
                  return  VideoList(isUnpublished:false, isLiveAnchor:false, videoListData: videoData,);
                // SmartRefresher(
                //         controller: _refreshController,
                //         enablePullUp: true,
                //         header: WaterDropHeader(
                //           complete:Text('刷新成功~', style: TextStyle(color: Color(0xffA4A4A4)),)
                //         ),
                //         footer: ClassicFooter(
                //           loadStyle: LoadStyle.ShowWhenLoading,
                //           canLoadingText:'松手即可加载更多……',
                //           failedText:'456',
                //           loadingText:'加载中……',
                //           idleText:'加载完毕', 
                //           noDataText:'已经到底了~', 
                //           completeDuration: Duration(milliseconds: 500),
                //         ),
                //         onRefresh: () async {
                //           await Future.delayed(Duration(milliseconds: 1000));
                          
                //           page = 1;

                //           _getVideoData();

                //           if (mounted) setState(() {});
                //           _refreshController.refreshCompleted();
                        
                //         },
                //         onLoading: () async {
                //           await Future.delayed(Duration(milliseconds: 1000));

                //           page++;

                //           _getVideoData();

                //           if (mounted) setState(() {});
                //           _refreshController.loadComplete();
                //         },
                //         child:  
                //         CustomScrollView(
                //           slivers:<Widget>[
                //             SliverToBoxAdapter(
                //               child:VideoList(isUnpublished:false, isLiveAnchor:false, videoListData: videoData,) ,
                //             )
                //           ]
                //         )
                //       );
                }
              }else{
                return Center(
                child: CircularProgressIndicator(),
              );
              }
            },
          );
     
  }
}