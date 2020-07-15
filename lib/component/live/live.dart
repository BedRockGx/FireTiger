
import 'dart:convert';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:firetiger/PluginWidget/liveVideoPage.dart';
import 'package:firetiger/component/live/liveAnchorInfo.dart';
import 'package:firetiger/component/live/liveContributionRank.dart';
import 'package:firetiger/component/live/liveExpert.dart';
import 'package:firetiger/component/live/liveGuessingCompetition.dart';
import 'package:firetiger/component/live/liveIm.dart';
import 'package:firetiger/component/live/liveOuts.dart';
import 'package:firetiger/component/videoTab/briefIntroduction.dart';
import 'package:firetiger/component/videoTab/comment.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rongcloud_im_plugin/rongcloud_im_plugin.dart';

import 'liveGuessingCompetition2.dart';

class LivePage extends StatefulWidget {
  var videoId;
  LivePage({this.videoId});
  @override
  _LivePageState createState() => _LivePageState(videoId);
}

class _LivePageState extends State<LivePage> with TickerProviderStateMixin{

  var videoId;
_LivePageState(this.videoId);
  // final FijkPlayer player = FijkPlayer();
  

  PageController _pageController;
  TabController _tabController;
  var uid, token;
  var api = Api();
  var stream;                                       // 流
  var anchorID;                                     // 主播id
  var liveInfo;                                     // 主播信息

  var liveType;
  var leagueId;
  var matchId;
  var isAttention = '0';                                  // 是否关注

  bool live;

  var eventData = 0;

  final FijkPlayer player = FijkPlayer();
  var anchorInfo;


  @override
  void initState() {
    super.initState();

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.light,
    // ));

    live = true;

    _tabController = TabController(length: 6, vsync: this);
    _pageController = PageController();
    // _tabController.addListener((){
    //   print('监听:${_tabController.index}');
    // });

    
    player.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
    player.setOption(FijkOption.playerCategory, "mediacodec-all-videos", 1);
    
    player.addListener(_fijkValueListener);
    
    _getHistoryUserInfo();                           // 获取直播间信息
    
    
    onJoinChatRoom();
    initChatRoom();
  } 

  onJoinChatRoom() {
    print('------------------------进入聊天室-----------------------');
    RongIMClient.joinChatRoom("332245", 10);
  }

  initChatRoom(){
    print('------------------------聊天室回调-----------------------');
    RongIMClient.onJoinChatRoom = (String targetId,int status) {
      print("房间名:"+targetId+" 状态:"+status.toString());
    };
  }

   _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    if(uuid.isNotEmpty && tokens.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
    }
    _getLiveInfo();
  }

  



  void _fijkValueListener(){
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    FijkValue value = player.value;
    /// true全屏 false 竖屏
    if(value.fullScreen==false){
      this.setState((){});
      // player.pause().then((value) => player.enterFullScreen());
    }
  }

  void startPlay(url) async {
    await player.setOption(FijkOption.hostCategory, "request-screen-on", 1);
    await player.setOption(FijkOption.hostCategory, "request-audio-focus", 1);
    await player.setDataSource("$url", autoPlay: true).catchError((e) {
      print("setDataSource error: $e");
    });
    this.setState((){});
  }


  _getLiveInfo(){
    var formData =  {'roomNum':videoId};
    if(uid!=null){
      formData['uid'] = uid;
      formData['token'] = token;
    }
    print(formData);
    api.getData(context, 'getLiveRoom', formData: formData).then((val){
      var res = json.decode(val.toString());
      if(res['data']['code'] == 1028){
        Fluttertoast.showToast(msg: res['data']['msg']);
      }
      var url = res['data']['info']['liveInfo']['pull'];
      startPlay(url);             // 输入直播源
      setState(() {
        anchorInfo = res['data']['info']['anchorInfo'];
        stream =  res['data']['info']['liveInfo']['stream'];
        anchorID = res['data']['info']['anchorId'];
        liveInfo = res['data']['info']['liveInfo'];
        liveType = res['data']['info']['liveType'];
        leagueId = res['data']['info']['leagueId'];
        matchId = res['data']['info']['matchId'];
        isAttention = res['data']['info']['isAttention'];
      });
      if(liveInfo['islive'] == '0'){
        setState(() {
          live = false;
        });
      }else{
        setState(() {
          live = true;
        });
      }
    });
  }

  




  @override
  void dispose() {
    _tabController.dispose();
    player.removeListener(_fijkValueListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    var userInfoProvider = Provider.of<UserInfoProvider>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: 60 * rpx,
            ),

            Container(
              width: MediaQuery.of(context).size.width,                                   // 为避免布局UI混乱采用自动获取
              constraints: BoxConstraints(
                maxHeight: 420 * rpx,
                minHeight: 420 * rpx
              ),
              child: live ? 
              VideoScreen(
                player: player,
              ):
              Container(
                color: Color(0xff333333),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom:100*rpx),
                      child: IconButton(
                        icon: Icon(Icons.chevron_left, size: 60 * rpx, color: Colors.white,),
                        onPressed: ()=>Navigator.pop(context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80 * rpx,
                          margin: EdgeInsets.only(right:20 * rpx),
                          child: Image.asset('assets/images/award.png', fit: BoxFit.contain,),
                        ),
                        Column(
                          children: <Widget>[
                            Text('本场比赛已经结束啦', style: TextStyle(color: Colors.white, fontSize: 30 * rpx),),
                            Text('请继续关注其它比赛', style: TextStyle(color: Colors.white, fontSize:  30 * rpx),)
                          ],
                        )
                      ],
                    )
                  ],
                )
              )
            ),


            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Color(0xffE4E4E4)))
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      isScrollable:true,
                      indicatorColor:Theme.of(context).primaryColor,
                      labelColor:Color(0xff333333),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor:Color(0xff333333),
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                      indicatorSize:TabBarIndicatorSize.label,
                      tabs: <Widget>[
                        Tab(text: '聊天',),
                        Tab(text: '赛况',),
                        Tab(text: '助威',),
                        Tab(text: '贡献榜',),
                        Tab(text: '专家',),
                        Tab(text: '主播',),
                      ],
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                      },
                    ),
                  ),
                  userInfoProvider.islogin ? 
                  isAttention != '0' ? 
                  Container(
                      alignment: Alignment.center,
                      color: Color(0xffF5F5F5),
                      constraints: BoxConstraints(
                        maxHeight: 90 * rpx,
                        maxWidth:180 * rpx
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(20),
                                child: Image.asset('assets/images/over.png', fit:BoxFit.cover),
                              ),
                              SizedBox(
                                width: ScreenAdapter.setWidth(10),
                              ),
                              Text('已关注', style: TextStyle(color: Colors.black, fontSize: rpx * 25),),
                            ],
                          ),
                          SizedBox(height:10 * rpx),
                          Text('${anchorInfo != null ? anchorInfo['fans'] : 0}',  style: TextStyle(color: Color(0xffFF3641), fontSize:rpx * 20),)
                        ],
                      ),
                    )
                  :
                  InkWell(
                    child: Container(
                        alignment: Alignment.center,
                        color: Color(0xffFF3641),
                        constraints: BoxConstraints(
                          maxHeight: 90 * rpx,
                          maxWidth:150 * rpx
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('+关注', style: TextStyle(color: Colors.white, fontSize: rpx * 25),),
                            SizedBox(height:10 * rpx),
                            Text('${anchorInfo != null ? anchorInfo['fans'] : 0}',  style: TextStyle(color: Color(0xffFFCED1), fontSize:rpx * 20),)
                          ],
                        ),
                      ),
                    onTap: (){
                      api.postData(context, 'followAdd', formData: {'uid':uid, 'token':token, 'toUid':anchorInfo['id']}).then((val){
                        var res = json.decode(val.toString());
                        print(res);
                        // Fluttertoast.showToast(msg: '${res['data']['msg']}, 关注有延迟，请稍后刷新查看');
                      });
                    },
                  )
                  
                  :
                  Container()
                ],
              )
              
            ),
            Expanded(
              child: FixTabBarView(
                pageController: _pageController,
                tabController: _tabController,
                children: <Widget>[
                  LiveIM(stream, anchorID),
                  LiveOuts(),
                  LiveGuessingCompetition2(liveType, leagueId, matchId),
                  LiveContriButionRank(anchorID),
                  LiveExpert(),
                  LiveAnchorInfo(anchorInfo:anchorInfo, anchorID:anchorID, isAttention:isAttention)
                ],
              ),
            ),
          ],
        ),
      )
    )
 
    );
    
  }
  
}