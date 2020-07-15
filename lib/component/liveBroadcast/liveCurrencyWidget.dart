

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/imageDecoration.dart';
import 'package:firetiger/PluginWidget/liveSiwper.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/bottomBarProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class LiveCurrencyWidget extends StatefulWidget {
  // var arguments;
  // LiveCurrencyWidget(this.arguments);
  @override
  _LiveCurrencyWidgetState createState() => _LiveCurrencyWidgetState();
}

class _LiveCurrencyWidgetState extends State<LiveCurrencyWidget> {

  var api = Api();
  var bannerArr = [];
  List<Map> rankData = [];
  List<Map> liveList = [];
  var _futureLiveList;

  @override
  void initState() {
    super.initState();
    _futureLiveList = _getHotLiveList();
    // _getHotLiveList();
    _getBanner();         // 获取轮播图
    _getRank();
  }

  _getBanner(){
    api.getData(context, 'getBanner', formData: {
      'cid':'15'
    }).then((res){
      var response = json.decode(res.toString());
      setState(() {
        bannerArr = response['data']['info'];
      });
    });
  }

  _getRank(){
    api.getData(context, 'getRank', formData: {'type':2}).then((res){
      var response = json.decode(res.toString());
      var arr = response['data']['info'];
      var newArr = arr.take(3).toList();
      // 写入排名
      for(var i = 0; i < newArr.length; i++){
        newArr[i]['pm'] = i + 1;
      }
      setState(() {
        rankData = (newArr as List).cast();
      });
    });
  }

  Future _getHotLiveList() async {
    Response response;
    response = await api.getData(context, 'getRecommend');
    var v = json.decode(response.toString());
    
    setState(() {
      liveList = (v['data']['info'] as List).cast();
    });


    return v;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[

          bannerArr.length > 0 ? LiveSiwper(swiperArr: bannerArr,) : Container(),
          
          classWidget(),

          FutureBuilder(
            future: _futureLiveList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.data['data']['info'].length != 0){
                  return Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40),),
                        padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(30)),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB)))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                              child: Text('热门直播', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                            ),
                            HomeVideoList(videoData:liveList)
                          ],
                        ),
                      );
                }else{
                  return Container();
                }
                
              }else{
                return Center(
                        child: CircularProgressIndicator(),
                      );
              }
          }
        ),

          

          anchorRank(),

          Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40),),
            padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(30)),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                  child: Text('精彩推荐', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                ),
                HomeVideoList(videoData:liveList)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 类型选项
  Widget classWidget(){
    
    var bottomBarProvider = Provider.of<BottomBarProvider>(context);

    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/footballball.png'),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('足球赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){
                      // 修改tab
                      bottomBarProvider.setCurrentIndex(1);
                      bottomBarProvider.setMathTabIndex(0);         
                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/basketball.png', fit: BoxFit.cover,),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('蓝球赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){
                       // 修改Bttom/tab
                      bottomBarProvider.setCurrentIndex(1);
                      bottomBarProvider.setMathTabIndex(1);
                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/videoGame.png'),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('电竞赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){

                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/golf.png'),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('综合赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){
                      
                    },
                  )
                ),
              ],
            ),
          );
  }

  // 主播排行榜
  Widget anchorRank(){
    return Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40),),
            padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(30)),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB)))
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('主播排行', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                      ),
                      InkWell(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text('全部排行', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666)),),
                              Icon(Icons.chevron_right, size: ScreenAdapter.size(40), color: Color(0xffCACACA),)
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, '/allAnchorRank');
                        },
                      )
                    ],
                  ),
                ),
                
                Container(
                  child: Row(
                    children:rankData.map((item){
                      return Expanded(
                        flex: 1,
                        child: ImageDecoration({'image':'${item['avatar']}', 'borderWidth':5.0,  'title':'${item['user_nicename']}', 'subTitle':'${item['signature']}', 'pm':item['pm']})
                      );
                    }).toList()
                  ),
                )
              ],
            ),
          );
  }
}