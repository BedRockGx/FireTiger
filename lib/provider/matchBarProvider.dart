import 'package:flutter/material.dart';

class MatchBarProvider with ChangeNotifier {

  int _barIndex;                  // 赛事中所有的bar顶部筛选下标
  int _teamSideBarIndex;          // 球队榜侧边栏下标
  int _playerSideBarIndex;        // 球员榜侧边栏下标

  MatchBarProvider(){
    _barIndex = 1;
    _teamSideBarIndex = 0;
    _playerSideBarIndex = 0;
  }

  int get barIndex => _barIndex;
  int get teamSideBarIndex => _teamSideBarIndex;
  int get playerSideBarIndex => _playerSideBarIndex;

  setBarIndex(i){
    this._barIndex = i;
    notifyListeners();
  }

  setTeamSideBarIndex(i){
    this._teamSideBarIndex = i;
    notifyListeners();
  }

  setPlayerSideBarIndex(i){
    this._playerSideBarIndex = i;
    notifyListeners();
  }

}