import 'dart:convert';

import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LiveAnchorInfo extends StatefulWidget {
  var anchorInfo;
  var anchorID;
  var isAttention;
  LiveAnchorInfo({this.anchorInfo, this.anchorID, this.isAttention});
  @override
  _LiveAnchorInfoState createState() => _LiveAnchorInfoState(anchorInfo, anchorID, isAttention);
}

class _LiveAnchorInfoState extends State<LiveAnchorInfo> {
  var anchorInfo;
  var anchorID;
  var isAttention;
  _LiveAnchorInfoState(anchorInfo, anchorID, isAttention);

  var api = Api();
  List<Map> videoData = [];

  @override
  void initState() {
    anchorInfo = widget.anchorInfo;
    super.initState();
    _getVideoData();
  }

  _getVideoData(){
    api.getData(context, 'getUserLivelist', formData: {'touid':widget.anchorID, 'p':1}).then((val){
      var res = json.decode(val.toString());
      setState(() {
        
        videoData = (res['data']['info'] as List).cast();
      });
      print(videoData);
    });
  }



  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(40 * rpx),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom:30 * rpx),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right:15 * rpx),
                      child: ImageRoud('${anchorInfo['avatar']}', 50),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(350),
                                  child: Text('${anchorInfo['user_nicename']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx), overflow: TextOverflow.ellipsis,),
                                ),
                                SizedBox(width:5 * rpx,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                                  padding: EdgeInsets.fromLTRB(50 * rpx , 5 * rpx, 10 * rpx, 5 * rpx),
                                  alignment: Alignment.centerRight,
                                  child: Text('92', style: TextStyle(fontSize: 20 * rpx, color: Colors.white), textAlign: TextAlign.right,),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: panImage(92),
                                      fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child:Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 20 *rpx
                                  ),
                                  children:[
                                    TextSpan(
                                      text: '房间号：',
                                      style: TextStyle(
                                        color: Color(0xffA4A4A4)
                                      )
                                    ),
                                    TextSpan(
                                      text: '${anchorInfo['id']}'
                                    )
                                  ]
                                )
                              ),
                            ),
                            Container(
                              child:Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 20 *rpx
                                  ),
                                  children:[
                                    TextSpan(
                                      text: '开播时长',
                                      style: TextStyle(
                                        color: Color(0xffA4A4A4)
                                      )
                                    ),
                                    TextSpan(
                                      text: '12天21小时35分钟'
                                    )
                                  ]
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    isAttention != '0' ? 
                    Container()
                    :
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:40 * rpx, vertical:10 * rpx),
                      decoration: BoxDecoration(
                        border: Border.all(width:2 * rpx, color:Colors.red),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text('关注', style: TextStyle(color: Colors.red, fontSize: 25 * rpx),),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text.rich(
                        TextSpan(
                          children:[
                            WidgetSpan(
                              child: Text('主播公告：', style: TextStyle(fontSize: 25*rpx),)
                            ),
                            TextSpan(
                              text:'${anchorInfo['signature']}',
                              style: TextStyle(
                                fontSize: 25 * rpx,
                                color: Color(0xffA4A4A4)
                              ),
                            )
                          ]
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        GreyDivider(),
        Container(
          padding: EdgeInsets.all(40 * rpx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom:30 * rpx),
                child: Text('直播回放', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35 * rpx),),
              ),
              videoData.isEmpty ? Center(child: Text('暂无数据', style: TextStyle(fontSize: 30 * rpx),),)
              :
              VideoList(isUnpublished:false, isLiveAnchor:false, videoListData: videoData)
            ],
          ),
        )
      ],
    );
  }

    // 判断显示等级
  ImageProvider panImage(n){
    if(n<11){
      return AssetImage('assets/images/tag1.png');
    }else if(10<n && n<31){
      return AssetImage('assets/images/tag2.png');
    }else if(30<n && n<51){
      return AssetImage('assets/images/tag3.png');
    }else if(50<n && n<71){
      return AssetImage('assets/images/tag4.png');
    }else if(70<n && n<101){
      return AssetImage('assets/images/tag5.png');
    }
  }
}