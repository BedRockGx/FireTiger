import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BarDataMatch2 extends StatefulWidget {
  @override
  _BarDataMatch2State createState() => _BarDataMatch2State();
}

class _BarDataMatch2State extends State<BarDataMatch2> {

  var api = Api();
  var uid, token;

  @override
  void initState() {
    super.initState();
    _getHistoryUserInfo();
  }

  _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');

    if(uuid.isNotEmpty && tokens.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var selectProvider = Provider.of<MatchBarProvider>(context);
    if(selectProvider.mathData.isEmpty){
      return Center(
        child: Text('暂无数据', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
      );
    }else{
      // print(selectProvider.mathData);
      if(selectProvider.homeBarIndex == 1){
        return ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Container(
                  color: Color(0xffF5F5F5),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children:selectProvider.mathData.map((item){
                            return Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                          padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30), vertical: ScreenAdapter.setHeight(5)),
                                          decoration: BoxDecoration(
                                            color: transformColor(item['color']),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Text('${item['leagueChsShort'] != null ? item['leagueChsShort'] : ''}', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                                        ),
                                        Container(
                                          child: Text('${item['time'] != null ? panTime(item['time']) :''}', style: TextStyle(fontSize: ScreenAdapter.size(33), fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text('${item['roundCn'] != null ? item['roundCn'] : ''}${item['season'] !=null ? item['season'] : ''}', style: TextStyle(color: Color(0xff999999), fontSize: ScreenAdapter.size(20)),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: ScreenAdapter.setWidth(50),
                                                        child: item['homeLogo'] != null ? Image.network('${item['homeLogo']}?win007=sell', fit: BoxFit.cover,) : Container(),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                                                        child: Text('${item['homeChs'] != null ? item['homeChs'] : ''}', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: ScreenAdapter.setWidth(50),
                                                child: Image.asset('assets/images/vs.png', fit: BoxFit.cover,),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: ScreenAdapter.setWidth(50),
                                                        child: item['awayLogo'] != null ? Image.network('${item['awayLogo']}?win007=sell', fit: BoxFit.cover,) : Container(),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                                                        child: Text('${item['awayChs'] != null ? item['awayChs'] : ''}', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        item['state'] !=null ?  panStatus(int.parse(item['state'])) : Container()
                                      ],
                                    ),
                                  ),
                                  item['state'] !=null ?  panSowBtn(item) : Container()
                                ],
                              ),
                            );
                          }).toList()
                        ),
                      )
                    ],
                  ),
                ),
              );
      }else{
        return  ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Container(
                  color: Color(0xffF5F5F5),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children:selectProvider.mathData.map((item){
                            return Container(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                              padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                          padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30), vertical: ScreenAdapter.setHeight(5)),
                                          decoration: BoxDecoration(
                                            color: transformColor(item['color']),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Text('${item['leagueChs'] != null ? item['leagueChs'] : ''}', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                                        ),
                                        Container(
                                          child: Text('${item['time'] != null ? panTime(item['time']) : ''}', style: TextStyle(fontSize: ScreenAdapter.size(33), fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text('${item['season'] != null ? item['season'] : ''}', style: TextStyle(color: Color(0xff999999), fontSize: ScreenAdapter.size(20)),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top:ScreenAdapter.setHeight(10)),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: ScreenAdapter.setWidth(50),
                                                        child: item['homeLogo'] != null ?  Image.network('${item['homeLogo']}?win007=sell', fit: BoxFit.cover,) : Container(),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                                                        child: Text('${item['homeTeamChs'] != null ? item['homeTeamChs'] : ''}', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: ScreenAdapter.setWidth(50),
                                                child: Image.asset('assets/images/vs.png', fit: BoxFit.cover,),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: ScreenAdapter.setWidth(50),
                                                        child: item['awayLogo'] != null ? Image.network('${item['awayLogo']}?win007=sell', fit: BoxFit.cover,) : Container(),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                                                        child: Text('${item['awayTeamChs'] != null ? item['awayTeamChs'] : ''}', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        item['state'] !=null ? panStatus(item['state']) : Container()
                                      ],
                                    ),
                                  ),
                                  item['state'] !=null ? panSowBtn(item) : Container()
                                ],
                              ),
                            );
                          }).toList()
                        ),
                      )
                    ],
                  ),
                ),
              );
      }
    }
    
    
  }

  transformColor(color){
    var colorNum = color.toString().substring(1);
    var v = '0xff' + colorNum;
    var newColor = int.parse(v);
    return Color(newColor);
  }

      // 判断显示什么状态
  Widget panStatus(status){
    // print(status == -1);
    switch (status) {
      case -1:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '已结束',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Color(0xff999999)),
                  ),
                );
        break;
      case 0:
        return Container(
                margin: EdgeInsets.only(
                    right: ScreenAdapter.setWidth(10)),
                child: Text(
                  '未开始',
                  style: TextStyle(
                      fontSize: ScreenAdapter.size(23),
                      color: Color(0xff80D064)),
                ),
              );
        break;
      case 1:
        return  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                        color: Theme.of(context).primaryColor,
                        child: Text('上半场', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                      ),
                    ],
                  ),
                );
        break;
        case 2:
        return  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                        color: Theme.of(context).primaryColor,
                        child: Text('中场', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                      ),
                    ],
                  ),
                );
        break;
        case 3:
        return  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                        color: Theme.of(context).primaryColor,
                        child: Text('下半场', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                      ),
                    ],
                  ),
                );
        break;
        case 4:
        return  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                        color: Theme.of(context).primaryColor,
                        child: Text('加时', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                      ),
                    ],
                  ),
                );
        break;
        case 5:
        return  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                        color: Theme.of(context).primaryColor,
                        child: Text('点球', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                      ),
                    ],
                  ),
                );
        break;
        case -10:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '取消',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Color(0xffC6C6C6)),
                  ),
                );
        break;
        case -11:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '待定',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color:  Color(0xffC6C6C6)),
                  ),
                );
        break;
        case -12:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '腰斩',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color:Color(0xffC6C6C6)),
                  ),
                );
        break;
        case -13:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '中断',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Color(0xffC6C6C6)),
                  ),
                );
        break;
        case -14:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '推迟',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Color(0xffC6C6C6)),
                  ),
                );
        break;
      default:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  child: Text(
                    '未开始',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color:Color(0xffC6C6C6)),
                  ),
                );
    }
  }


  Widget panSowBtn(item){

    var selectProvider = Provider.of<MatchBarProvider>(context);

    if(item['state'] == '-1'){
      return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(10)),
                    padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30), vertical: ScreenAdapter.setHeight(5)),
                    child: Text('${item['homeScore']}', style: TextStyle( fontSize: ScreenAdapter.size(33), fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: Text('${item['awayScore']}', style: TextStyle(fontSize: ScreenAdapter.size(33), fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            );
    }else if(item['state'] != '-1' && item['liveRooms'].isNotEmpty){
      return Container(
        width: ScreenAdapter.setWidth(50),
        child: Image.asset('assets/images/vd.png', fit: BoxFit.cover,),
      );
    }else if(item['state'] != '-1' && item['isMatchBook'] == '0'){
      return 
      InkWell(
        child:Container(
                width: ScreenAdapter.setWidth(50),
                margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                child:Icon(IconData(0xe68c, fontFamily: 'myIcon'), color: Color(0xffFA6D50), size: ScreenAdapter.size(50),)
              ),
         
        onTap: (){
          if(uid!=null && token != null){
            var formData = {'uid':uid, 'token':token, 'liveType':selectProvider.homeBarIndex, 'leagueId':item['leagueId'], 'matchId':item['matchId'], 'matchTime':item['matchTime'], 'homeId':item['homeId'], 'homeChs':item['homeChs'], 'awayId':item['awayId'], 'awayChs':item['awayChs'], 'seasonRoundCn':item['roundCn']};
            api.getData(context, 'reservation', formData: formData).then((val){
              var res = json.decode(val.toString());
              Fluttertoast.showToast(msg: '${res['data']['msg']} 订阅有延迟，请稍后查看');
              selectProvider.getMathData(context, page:1, size:10);
            });
          }else{
            Navigator.pushNamed(context, '/login');
          }
          
        },
      );
    }else if(item['state'] != '-1' && item['isMatchBook'] != '0'){
      return 
      Container(
        width: ScreenAdapter.setWidth(50),
        margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
        child:Icon(IconData(0xe68c, fontFamily: 'myIcon'), color: Color(0xffCCCCCC), size: ScreenAdapter.size(50),)
      );
    }
  }


  panTime(time){
    return time.toString().substring(10,16);
  }
}