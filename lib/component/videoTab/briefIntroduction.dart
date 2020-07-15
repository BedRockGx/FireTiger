import 'dart:convert';

import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class BriefIntroduction extends StatefulWidget {
  var data;
  BriefIntroduction(this.data);
  @override
  _BriefIntroductionState createState() => _BriefIntroductionState(this.data);
}

class _BriefIntroductionState extends State<BriefIntroduction> {
  var data;
  _BriefIntroductionState(this.data);

  var maxLines = 1;
  var api = Api();
  List<Map> videoData = [];

  @override
  void initState() {
    super.initState();
    _getRelatedVideo();
  }

  _getRelatedVideo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    print(uuid);
    api.getData(context, 'getRelatedVideo', formData: {'uid':uuid, 'page':1, 'size':10}).then((val){
      var res = json.decode(val.toString());
      setState(() {
        videoData = (res['data']['info']['list'] as List).cast();
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(rpx * 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${data['title']}', style: TextStyle(fontSize: 35 * rpx),),
              SizedBox(
                height: 10 * rpx,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(IconData(0xe681, fontFamily: 'myIcon'), size: 30 * rpx, color: Color(0xffA4A4A4)),
                    SizedBox(width: 10 * rpx,),
                    Text('${data['views']}', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                    SizedBox(width: 20 * rpx,),
                    Icon(IconData(0xe680, fontFamily: 'myIcon'), size: 30 * rpx, color: Color(0xffA4A4A4)),
                    SizedBox(width: 10 * rpx,),
                    Text('${data['comments']}', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                    SizedBox(width: 30 * rpx,),
                    Text('分类：${data['videoType']}', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),)
                  ],
                ),
              ),
              SizedBox(
                height: 10 * rpx,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('简介：${data['brief']}', overflow: TextOverflow.ellipsis, maxLines: maxLines, style: TextStyle(fontSize: 20 * rpx),),
                    ),
                    Container(
                      child: InkWell(
                        child:Icon( Icons.keyboard_arrow_down, color: Color(0xffA4A4A4),), 
                        
                        onTap: (){
                          if(maxLines == 1){
                            maxLines = 10;
                          }else{
                            maxLines = 1;
                          }
                          setState(() {
                            
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        GreyDivider(),
        Container(
          padding: EdgeInsets.all(rpx * 30),
          child: Row(
            children: <Widget>[
              ImageRoud('http://live.huohujj.net${data['avatar']}', 50),
              SizedBox(width: 20 * rpx,),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${data['user_nicename']}', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5 * rpx,),
                    Text('${data['signature']}', style: TextStyle(fontSize: 20 * rpx, color:Color(0xffA4A4A4)),),
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                    child: Text('关注', style: TextStyle(fontSize: 25 * rpx),),
                    textColor: Colors.white,
                    highlightColor:Theme.of(context).primaryColor,
                    color:Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                    onPressed:(){

                    }
                  ),
              )
            ],
          ),
        ),
        GreyDivider(),
        Container(
          padding: EdgeInsets.all(rpx * 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              videoData.length > 0 ? 
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('相关视频', style: TextStyle(fontSize:30 * rpx),),
                      margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                    ),
                    VideoList(isUnpublished:false, isLiveAnchor:false, videoListData: videoData,)
                  ],
                ))
                :
                Container(
                  child: Center(
                    child: Text('暂无数据'),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}