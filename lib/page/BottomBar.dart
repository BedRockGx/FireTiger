import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

import './bottomBarPage/Home.dart';
import './bottomBarPage/expert.dart';
import './bottomBarPage/follow.dart';
import './bottomBarPage/liveBroadcast.dart';
import './bottomBarPage/Match.dart';

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {

  List<Widget> _widgetList = [];
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _widgetList = [HomePage(), Match(), LiveBroadcase(),  Expert(), Follow(),];
  }

  @override
  Widget build(BuildContext context) {
    // 初始化
    ScreenAdapter.init(context);
    return Scaffold(
      body: _widgetList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(IconData(0xe644, fontFamily: "myIcon")), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(IconData(0xe643, fontFamily: "myIcon")), title: Text('赛事')),
            BottomNavigationBarItem(icon: Icon(IconData(0xe647, fontFamily: "myIcon")), title: Text('直播')),
            BottomNavigationBarItem(icon: Icon(IconData(0xe648, fontFamily: "myIcon")), title: Text('专家')),
            BottomNavigationBarItem(icon: Icon(IconData(0xe63e, fontFamily: "myIcon")), title: Text('关注'))
          ],
        ),
    );
  }
}