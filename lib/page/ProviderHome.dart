import 'package:firetiger/page/BottomBar.dart';
import 'package:firetiger/provider/UserInfoProvider.dart';
import 'package:firetiger/provider/bottomBarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// 调用状态管理容器

class ProviderHome extends StatefulWidget {
  @override
  _ProviderHomeState createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  @override
  Widget build(BuildContext context) {
    var userInfoProvider = Provider.of<UserInfoProvider>(context);
    var bottomBarProvider = Provider.of<BottomBarProvider>(context);

    // print(userInfoProvider.userInfo);

    return BottomBarPage(userInfoProvider:userInfoProvider, bottomBarProvider:bottomBarProvider);
  }
}