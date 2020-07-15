import 'dart:convert';

import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyMessage extends StatefulWidget {
  @override
  _MyMessageState createState() => _MyMessageState();
}

class _MyMessageState extends State<MyMessage> with TickerProviderStateMixin{

  TabController _tabController;
  var api = Api();
  var _messagePage = 1;
  var _commentPage = 1;
  var _commentSize = 10;
  var uid,token;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _getHistoryData();
    
  }

    _getHistoryData() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    print(tokens);
    if(uuid.isEmpty && tokens.isEmpty){
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }else{
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getMessageData();
      _getCommentData();
    }
  }

  _getMessageData()  {
    api.getData(context, 'getUserNotice', formData: {'uid':uid, 'token':token, 'p':_messagePage}).then((val){
      var res = json.decode(val.toString());
    });
  }

  _getCommentData()  {
    api.getData(context, 'getCommentsList', formData: {'uid':uid, 'token':token, 'p':_commentPage, 'size':_commentSize}).then((val){
      var res = json.decode(val.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的消息', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35)),),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            IconData(0xe654, fontFamily: 'myIcon'),
            size: ScreenAdapter.size(60),
            color: Color(0xff333333),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize:TabBarIndicatorSize.label,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: <Widget>[
            Tab(
              child: Text('通知', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
            ),
            Tab(
              child: Container(
                width: ScreenAdapter.setWidth(120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('评论', style: TextStyle(color: Color(0xff333333), fontSize: ScreenAdapter.size(30)),),
                    Container(
                      width: ScreenAdapter.setWidth(50),
                      child: AspectRatio(
                        aspectRatio: 1/1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            alignment: Alignment.center,
                            color: Theme.of(context).primaryColor,
                            child:Text('23', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                          )
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Message(),
          Comment()
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
      child:ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenAdapter.setWidth(100),
                  margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Icon(IconData(0xe662, fontFamily: 'myIcon'), color: Colors.white, size: ScreenAdapter.size(80),),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('系统通知', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          Text('12:03', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: ScreenAdapter.setWidth(500),
                            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                            child: Text('氨基酸和登记卡好借口大健康的黄金卡卡萨丁卡拉结算单加', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25),),),
                          ),
                          // Container(
                          //   width: ScreenAdapter.setWidth(40),
                          //   child: AspectRatio(
                          //     aspectRatio: 1/1,
                          //     child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(20),
                          //       child: Container(
                          //         alignment: Alignment.center,
                          //         color: Theme.of(context).primaryColor,
                          //         child:Text('10', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                          //       )
                          //     ),
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenAdapter.setWidth(100),
                  margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Color(0xffFFC04E),
                        alignment: Alignment.center,
                        child: Icon(IconData(0xe663, fontFamily: 'myIcon'), color: Colors.white, size: ScreenAdapter.size(80),),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('活动通知', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                          Text('12:03', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: ScreenAdapter.setWidth(500),
                            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                            child: Text('氨基酸和登记卡好借口大健康的黄金卡卡萨丁卡拉结算单加', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25),),),
                          ),
                          Container(
                            width: ScreenAdapter.setWidth(40),
                            child: AspectRatio(
                              aspectRatio: 1/1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Theme.of(context).primaryColor,
                                  child:Text('10', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                                )
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ImageRoud('https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2034740944,4251903193&fm=26&gp=0.jpg', 60),
                    SizedBox(width: ScreenAdapter.setWidth(20),),
                    Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('磐石BedRock', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            Text('12:03', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(500),
                                margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                                child: Row(
                                  children: <Widget>[
                                    Text('评论了您的直播',  style: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25),)),
                                    SizedBox(width: ScreenAdapter.setWidth(10),),
                                    Container(
                                      width: ScreenAdapter.setWidth(300),
                                      child: Text('我查看拉萨路口的骄傲可视对讲阿喀琉斯', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color:Color(0xff333333), fontSize: ScreenAdapter.size(25),),),
                                    )
                                  ],
                                )
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(10),
                                child: AspectRatio(
                                  aspectRatio: 1/1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Theme.of(context).primaryColor,
                                      child:Text('', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                                    )
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenAdapter.setHeight(10),
                ),
                Container(
                  child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenAdapter.setWidth(120),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                      width: ScreenAdapter.setWidth(550),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5)
                      ),
                      child: Text('卡拉胶考虑的撒娇的卡拉斯科建档立卡手机打了卡就是打了卡时间段克拉斯记得拉三等奖爱丽丝的骄傲抗裂砂浆达拉斯空间的', maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                    )
                  ],
                ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ImageRoud('https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 60),
                    SizedBox(width: ScreenAdapter.setWidth(20),),
                    Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('毕加索的爱情', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            Text('12:03', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(500),
                                margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                                child: Row(
                                  children: <Widget>[
                                    Text('回复了您的评论',  style: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25),)),
                                    SizedBox(width: ScreenAdapter.setWidth(10),),
                                    Container(
                                      width: ScreenAdapter.setWidth(300),
                                      child: Text('我查看拉萨路口的骄傲可视对讲阿喀琉斯', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color:Color(0xff333333), fontSize: ScreenAdapter.size(25),),),
                                    )
                                    
                                  ],
                                )
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(10),
                                child: AspectRatio(
                                  aspectRatio: 1/1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Theme.of(context).primaryColor,
                                      child:Text('', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                                    )
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenAdapter.setHeight(10),
                ),
                Container(
                  child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenAdapter.setWidth(120),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                      width: ScreenAdapter.setWidth(550),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5)
                      ),
                      child: Text('卡拉胶考虑的撒娇的卡拉斯科建档立斯空间的', maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                    )
                  ],
                ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ImageRoud('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1368451564,780267377&fm=111&gp=0.jpg', 60),
                    SizedBox(width: ScreenAdapter.setWidth(20),),
                    Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('毕加索的爱情', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            Text('12:03', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(500),
                                margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                                child: Row(
                                  children: <Widget>[
                                    Text('回复了您的评论',  style: TextStyle(color:Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25),)),
                                    SizedBox(width: ScreenAdapter.setWidth(10),),
                                    Container(
                                      width: ScreenAdapter.setWidth(300),
                                      child: Text('我查看拉萨路口的骄傲可视对讲阿喀琉斯', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color:Color(0xff333333), fontSize: ScreenAdapter.size(25),),),
                                    )
                                    
                                  ],
                                )
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(10),
                                child: AspectRatio(
                                  aspectRatio: 1/1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Theme.of(context).primaryColor,
                                      child:Text('', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                                    )
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenAdapter.setHeight(10),
                ),
                // Container(
                //   child: Row(
                //   children: <Widget>[
                //     SizedBox(
                //       width: ScreenAdapter.setWidth(120),
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                //       width: ScreenAdapter.setWidth(550),
                //       decoration: BoxDecoration(
                //         color: Color(0xffF5F5F5)
                //       ),
                //       child: Text('卡拉胶考虑的撒娇的卡拉斯科建档立斯空间的', maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                //     )
                //   ],
                // ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}