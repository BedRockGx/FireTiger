import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/component/liveBroadcast/liveCurrencyWidget.dart';
import 'package:firetiger/customFlutter/no_shadow_tab_bar.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class LiveBroadcase extends StatefulWidget {
  @override
  _LiveBroadcaseState createState() => _LiveBroadcaseState();
}

class _LiveBroadcaseState extends State<LiveBroadcase> with TickerProviderStateMixin {

    TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this, initialIndex: 0);
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
                child: TabBar(
                  controller: _tabController,
                  indicatorWeight:1.0,
                  isScrollable: true,
                  indicatorColor:Theme.of(context).primaryColor,
                  indicatorPadding:EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                  labelStyle: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),
                  labelColor: Color(0xff333333),
                  unselectedLabelColor: Color(0xff555555),
                  unselectedLabelStyle: TextStyle(fontSize: ScreenAdapter.size(25)),
                  onTap: (index){
                    print('点击了哪一个：$index');
                  },
                  tabs: <Widget>[
                    Tab(child: Text('推荐')),
                    Tab(child: Text('足球')),
                    Tab(child: Text('篮球')),
                    Tab(child: Text('电竞')),
                    Tab(child: Text('高尔夫')),
                    Tab(child: Text('其他')),
                    Tab(child: Text('预约')),
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
          LiveCurrencyWidget(),
          Center(
            child: Text('2')
          ),
          Center(
            child: Text('3')
          ),
          Center(
            child: Text('4')
          ),
          Center(
            child: Text('5')
          ),
          Center(
            child: Text('6')
          ),
          Center(
            child: Text('7')
          ),
        ],
      ),
    );
  }
}