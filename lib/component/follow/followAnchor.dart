import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowAnchor extends StatefulWidget {
  @override
  _FollowAnchorState createState() => _FollowAnchorState();
}

class _FollowAnchorState extends State<FollowAnchor> {

  List<Map> data = [
    {'img':'https://dss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3416639201,1190609549&fm=58&s=73760872F56D25012E0BDFBB0300502D&bpow=121&bpoh=75', 'dj':98, 'name':'LPL夏季赛', 'subname':'RNG · EDG LPL夏季赛总决赛/Bo5卡洛斯大家好大家看好'},
    {'img':'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2722854742,2630717572&fm=111&gp=0.jpg', 'dj':98, 'name':'小主播', 'subname':'新来的主播多多关注'},
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'dj':98, 'name':'一条大团团QAQ', 'subname':'咋回事啊。我的天哪'},
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=443801258,2722780474&fm=111&gp=0.jpg', 'dj':98, 'name':'❤香', 'subname':'对没错，我就要波波(●´З｀●)'},
  ];

  var api = Api();
  var uid,token;
  List<Map> notliveIng = [];
  List<Map> liveIng = [];
  var bol = false;                    // 防止登录成功后返回到此页面重复调用请求数据接口

  List<Map> liveList = [];
  var _futureLiveList;

  @override
  void initState() {
    super.initState();
    _futureLiveList = _getHotLiveList();
    _getHistoryUserInfo();
  }

  _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    if(uuid.isNotEmpty && tokens.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getFollowData();
    }
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

  _getFollowData(){
    api.getData(context, 'getNewFollow', formData: {'uid':uid, 'page':1}).then((val){
      var res = json.decode(val.toString());
      print(res);
      setState(() {
        liveIng = (res['data']['info']['liveIng'] as List).cast();
        notliveIng = (res['data']['info']['notliveIng'] as List).cast();
        bol = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var userInfoProvider = Provider.of<UserInfoProvider>(context);
    
    return Scaffold(
      body: Container(
        child:ListView(
          children: <Widget>[
            panShow(userInfoProvider)
          ],
        )
      ),
    );
  }

  panShow(userInfoProvider){
    if(userInfoProvider.islogin){
      if(userInfoProvider.islogin && !bol){
        _getHistoryUserInfo();
      }
      return Container(
        child: Column(
          children: <Widget>[
            liveIng.isNotEmpty || notliveIng.isNotEmpty ? followData() : noFollowData(),
            recommenWidget()
          ],
        ),
      );
    }else{
      return Container(
        child: Column(
          children: <Widget>[
            noLogin(),
            recommenWidget()
          ],
        ),
      );
    }
  }

  // 未登录
  Widget noLogin(){
    return Container(
              color: Colors.white,
              width: ScreenAdapter.setWidth(750),
              height: ScreenAdapter.setHeight(400),
              padding: EdgeInsets.only(top:ScreenAdapter.setHeight(100)),
              child: Column(
                // crossAxisAlignment: Cro,
                children: <Widget>[
                  Text('暂未登录', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                  SizedBox(height: ScreenAdapter.setHeight(10),),
                  Text('立即登录查看更多精彩内容', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                  SizedBox(height: ScreenAdapter.setHeight(20),),
                  Container(
                    width: ScreenAdapter.setWidth(220),
                    height: ScreenAdapter.setHeight(50),
                    margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                    child: RaisedButton(
                      child: Text('登录', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                      textColor: Colors.white,
                      highlightColor:Theme.of(context).primaryColor,
                      color:Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                      onPressed:(){
                        Navigator.pushNamed(context, '/login').then((_){
                          _getHistoryUserInfo();
                        });
                      }
                    ),
                  )
                ],
              ),
            );
  }

  // 已登录无关注
  Widget noFollowData(){
    return Container(
              color: Colors.white,
              width: ScreenAdapter.setWidth(750),
              height: ScreenAdapter.setHeight(400),
              padding: EdgeInsets.only(top:ScreenAdapter.setHeight(100)),
              child: Column(
                // crossAxisAlignment: Cro,
                children: <Widget>[
                  Container(
                    width: ScreenAdapter.setWidth(120),
                    child: Image.asset('assets/images/nofollow.png', fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    height: ScreenAdapter.setHeight(10),
                  ),
                  Text('你暂未关注任何主播', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                ],
              ),
            );
  }

  // 已登录已关注
  Widget followData(){
    return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(50),
                              margin: EdgeInsets.only(right:ScreenAdapter.setHeight(10)),
                              child: Image.asset('assets/images/live.png', fit: BoxFit.cover,),
                            ),
                            Text('直播中', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: ScreenAdapter.setWidth(10),
                            ),
                            Text('${liveIng.length}', style: TextStyle(fontSize: ScreenAdapter.size(35), color: Color(0xffA4A4A4)),)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      // HomeVideoList()
                    ],
                  ),
                ),
                Column(
                  children:liveIng.map((item){
                    return Container(
                      padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                      margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                      decoration: BoxDecoration(
                        color: Color(0xffF6FAFF),
                        border: Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffE7F4FF)),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                            child: ImageRoud('${item['avatar']}', 50),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(300),
                                      alignment:Alignment.centerLeft, 
                                      child: Text('${item['signature']}', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                      padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                                      // width: ScreenAdapter.setWidth(80),
                                      alignment: Alignment.centerRight,
                                      child: Text('${item['level_anchor']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: panImage(int.parse(item['level_anchor'])),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: ScreenAdapter.setHeight(10),
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(450),
                                alignment: Alignment.centerLeft,
                                child: Text('${item['signature']}',overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList()
                ),
                GreyDivider(),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(50),
                              margin: EdgeInsets.only(right:ScreenAdapter.setHeight(10)),
                              child: Image.asset('assets/images/time.png', fit: BoxFit.cover,),
                            ),
                            Text('未开播', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: ScreenAdapter.setWidth(10),
                            ),
                            Text('${notliveIng.length}', style: TextStyle(fontSize: ScreenAdapter.size(35), color: Color(0xffA4A4A4)),)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      Column(
                        children:notliveIng.map((item){
                          return Container(
                                  padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF6FAFF),
                                    border: Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffE7F4FF)),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                        child: ImageRoud('${item['avatar']}', 50),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: ScreenAdapter.setWidth(300),
                                                  alignment:Alignment.centerLeft, 
                                                  child: Text('${item['signature']}', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                                  padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                                                  // width: ScreenAdapter.setWidth(80),
                                                  alignment: Alignment.centerRight,
                                                  child: Text('${item['level_anchor']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: panImage(int.parse(item['level_anchor'])),
                                                      fit: BoxFit.cover
                                                    )
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenAdapter.setHeight(10),
                                          ),
                                          Container(
                                            width: ScreenAdapter.setWidth(450),
                                            alignment: Alignment.centerLeft,
                                            child: Text('${item['signature']}',overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                        }).toList()
                      )
                    ],
                  ),
                )
              ],
            );
  }

  // 推荐
  Widget recommenWidget(){
    return FutureBuilder(
            future: _futureLiveList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.data['data']['info'].length != 0){
                  return Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(50),
                                      margin: EdgeInsets.only(right:ScreenAdapter.setHeight(10)),
                                      child: Image.asset('assets/images/live.png', fit: BoxFit.cover,),
                                    ),
                                    Text('热门推荐', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: ScreenAdapter.setHeight(20),
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