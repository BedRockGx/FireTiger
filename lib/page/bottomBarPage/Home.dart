
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
// import 'package:firetiger/customFlutter/tab_indicator.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../component/home/home.dart';
import '../../component/home/consultation.dart';
import '../../component/home/video.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  PageController _pageController;

  var _userInfo;

  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _pageController = PageController();
    
  }





  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var userInfoProvider = Provider.of<UserInfoProvider>(context);
    setState(() {
      _userInfo = userInfoProvider.userInfo;
    });

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 0,
          title: Container(
            // padding: EdgeInsets.fromLTRB(ScreenAdapter.setWidth(50), ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(50), 0),
            child: Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                      icon: _userInfo.isEmpty ? 
                      Icon(IconData(0xe684, fontFamily: 'myIcon'), color: Color(0xffA4A4A4),)
                      :
                      Container(
                        child:ImageRoud('${_userInfo['avatar']}', 100)
                      ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/userCenter');
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                    height: ScreenAdapter.setHeight(40),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Color(0xffFF3641),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      indicatorWeight:1.0,
                      indicatorColor:Theme.of(context).primaryColor,
                      indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(10)),
                      labelStyle: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),
                      labelColor: Colors.white,
                      unselectedLabelColor: Color(0xff555555),
                      unselectedLabelStyle: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold),
                      tabs: <Widget>[
                        Tab(child: Text('首页'),),
                        Tab(child: Text('资讯'),),
                        Tab(child: Text('视频'),),
                      ],
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                      },
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
          ),
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
      
    ),
    );
    
  }
}