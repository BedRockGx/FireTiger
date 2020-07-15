import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/provider/bottomBarProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rongcloud_im_plugin/rongcloud_im_plugin.dart';
import './bottomBarPage/Home.dart';
import './bottomBarPage/expert.dart';
import './bottomBarPage/follow.dart';
import './bottomBarPage/liveBroadcast.dart';
import './bottomBarPage/Match.dart';
import '../Bus/ImBus.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBarPage extends StatefulWidget {
  var userInfoProvider;
  var bottomBarProvider;
  BottomBarPage({@required this.userInfoProvider, @required this.bottomBarProvider});

  @override
  _BottomBarPageState createState() => _BottomBarPageState(userInfoProvider, bottomBarProvider);
}

class _BottomBarPageState extends State<BottomBarPage> {
  var userInfoProvider;
  var bottomBarProvider;
  _BottomBarPageState(
    this.userInfoProvider,
    this.bottomBarProvider
  );

  List<Widget> _widgetList = [];
  var api = Api();
  // var _currentIndex ;

  @override
  void initState() {
    super.initState();

    _widgetList = [
      LiveBroadcase(),  
      Match(bottomBarProvider), 
      HomePage(), 
      Expert(), 
      Follow(),];
    _getUserLoginInfo();            // 获取本地存储uuid，查询用户数据
    // _getUserIsAuthentication();     // 调用接口请求判断用户是否认证了
    RongIMClient.disconnect(false);
    
  }

  _initRongIM() async{

    var rtoken = await PublicStorage.getHistoryList('rtoken');

    var token = await PublicStorage.getHistoryList('token');

    RongIMClient.init('3argexb63swve');
    RongIMClient.connect(rtoken[0], (int code, String userId) {
        print('connect result ' + code.toString());
        EventBus.instance.commit(EventKeys.UpdateNotificationQuietStatus, {});
        if (code == 31004 || code == 12) {
          print('需要从新登录');
          // Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => new LoginPage()), (route) => route == null);
        } else if (code == 0) {
          print('----------------------链接成功----------------------');
          // Fluttertoast.showToast(msg: '用户id：$userId');
          print("用户链接 userId：" + userId);
        }
      }
    );
  }


  _getUserLoginInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    if(uuid.isNotEmpty){
      // print('调用状态管理，本地存储数据');
      userInfoProvider.setIsLogin(true);
      _getUserInfo(uuid);
      _initRongIM();
    }else{
      print('本地没有存储用户信息');
    }
    // userInfoProvider.setUserInfo(userInfo);
    
  }

   _getUserInfo(uuid){
    api.getData(context, 'getLoginUserInfo', formData: {'uid':uuid}).then((res){
      var response = json.decode(res.toString());
      userInfoProvider.setUserInfo(response['data']['info']);
    });
  }

  

  @override
  Widget build(BuildContext context) {

    var bottomBarProvider = Provider.of<BottomBarProvider>(context);

    var _currentIndex = bottomBarProvider.currentIndex;
    
    // 初始化
    ScreenAdapter.init(context);
    return Scaffold(
      body: _widgetList[_currentIndex],
       bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem<Image>(
            icon: Image.asset('assets/images/live_nor.png'),
            activeIcon: Image.asset('assets/images/live_lable.png'),
            title: '直播',
          ),
          TabItem<Image>(
              icon: Image.asset('assets/images/game.png'),
              activeIcon: Image.asset('assets/images/game_lable.png'),
              title: '赛事'),
          TabItem<Image>(
            icon: Image.asset('assets/images/home.png'),
            activeIcon: Image.asset('assets/images/home_lable.png'),
            title: '首页',
          ),
          TabItem<Image>(
            icon: Image.asset('assets/images/expert.png'),
            activeIcon: Image.asset('assets/images/expert_lable.png'),
            title: '专家',
          ),
          TabItem<Image>(
            icon: Image.asset('assets/images/like.png'),
            activeIcon: Image.asset('assets/images/like_lable.png'),
            title: '关注',
          ),
        ],
        backgroundColor: Colors.white,
        activeColor:Colors.black,
        color:Color(0xffA4A4A4),
        style:TabStyle.fixed,
        initialActiveIndex: _currentIndex,//optional, default as 0
        onTap: (int i) => bottomBarProvider.setCurrentIndex(i)
      )
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: (index){
        //     bottomBarProvider.setCurrentIndex(index);
        //   },
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(IconData(0xe644, fontFamily: "myIcon")), title: Text('')),
        //     BottomNavigationBarItem(icon: Icon(IconData(0xe643, fontFamily: "myIcon")), title: Text('')),
        //     BottomNavigationBarItem(icon: Icon(IconData(0xe647, fontFamily: "myIcon")), title: Text('')),
        //     BottomNavigationBarItem(icon: Icon(IconData(0xe648, fontFamily: "myIcon")), title: Text('')),
        //     BottomNavigationBarItem(icon: Icon(IconData(0xe63e, fontFamily: "myIcon")), title: Text(''))
        //   ],
        // ),
    );
  }
}