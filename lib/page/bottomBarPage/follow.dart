import 'package:firetiger/component/follow/followAnchor.dart';
import 'package:firetiger/component/follow/followExpert.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> with TickerProviderStateMixin{

  TabController _tabController;

    @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
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
        title: Text('关注', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 0,
        bottom: TabBar(
              controller: _tabController,
              indicatorColor:Theme.of(context).primaryColor,
              labelColor:Color(0xff333333),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor:Color(0xff333333),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicatorSize:TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(text: '关注的主播',),
                Tab(text: '关注的专家',),
              ],
              onTap: (index) {
                
              },
            ),
      ),
      body:TabBarView(
        controller: _tabController,
        children: <Widget>[
          FollowAnchor(),
          FollowExpert()
        ],
      )
    );
  }
}