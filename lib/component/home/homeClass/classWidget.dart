import 'dart:convert';

import 'package:firetiger/PluginWidget/Consultation.dart';
import 'package:firetiger/PluginWidget/HorseLantern.dart';
import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/PluginWidget/swiper.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ClassWidget extends StatefulWidget {
  var data;
  ClassWidget(this.data);
  @override
  _ClassWidgetState createState() => _ClassWidgetState();
}

class _ClassWidgetState extends State<ClassWidget> {

  var api = Api();

  List<Map> newsArticlesData = [];                      // 最新资讯数组
  var bannerArr;                                        // 轮播图数组
  var _page = 1;
  var _isLogin = false;
  var token;
  var uuid;
  List<Map> guessLikeList = [];                                    // 猜你喜欢

  @override
  void initState() {
    super.initState();
    getConsultation();          // 获取最新资讯
    _getUserIsLogin();  
  }



  getConsultation(){
    api.getData(context, 'getArticles', formData: {'page':_page, 'tid':widget.data['leagueId']}).then((res){
      var response = json.decode(res.toString());
      if(response['data']['info'].length == 0){
        return;
      }
      setState(() {
        newsArticlesData = (response['data']['info']['articles']['list'] as List).cast();
      });
    });
  }

  getGuessLike(){
    api.getData(context, 'getGuessLike').then((res){
      var response = json.decode(res.toString());
      setState(() {
        guessLikeList = (response['data']['info']['list'] as List).cast();
      });
    });
  }

  _getUserIsLogin() async {
    var tokens = await PublicStorage.getHistoryList('token');
    var uuid = await PublicStorage.getHistoryList('uuid');
    if(tokens.isNotEmpty && uuid.isNotEmpty){
      setState(() {
        _isLogin = true;
        token = tokens[0];
        uuid = uuid[0];
      });
    }
    getGuessLike();  // 猜你喜欢
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),        // 为避免外部容器无法上下滑动禁止当前页面滑动
        children: <Widget>[
          
          HorseLantern(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
            child: Column(
              children: <Widget>[
                
               widget.data['leagueId'] == '0' ? Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin:EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                        child: Text('最新资讯', style: TextStyle(fontSize: ScreenAdapter.size(30), color:Color(0xff333333), fontWeight: FontWeight.w600),),
                      ),

                      Consultation(newsArticlesData:newsArticlesData),
                    ],
                  ),
                ) :Container(),
                
                 guessLikeList.length!=0 ? Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                        child: Text('${widget.data['leagueId'] == '0' ?  '猜你喜欢' : '全部直播'}', style: TextStyle(fontSize: ScreenAdapter.size(30), color:Color(0xff333333), fontWeight: FontWeight.w600),),
                      ),
                      HomeVideoList(videoData: guessLikeList,)
                    ],
                  ),
                ) : Container()
              ],
            ),
          )
        ]));
  }
}