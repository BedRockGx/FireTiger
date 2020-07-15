import 'package:flutter/material.dart';

// 底部标签栏状态管理

class BottomBarProvider extends ChangeNotifier {
  var _currentIndex ;                     // BottomBar的下标
  var _matchTabIndex;                     // 赛事顶部tab下标

  BottomBarProvider(){
    _currentIndex = 2;
    _matchTabIndex = 0;
  }

  get currentIndex => _currentIndex;
  get matchTabIndex => _matchTabIndex;

  setCurrentIndex(i){
    this._currentIndex = i;
    notifyListeners();
  }

  setMathTabIndex(i){
    this._matchTabIndex = i;
    notifyListeners();
  }

}