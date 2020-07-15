import 'dart:async';

import 'package:firetiger/component/Match/selectBarData/match/match.dart';
import 'package:firetiger/component/Match/selectBarData/match/match2.dart';
import 'package:firetiger/component/Match/selectBarData/playerList/playerlist.dart';
import 'package:firetiger/component/Match/selectBarData/rank/rank.dart';
import 'package:firetiger/component/Match/selectBarData/teamList/teamlist.dart';
import 'package:firetiger/http/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firetiger/provider/matchBarProvider.dart';

class SelectBarData extends StatefulWidget {
  var arguments;
  var type;                               // 0:足球, 1：篮球
  var selectProvider;
  SelectBarData(this.arguments, {@required this.type, this.selectProvider});
  @override
  _SelectBarDataState createState() => _SelectBarDataState(this.arguments, this.selectProvider);
}

class _SelectBarDataState extends State<SelectBarData> {

  var arguments;
  var selectProvider;
  _SelectBarDataState(this.arguments, this.selectProvider);
  var api = Api();



  @override
  void initState() {
    super.initState();
    // print(arguments);
    Timer(Duration(milliseconds: 200), ()=>getProviderData());
  }

  getProviderData(){
    selectProvider.setLeagueId(int.parse(arguments['leagueId']));

    selectProvider.getMathData(context, page:1, size:10);
    // selectProvider.homeBarIndex == 1 ? 
    // selectProvider.getMathData(context, 'getFootBallMatch', page:1, size:10) 
    // :
    // selectProvider.getMathData(context, 'getBasketBallMatch', page:1, size:10);
  }

  // _getFootBallData(){
  //   api.getData(context, 'getFootBallMatch', formData: {'date':'2020-07-08', 'leagueId':arguments['leagueId'], 'page':1, 'size':10}).then((val){
  //     print(val);
  //   });
  // }

  // _getBasketBallData(){
  //   api.getData(context, 'getBasketBallMatch', formData: {'date':'2020-07-08', 'leagueId':arguments['leagueId'], 'page':1, 'size':10}).then((val){
  //     print(val);
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    var selectProvider = Provider.of<MatchBarProvider>(context);
    return Container(
      child: panShowWidget(selectProvider.barIndex)
    );
  }
  

  Widget panShowWidget(i){
    
    switch (i) {
      case 1:
        return BarDataMatch2();
        break;
      case 2:
        return BarDataRank();
        break;
      case 3:
        return TeamList();
        break;
      case 4:
        return PlayerList();
        break;
      default:
    }
  }


}