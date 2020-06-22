import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyVideo extends StatefulWidget {
  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo>  with SingleTickerProviderStateMixin{

  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
    _tabController.addListener((){
      print('监听:${_tabController.index}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
    // _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFAFAFA),
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
      ),
      body: Column(
        children: <Widget>[
          userBar(),
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: ScreenAdapter.setHeight(0),  color: Colors.black12), bottom: BorderSide(width: ScreenAdapter.setHeight(0), color: Colors.black12))
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor:Theme.of(context).primaryColor,
              labelColor:Color(0xff333333),
              unselectedLabelColor:Color(0xff333333),
              indicatorSize:TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(text: '视频(12)',),
                Tab(text: '直播回看',),
                Tab(text: '未发布',)
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
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                    child: VideoList(isUnpublished:false, isLiveAnchor:false),
                  )
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                    child: VideoList(isUnpublished:false, isLiveAnchor:false),
                  )
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                    child: VideoList(isUnpublished: true, isLiveAnchor:false),
                  )
                ],
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }

  Widget userBar(){
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top:ScreenAdapter.setWidth(40), right: ScreenAdapter.setWidth(40), left: ScreenAdapter.setWidth(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      ImageRoud('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1368451564,780267377&fm=111&gp=0.jpg', 60),
                      Container(
                        child: Text('磐石BedRock', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(40), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                        // width: ScreenAdapter.setWidth(80),
                        alignment: Alignment.centerRight,
                        child: Text('96', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white), textAlign: TextAlign.right,),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: panImage(96),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(160),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                          decoration: BoxDecoration(
                            border: Border.all(width:ScreenAdapter.setWidth(3), color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                          child: Text('发布视频', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Theme.of(context).primaryColor),),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/postVideo');
                  },
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text('127', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(60)),),
                      SizedBox(height: ScreenAdapter.setHeight(10),),
                      Text('播放', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text('83', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(60)),),
                      SizedBox(height: ScreenAdapter.setHeight(10),),
                      Text('赞', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text('304', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(60)),),
                      SizedBox(height: ScreenAdapter.setHeight(10),),
                      Text('收藏', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text('347', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(60)),),
                      SizedBox(height: ScreenAdapter.setHeight(10),),
                      Text('关注', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }

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

// 自定义Page页面
class Page extends StatefulWidget {
  final String tab;
 
  Page({Key key, this.tab}) : super(key: key);
 
  @override
  _PageState createState() => _PageState(tab: tab);
}
 
class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  String tab;
  _PageState({@required this.tab});
 
  int _count = 0;
 
  void add() {
    setState(() {
      ++_count;
    });
  }
 
  @override
  void didUpdateWidget(Page oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
 
  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Text("$tab"),
      ),
    );
  }
 
  @override
  bool get wantKeepAlive => true;
}