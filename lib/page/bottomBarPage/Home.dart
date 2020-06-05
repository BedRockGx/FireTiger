import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
// import 'package:firetiger/customFlutter/tab_indicator.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

import '../../component/home/home.dart';
import '../../component/home/consultation.dart';
import '../../component/home/video.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
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
        // ImageRoud('https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3374416169,262924133&fm=111&gp=0.jpg',50),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        title: Row(
          children: <Widget>[
            Container(
              // width: ScreenAdapter.setWidth(100),
              child: IconButton(
                  icon: Container(
                    // padding: EdgeInsets.only(left:ScreenAdapter.setWidth(30)),
                    child:ImageRoud('https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 100)
                  ),
                onPressed: (){
                  Navigator.pushNamed(context, '/userCenter');
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: NoShadowTabBar(
                  controller: _tabController,
                  indicatorWeight:1.0,
                  indicatorColor:Theme.of(context).primaryColor,
                  indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                  labelStyle: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),
                  labelColor: Color(0xff333333),
                  unselectedLabelColor: Color(0xff555555),
                  unselectedLabelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
                  tabs: <Widget>[
                    Tab(child: Text('首页'),),
                    Tab(child: Text('资讯'),),
                    Tab(child: Text('视频'),),
                  ],
                )
              ),
            ),
            Container(
              width: ScreenAdapter.setWidth(60),
              child: IconButton(
                  icon:Icon(IconData(0xe652, fontFamily: 'myIcon'), color: Color(0xffE5E5E5),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/search');
                  },
              ),
            ),
          ],
        ),
        
        elevation: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        // physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Home(),
          ConsulationPage(),
          VideoPage()
        ],
      ),
    );
  }
}