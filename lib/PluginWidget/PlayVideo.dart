
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:firetiger/PluginWidget/videoPage.dart';
import 'package:firetiger/component/videoTab/briefIntroduction.dart';
import 'package:firetiger/component/videoTab/comment.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PlayVideo extends StatefulWidget {

  var videoId;
  PlayVideo({@required this.videoId});

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> with TickerProviderStateMixin{

  var api = Api();

  PageController _pageController;
  TabController _tabController;

  var _futureBuilderVideoData;

  double _height = 420;

  final FijkPlayer player = FijkPlayer();
  var commentsNum = 0;
  var _page = 1;
  var _pagesize = 20;
  var uid,token;
  var isattent,fans, id;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    
    player.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
    player.setOption(FijkOption.playerCategory, "mediacodec-all-videos", 1);

    

    
    player.addListener(_fijkValueListener);

    _getCommentsNum();
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
    }
    _futureBuilderVideoData = _getVideoData();
  }
  Future _getVideoData() async {
    Response response;
    var formData =  {'videoid':widget.videoId};
    if(uid!=null){
      formData['uid'] = uid;
    }
    response = await api.getData(context, 'getVideoDetails', formData:formData);

    var v = json.decode(response.toString());
    startPlay(v['data']['info'][0]['href']);

    setState(() {
      isattent = v['data']['info'][0]['isattent'];
      fans = v['data']['info'][0]['fans'];
      id = v['data']['info'][0]['id'];
    });

    return v['data']['info'][0];
  }


  void _fijkValueListener(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    FijkValue value = player.value;

    print('视频高度：${value.size.height}');
    print('视频宽度：${value.size.width}');

    if(value.size.width < 550 && value.size.height > 900){
      setState(() {
        _height = 700;
      });
    }

    /// true全屏 false 竖屏
    if(value.fullScreen==false){
      print('屏幕发生了改变！！！');
      this.setState((){});
      // player.pause().then((value) => player.enterFullScreen());
    }
    
  }

  void startPlay(videoUrl) async {
    await player.setOption(FijkOption.hostCategory, "request-screen-on", 1);
    await player.setOption(FijkOption.hostCategory, "request-audio-focus", 1);
    await player.setDataSource("$videoUrl", autoPlay: true).catchError((e) {
      print('视频出现问题！！！！！！！！！！！');
      print("setDataSource error: $e");
    });
    this.setState((){});
  }

  _getCommentsNum(){
    api.getData(context, 'getLiveComments', formData: {'topic':widget.videoId,  'page':_page, 'pagesize':_pagesize}).then((val){
      var res = json.decode(val.toString());
      print(res);
      setState(() {
        commentsNum = res['data']['info'].length;
      });
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
        child:Scaffold(
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
                maxHeight: _height * rpx,
                minHeight: _height * rpx
              ),
              child: VideoScreen(
                player: player,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Color(0xffE4E4E4)))
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor:Theme.of(context).primaryColor,
                        labelColor:Color(0xff333333),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor:Color(0xff333333),
                        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                        indicatorSize:TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Tab(text: '简介',),
                          Tab(text: '评论($commentsNum)',),
                        ],
                        onTap: (index) {
                          _pageController.jumpToPage(index);
                        },
                      ),
                    ),
                  ),
                  userInfoProvider.islogin ? 
                  isattent != '0' ? 
                  Container(
                      alignment: Alignment.center,
                      color: Color(0xffF5F5F5),
                      constraints: BoxConstraints(
                        maxHeight: 90 * rpx,
                        maxWidth:200 * rpx
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
                              Text('已关注$isattent', style: TextStyle(color: Colors.black, fontSize: rpx * 25),),
                            ],
                          ),
                          SizedBox(height:10 * rpx),
                          Text('${fans != null ? fans : 0}',  style: TextStyle(color: Color(0xffFF3641), fontSize:rpx * 20),)
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
                                      maxWidth:200 * rpx
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('+关注', style: TextStyle(color: Colors.white, fontSize: rpx * 25),),
                                        SizedBox(height:10 * rpx),
                                        Text('${fans != null ? fans : 0}',  style: TextStyle(color: Color(0xffFFCED1), fontSize:rpx * 20),)
                                      ],
                                    ),
                                  ),
                                onTap: (){
                                  api.postData(context, 'followAdd', formData: {'uid':uid, 'token':token, 'toUid':id}).then((val){
                                    var res = json.decode(val.toString());
                                    print(res);
                                    // Fluttertoast.showToast(msg: '${res['data']['msg']}, 关注有延迟，请稍后刷新查看');
                                  });
                                },
                              )
                      
                    
                  
                  :
                  Container()
                ],
              ),
            ),
            FutureBuilder(
              future: _futureBuilderVideoData,
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Expanded(
                    child: FixTabBarView(
                      pageController: _pageController,
                      tabController: _tabController,
                      children: <Widget>[
                        BriefIntroduction(snapshot.data),
                        Comment(1, videoId: widget.videoId,)
                      ],
                    ),
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            ),
            
          ],
        ),
      )
    )
  
    );
    
  }
  
}