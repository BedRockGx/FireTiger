import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';

// 赛事表格数据切换

class MatchBarProvider with ChangeNotifier {

  var api = Api();

  int _barIndex;                  // 赛事中所有的bar顶部筛选下标
  int _teamSideBarIndex;          // 球队榜侧边栏下标
  int _playerSideBarIndex;        // 球员榜侧边栏下标
  int _homeBarIndex;              // 父级大类index

  String _nowTime;                 // 比赛时间值
  int _leagueId;                   // 分类id
  
  List<Map> _mathData;             // 赛事中 足球/篮球 显示的数据
  String _season;

  MatchBarProvider(){
    
    var now = new DateTime.now();

    _barIndex = 1;
    _teamSideBarIndex = 0;
    _playerSideBarIndex = 0;
    _mathData = [];
    _nowTime = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
    _leagueId = 1;
    _homeBarIndex = 1;
    _season = '';
  }

  int get barIndex => _barIndex;
  int get teamSideBarIndex => _teamSideBarIndex;
  int get playerSideBarIndex => _playerSideBarIndex;
  List<Map> get mathData => _mathData;
  String get nowTime => _nowTime;
  int get leagueId => _leagueId;
  int get homeBarIndex => _homeBarIndex;
  String get season => _season;

  setBarIndex(i){
    this._barIndex = i;
    notifyListeners();
  }

  setHomeBarIndex(i){
    this._homeBarIndex = i;
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

  setNowTime(i){
    this._nowTime = i;
    notifyListeners();
  }

  setLeagueId(i){
    this._leagueId = i;
    notifyListeners();
  }

  getMathData(context, {page, size}) async {
    var uid = await PublicStorage.getHistoryList('uuid');
    print(uid);
    this._mathData = [];
    if(_barIndex == 1){
      
      var formData = {'date':_nowTime,  'page':page, 'size':size};
      if(uid.isNotEmpty){
        formData['uid'] = uid[0];
      }
      if(this._leagueId != 0){
        formData['leagueId'] = this._leagueId;
      }
      if(_homeBarIndex == 1){
        print('1111111');
        print(formData);
        api.getData(context, 'getFootBallMatch', formData: formData).then((val){
          var res = json.decode(val.toString());
          this._mathData = (res['data']['info']['list'] as List).cast();
          notifyListeners();
        });
      }else if(_homeBarIndex == 2){
        print('2222222');
        print(formData);
        api.getData(context, 'getBasketBallMatch', formData: formData).then((val){
          var res = json.decode(val.toString());
          this._mathData = (res['data']['info']['list']['list'] as List).cast();
          notifyListeners();
        });
      }
      
    }else if(_barIndex == 2){
      var formData = {'leagueId':_leagueId};
      if(_homeBarIndex == 1){
        api.getData(context, 'getFootTeamRank', formData: formData).then((val){
          var res = json.decode(val.toString());
          if(res['data']['info'].isEmpty){
            return;
          }
          this._mathData = (res['data']['info']['list'] as List).cast();
          notifyListeners();
        });
        
      }else if(_homeBarIndex == 2){
        api.getData(context, 'getBasketTeamRank', formData: formData).then((val){
          var res = json.decode(val.toString());
          if(res['data']['info'].isEmpty){
            return;
          }
          this._mathData = (res['data']['info']['list']['eastern'] as List).cast();
          notifyListeners();
        });
      }
    }else if(_barIndex == 4){
      var formFootBallData = {'leagueId':_leagueId};
      var formBasketBallData = {'leagueId':_leagueId, 'size':10};
      if(_homeBarIndex == 1){
        api.getData(context, 'getFootBallPlayerRank', formData: formFootBallData).then((val){
          var res = json.decode(val.toString());
          if(res['data']['info'].isEmpty){
            return;
          }
          this._mathData = (res['data']['info']['list'] as List).cast();
          notifyListeners();
        });
      }else if(_homeBarIndex == 2){
        api.getData(context, 'getBasketBallPlayerRank', formData: formBasketBallData).then((val){
          var res = json.decode(val.toString());
          if(res['data']['info'].isEmpty){
            return;
          }
          this._mathData = (res['data']['info']['list'] as List).cast();
          notifyListeners();
        });
      }
    }
    
   
    
  }

}