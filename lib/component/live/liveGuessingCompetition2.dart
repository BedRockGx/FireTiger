import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LiveGuessingCompetition2 extends StatefulWidget {
  var liveType;
  var leagueId;
  var matchId;
  LiveGuessingCompetition2(this.liveType, this.leagueId, this.matchId);
  @override
  _LiveGuessingCompetition2State createState() => _LiveGuessingCompetition2State(this.liveType, this.leagueId, this.matchId);
}

class _LiveGuessingCompetition2State extends State<LiveGuessingCompetition2> {



  var liveType;
  var leagueId;
  var matchId;

  _LiveGuessingCompetition2State(this.liveType, this.leagueId, this.matchId);
  var api = Api();
  var uid, token, account;


  @override
  void initState() {
    super.initState();
    _getHistoryUserInfo();
    _getData();
  }

  _getHistoryUserInfo() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    if(uuid.isNotEmpty && tokens.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getAccountData();
    }
  }

  _getData(){
    api.getData(context, 'getList', formData: {'liveType':widget.liveType, 'leagueId':widget.leagueId, 'matchId':widget.matchId}).then((val){
      var res = json.decode(val.toString());
      print(res);
    });
  }

    _getAccountData(){
    api.getData(context, 'getUserAccount', formData: {'uid':uid, 'token':token, 'p':1, 'dateType':4}).then((val){
      var res= json.decode(val.toString());
      setState(() {
        account = res['data']['info']['total'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;
    // if(widget.liveType == 0){
    //   return Center(
    //     child: Text('暂无助威数据~'),
    //   );
    // }else{
      return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom:200 * rpx,),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20 * rpx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top:20 * rpx),
                          padding: EdgeInsets.symmetric(horizontal:20 * rpx),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.help, size: 35 * rpx, color: Color(0xffA4A4A4A4),),
                              SizedBox(width: 10 * rpx,),
                              Text('助威规则', style: TextStyle(color: Color(0xff555555), fontSize: 25 * rpx),)
                            ],
                          ),
                        ),
                        InkWell(
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text('我的助威', style: TextStyle(color: Color(0xff555555), fontSize: 25 * rpx),),
                                Icon(IconData(0xe655, fontFamily: 'myIcon'), size: 35 * rpx, color: Color(0xffA4A4A4A4),),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.pushNamed(context, '/myGuessingCompetition');
                          },
                        ),
                        
                      ],
                    ),
                  ),
                  match()
                  
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                width: 750 * rpx,
                child: Container(
                  width: 750 * rpx,
                  height: 150 * rpx,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20 * rpx, 20 * rpx, 20 * rpx, 45 * rpx),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:30 * rpx),
                          margin: EdgeInsets.only(right:20 * rpx),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 40 * rpx,
                                      child: Image.asset('assets/images/huohuan.png'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                                      child: Text('火花', style: TextStyle(color: Color(0xffA1A1A1), fontSize: 25 * rpx),),
                                    ),
                                    Text('${account != null ? account['huohua'] : 0}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),)
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 40 * rpx,
                                      child: Image.asset('assets/images/jb.png'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:10 * rpx),
                                      child: Text('火虎币', style: TextStyle(color: Color(0xffA1A1A1), fontSize: 25 * rpx),),
                                    ),
                                    Text('${account != null ? account['huohubi'] : 0}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),)
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                      InkWell(
                        child: Container(
                          width: 60 * rpx,
                          margin: EdgeInsets.symmetric(horizontal: 20 * rpx),
                          child: Image.asset('assets/images/pay.png'),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/shoppingMall');
                        }
                      ),
                      InkWell(
                        child: Container(
                          width: 60 * rpx,
                          child: Image.asset('assets/images/livelw.png'),
                        ),
                        onTap: () {
                          
                        }
                      )
                    ],
                  ),
                ),
              )
          ],
        );
    
    // }
    
  }


  Widget match(){

    double rpx = MediaQuery.of(context).size.width / 750;

    return Container(
            margin: EdgeInsets.symmetric(horizontal:20 * rpx),
            padding: EdgeInsets.symmetric(horizontal:40 * rpx, vertical: 20 * rpx),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('韩挑K联 05-18 14:00', style: TextStyle(fontSize: 25 * rpx),),
                      ),
                      Container(
                        child: Text('已封盘', style: TextStyle(fontSize: 25 * rpx),),
                      )
                      // mz ? Image.asset('assets/images/hd.png') : Text('')
                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 60 * rpx,
                                margin: EdgeInsets.only(bottom:20 * rpx),
                                child:  Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.cover,),
                              ),
                              Container(
                                child: Text('阿森纳', style: TextStyle(fontWeight: FontWeight.bold, fontSize:35 * rpx),),
                              ),
                              Container(
                                child: Text('主场', style: TextStyle(color: Color(0xffA4A4A4), fontSize: 20 * rpx),),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:30 * rpx),
                        child: Text('VS', style: TextStyle(fontWeight: FontWeight.bold, fontSize:35 * rpx)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width:60 * rpx,
                                margin: EdgeInsets.only(bottom:20 * rpx),
                                child:  Image.network('https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg', fit: BoxFit.cover,),
                              ),
                              Container(
                                child: Text('纽卡斯尔', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35 * rpx),),
                              ),
                              Container(
                                child: Text('', style: TextStyle(color: Color(0xffA4A4A4), fontSize: 20 * rpx),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30 * rpx, bottom:20 * rpx),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // height: ScreenAdapter.setHeight(50),
                          // padding: EdgeInsets.all(10 * rpx),
                          decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(width:1, color:Color(0xffE5E5E5))
                          ),
                          alignment: Alignment.center,
                          child:Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal:10 * rpx),
                                  decoration: BoxDecoration(
                                    color: Color(0xffB0B0B0),
                                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),topRight: Radius.circular(10) )
                                  ),
                                  child: Text('已投100000', style: TextStyle(color: Colors.white, fontSize: 20 * rpx,)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical:30 * rpx),
                                child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('主胜 0.88', style: TextStyle(fontSize:30 * rpx, color:Colors.black)),
                                          SizedBox(height: 10 * rpx,),
                                          Text('共5.3万', style: TextStyle(fontSize:20 * rpx, color:   Color(0xffAAAAAA)),),
                                          SizedBox(height: 10 * rpx,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              LinearPercentIndicator(
                                                width: 200 * rpx,
                                                padding: EdgeInsets.all(0),
                                                animation: true,
                                                lineHeight: 10.0 * rpx,
                                                animationDuration: 2000,
                                                percent: 0.4,
                                                linearStrokeCap: LinearStrokeCap.roundAll,
                                                progressColor: Color(0xffFF3641),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                              )
                            ],
                          )
                        ),
                      ),
                      SizedBox(
                        width: 20 * rpx,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          // height: ScreenAdapter.setHeight(50),
                          // padding: EdgeInsets.all(10 * rpx),
                          decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(width:1, color:Color(0xffE5E5E5))
                          ),
                          alignment: Alignment.center,
                          child:Stack(
                            children: <Widget>[
                              // Positioned(
                              //   top: 0,
                              //   right: 0,
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(horizontal:10 * rpx),
                              //     decoration: BoxDecoration(
                              //       color: Color(0xffB0B0B0),
                              //       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),topRight: Radius.circular(10) )
                              //     ),
                              //     child: Text('已投100000', style: TextStyle(color: Colors.white, fontSize: 20 * rpx,)),
                              //   ),
                              // ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical:30 * rpx),
                                child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('客投 0.92', style: TextStyle(fontSize:30 * rpx, color:Colors.black)),
                                          SizedBox(height: 10 * rpx,),
                                          Text('共5.3万', style: TextStyle(fontSize:20 * rpx, color:   Color(0xffAAAAAA)),),
                                          SizedBox(height: 10 * rpx,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              LinearPercentIndicator(
                                                width: 200 * rpx,
                                                padding: EdgeInsets.all(0),
                                                animation: true,
                                                lineHeight: 10.0 * rpx,
                                                animationDuration: 2000,
                                                percent: 0.4,
                                                linearStrokeCap: LinearStrokeCap.roundAll,
                                                progressColor: Color(0xff2992FF),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}