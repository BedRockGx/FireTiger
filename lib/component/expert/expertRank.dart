import 'package:firetiger/component/expert/ExpertRankDataWidget.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ExpertRank extends StatefulWidget {
  @override
  _ExpertRankState createState() => _ExpertRankState();
}

class _ExpertRankState extends State<ExpertRank> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener((){
      print('监听:${_tabController.index}');
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
          title: Text('专家排行', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xffFAFAFA),
          brightness: Brightness.light,
          elevation: 0,
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
              indicatorColor:Theme.of(context).primaryColor,
              labelColor:Color(0xff333333),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor:Color(0xff333333),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicatorSize:TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(text: '特邀专家',),
                Tab(text: '最高命中',),
                Tab(text: '最多连红',),
              ],
              onTap: (index) {
                
              },
            ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ExpertRankDataWidget(),
          ExpertRankDataWidget(),
          ExpertRankDataWidget()
        ],
      ),
    );
  }
}