
import 'package:fijkplayer/fijkplayer.dart';
import 'package:firetiger/Bus/videoUi.dart';
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
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> with TickerProviderStateMixin{

  // final FijkPlayer player = FijkPlayer();
  

  PageController _pageController;
  TabController _tabController;

  bool live;

  var eventData = 0;

  final FijkPlayer player = FijkPlayer();


  @override
  void initState() {
    super.initState();

    live = false;

    _tabController = TabController(length: 6, vsync: this);
    _pageController = PageController();
    _tabController.addListener((){
      print('监听:${_tabController.index}');
    });

    
    player.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
    player.setOption(FijkOption.playerCategory, "mediacodec-all-videos", 1);
    startPlay();
    player.addListener(_fijkValueListener);
  } 


  void _fijkValueListener(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    FijkValue value = player.value;
    /// true全屏 false 竖屏
    if(value.fullScreen==false){
      print('屏幕发生了改变！！！');
      this.setState((){});
      // player.pause().then((value) => player.enterFullScreen());
    }
    
  }

  void startPlay() async {
    await player.setOption(FijkOption.hostCategory, "request-screen-on", 1);
    await player.setOption(FijkOption.hostCategory, "request-audio-focus", 1);
    await player.setDataSource("http://player.alicdn.com/video/aliyunmedia.mp5", autoPlay: true).catchError((e) {
      print("setDataSource error: $e");
    });
    this.setState((){});
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

    return Scaffold(
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
              child:TabBar(
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
                        Tab(text: '竞猜',),
                        Tab(text: '贡献榜',),
                        Tab(text: '专家',),
                        Tab(text: '主播',),
                      ],
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                      },
                    ),
            ),
            Expanded(
              child: FixTabBarView(
                pageController: _pageController,
                tabController: _tabController,
                children: <Widget>[
                  LiveIM(),
                  LiveOuts(),
                  LiveGuessingCompetition(live: live,),
                  LiveContriButionRank(),
                  LiveExpert(),
                  LiveAnchorInfo()
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  
}