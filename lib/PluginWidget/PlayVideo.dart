
import 'package:fijkplayer/fijkplayer.dart';
import 'package:firetiger/Bus/videoUi.dart';
import 'package:firetiger/PluginWidget/videoPage.dart';
import 'package:firetiger/component/videoTab/briefIntroduction.dart';
import 'package:firetiger/component/videoTab/comment.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayVideo extends StatefulWidget {
  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> with TickerProviderStateMixin{

  // final FijkPlayer player = FijkPlayer();
  

  PageController _pageController;
  TabController _tabController;

  var eventData = 0;

  final FijkPlayer player = FijkPlayer();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    _tabController.addListener((){
      print('监听:${_tabController.index}');
    });

    // 监听广播
    eventBus.on<ModifyUi>().listen((str){
      print('监听到广播的数据：${str}');
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
    await player.setDataSource("http://player.alicdn.com/video/aliyunmedia.mp4", autoPlay: true).catchError((e) {
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
                          Tab(text: '评论(34)',),
                        ],
                        onTap: (index) {
                          _pageController.jumpToPage(index);
                        },
                      ),
                    ),
                  ),
                  Container(
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
                        Text('21998',  style: TextStyle(color: Color(0xffFFCED1), fontSize:rpx * 20),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: FixTabBarView(
                pageController: _pageController,
                tabController: _tabController,
                children: <Widget>[
                  BriefIntroduction(),
                  Comment(2)
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  
}