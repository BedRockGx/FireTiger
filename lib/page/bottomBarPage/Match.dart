
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/Match/Basketball.dart';
import 'package:firetiger/component/Match/Electroniccompetition.dart';
import 'package:firetiger/component/Match/Football.dart';
import 'package:firetiger/component/Match/other.dart';
import 'package:firetiger/component/Match/subscribe.dart';
import 'package:firetiger/customFlutter/fix_tabbar_view.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/provider/bottomBarProvider.dart';
import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Match extends StatefulWidget {
  var bottomBarProvider;
  Match(this.bottomBarProvider);
  @override
  _MatchState createState() => _MatchState(this.bottomBarProvider);
}

class _MatchState extends State<Match> with SingleTickerProviderStateMixin{

    var bottomBarProvider;

  _MatchState(this.bottomBarProvider);

  TabController _tabController;
  PageController _pageController;
  var _userInfo;
  int mathTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: bottomBarProvider.matchTabIndex);
    _pageController = PageController();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var userInfoProvider = Provider.of<UserInfoProvider>(context);
    var bottomBarProvider = Provider.of<BottomBarProvider>(context);
    

    setState(() {
      _userInfo = userInfoProvider.userInfo;
    });

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 0,
        title: Row(
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
                      indicatorWeight:1.0,
                      isScrollable: true,
                      indicatorColor:Theme.of(context).primaryColor,
                      indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                      labelStyle: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),
                      indicator: BoxDecoration(
                        color: Color(0xffFF3641),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Color(0xff555555),
                      unselectedLabelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
                      tabs: <Widget>[
                        Tab(child: Text('足球')),
                        Tab(child: Text('篮球')),
                        Tab(child: Text('电竞')),
                        Tab(child: Text('其他')),
                        Tab(child: Text('预约')),
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
      body: TabBarView(
        controller: _tabController,
        // physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Football(),
          BasketBall(),
          Electroniccompetition(),
          Other(),
          Subscribe()
        ],
      ),
    );
  }
}