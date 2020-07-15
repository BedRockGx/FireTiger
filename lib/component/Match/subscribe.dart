import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Subscribe extends StatefulWidget {
  var bottomBarProvider;
  Subscribe({this.bottomBarProvider});
  @override
  _SubscribeState createState() => _SubscribeState(this.bottomBarProvider);
}

class _SubscribeState extends State<Subscribe> {
  var bottomBarProvider;
  _SubscribeState(this.bottomBarProvider);
  var api = Api();

  var uid, token;
  var futureDataBuilder;
   List<Map> data = [];

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
      futureDataBuilder = _getData();
    }else{
       
      Navigator.pushNamed(context, '/login').then((_){
        bottomBarProvider.setCurrentIndex(1);
        bottomBarProvider.setMathTabIndex(0); 
      });
    }
  }

  Future _getData() async {
    var formData = {'uid':uid, 'token':token, 'page':1, 'size':5};
    Response response;
    response = await api.getData(context, 'getReservationList', formData: formData);
    var val= json.decode(response.toString());
    setState(() {
      data = (val['data']['info']['result'] as List).cast();
    });
    return val['data']['info']['result'];
  }

   

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureDataBuilder,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
                    children: <Widget>[

                      // Container(
                      //     height: ScreenAdapter.setHeight(65),
                      //     alignment: Alignment.center,
                      //     child: Text('联赛第26轮', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
                      //     decoration: BoxDecoration(
                      //       color: Color(0xffF5F5F5),
                      //       border: Border(
                      //         top: BorderSide(width: ScreenAdapter.setHeight(1), color: Colors.black12)
                      //       )
                      //     ),
                      //   ),
                        
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                          child: Column(
                            children:data.map((item){
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: ScreenAdapter.setWidth(1),
                                      color: Color(0xffE4E4E4)
                                    )
                                  )
                                ),
                                padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                      child: Column(
                                        children: <Widget>[
                                          Text('${panDay(item['matchTime'])}', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                          Text('${panTime(item['matchTime'])}', style: TextStyle(fontSize: ScreenAdapter.size(60), fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('${item['homeChs']} vs ${item['awayChs']}',overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                                            child: Text('${item['seasonRoundCn']}', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              panStatus(item['state']),
                                              item['status'] != 3 ? Container(
                                                child: Text('比分', style: TextStyle(color: Color(0xffA4A4A4), fontSize:  ScreenAdapter.size(20)),),
                                                margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                              ):Text(''),
                                              item['status'] != 3 ? Text('${item['homeScore']} : ${item['awayScore']}', style: TextStyle(fontSize:  ScreenAdapter.size(30), fontWeight: FontWeight.bold)) :Text(''),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    // panShowBtn(item)
                                  ],
                                ),
                              );
                            }).toList()
                          ),
                        )
                    ],
                  );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    
  }

  panDay(time){
    return time.toString().substring(5, 10);
  }

  panTime(time){
    return time.toString().substring(10,16);
  }


    // 判断显示什么状态
  Widget panStatus(status){
    switch (status) {
      case -1:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '已结束',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
        break;
      case 0:
        return Container(
                margin: EdgeInsets.only(
                    right: ScreenAdapter.setWidth(10)),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenAdapter.setWidth(5)),
                color: Color(0xff80D064),
                child: Text(
                  '未开始',
                  style: TextStyle(
                      fontSize: ScreenAdapter.size(23),
                      color: Colors.white),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '取消',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
        break;
        case -11:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '待定',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
        break;
        case -12:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '腰斩',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
        break;
        case -13:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '中断',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
        break;
        case -14:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '推迟',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
        break;
      default:
        return Container(
                  margin: EdgeInsets.only(
                      right: ScreenAdapter.setWidth(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenAdapter.setWidth(5)),
                  color: Color(0xffC6C6C6),
                  child: Text(
                    '未开始',
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(23),
                        color: Colors.white),
                  ),
                );
    }
  }


  // 判断显示什么按钮
  Widget panShowBtn(item){

    var selectProvider = Provider.of<MatchBarProvider>(context);

    // if(roomArr.length == 0){
    //   return Container();
    // }else{
    //   return Container(
    //             child: Container(
    //               width: ScreenAdapter.setWidth(50),
    //               margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
    //               padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(10)),
    //               child:Icon(IconData(0xe688, fontFamily: 'myIcon'), color: Color(0xffAFAFAF), size: ScreenAdapter.size(50),)
    //             ),
    //           );
    // }
    if(item['isMatchBook'] == '0'){
      return InkWell(
        child:Container(
                width: ScreenAdapter.setWidth(50),
                margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                child:Icon(IconData(0xe686, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(50),)
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
      
    }else{
      return Container(
                  child: Container(
                    width: ScreenAdapter.setWidth(50),
                    margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                    child:Image.asset('assets/images/dy.png', fit:BoxFit.contain)
                  )
                );
    }


    // switch (status) {
    //   case 1:
    //     return Container(
          
    //             child: Container(
    //               width: ScreenAdapter.setWidth(50),
    //               margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
    //               padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(10)),
    //               child:Icon(IconData(0xe688, fontFamily: 'myIcon'), color: Color(0xffAFAFAF), size: ScreenAdapter.size(50),)
    //             ),
    //           );
    //     break;
    //   case 2:
    //     return  Container(
    //               child: Container(
    //                 width: ScreenAdapter.setWidth(50),
    //                 margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
    //                 child:Image.asset('assets/images/dy.png', fit:BoxFit.contain)
    //               )
    //             );
    //     break;
    //   case 3:
    //     return Container(
    //             width: ScreenAdapter.setWidth(50),
    //             margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
    //             child:Icon(IconData(0xe686, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(50),)
    //           );
    //     break;
    //   default:
    // }
  }


}