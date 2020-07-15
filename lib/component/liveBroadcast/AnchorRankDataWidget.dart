import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/Bus/RankType.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/imageDecoration.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class AnchorRnakDataWidget extends StatefulWidget {
  var anchorRankProvider;
  var arguments;
  AnchorRnakDataWidget(this.arguments, {@required this.anchorRankProvider});
  @override
  _AnchorRnakDataWidgetState createState() => _AnchorRnakDataWidgetState(this.arguments, this.anchorRankProvider);
}

class _AnchorRnakDataWidgetState extends State<AnchorRnakDataWidget> {

  var arguments;
  var anchorRankProvider;
  _AnchorRnakDataWidgetState(this.arguments, this.anchorRankProvider);

  var api = Api();
  
  var uid;

  @override
  void initState() {
    super.initState();
    
    _getStorageUUid();
  }

  
  _getStorageUUid() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    if(uuid.isNotEmpty){
      if (mounted) {
        setState(() {
          uid = uuid[0];
        });
      }
    }
    anchorRankProvider.setType(arguments['rankType']);
    anchorRankProvider.getRankData(context, uid);
    
  }

  // Future _getRank() async {
    // Response response;
    // response = await api.getData(context, 'getRank', formData: {'type':anchorRankProvider.type, 'uid':uid, 'dateType':anchorRankProvider.dateType});
    // var v = json.decode(response.toString());
    // var arr = v['data']['info'];
    // for(var i = 0; i < arr.length; i++){
    //   arr[i]['pm'] = i + 1;
    // }
    // if (mounted) {
    //   setState(() {
    //     rankData = (arr as List).cast();
    //   });
    // }
    // return arr;
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: anchorRankProvider.rankData.length == 0 ? Container() :
          ListView(
            children: <Widget>[
              panShow()
            ],
          )
      
    );
  }

  Widget panShow(){
    List<Map> data1;
    List<Map> data2;
    if(anchorRankProvider.rankData.length > 3){
      data1 = anchorRankProvider.rankData.take(3).toList();
      data2 = anchorRankProvider.rankData.sublist(3);
    }else{
      data1 = anchorRankProvider.rankData;
      data2 = [];
    }
    
    
    if(arguments['type'] == 1){
      return Container(
        child: Column(
          children: <Widget>[
              mingXing(data1),
              data2.length != 0 ? otherPM(data2) : Container()
          ],
        ),
      );
    }else{
      return Container(
        child: Column(
          children: <Widget>[
              tuHaoshouYi(data1),
              data2.length != 0 ? otherPM2(data2) : Container()
          ],
        ),
      );
    }
  }

  // 明星主播榜
  Widget mingXing(List<Map> data){
    return Container(
            color: Color(arguments['color']),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical:ScreenAdapter.setHeight(20)),
            child: Row(
              children: data.map((item){
                return Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'${item['avatar']}', 'borderWidth':10.0,  'title':'${item['user_nicename']}', 'subTitle':'${item['signature']}', 'pm':item['pm']}),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      item['isAttention'] == '1' ? 
                      Container(
                        width: ScreenAdapter.setWidth(150),
                        height: ScreenAdapter.setHeight(50),
                        // padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffFF3641))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(IconData(0xe657, fontFamily: 'myIcon'), color: Color(0xffFF3641),  size: ScreenAdapter.size(30),),
                            Text('已关注', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                      :
                      Container(
                        width: ScreenAdapter.setWidth(150),
                        height: ScreenAdapter.setHeight(50),
                        margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                        child: RaisedButton(
                          child: Text('+关注', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                          textColor: Colors.white,
                          highlightColor:Theme.of(context).primaryColor,
                          color:Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                          onPressed:(){

                          }
                        ),
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          );
  }

  // 综合土豪榜&竞猜收益榜
   Widget tuHaoshouYi(List<Map> data){
    return Container(
            color: Color(arguments['color']),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical:ScreenAdapter.setHeight(20)),
            child: Row(
              children: data.map((item){
                return Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'${item['avatar']}', 'borderWidth':10.0,  'title':'${item['user_nicename']}', 'subTitle':'', 'pm':item['pm']}),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(20), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                        constraints: BoxConstraints(
                          maxWidth:  ScreenAdapter.setWidth(120),
                        ),
                        alignment: Alignment.centerRight,
                        child: Text('${item['level']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: panImage(int.parse(item['level'])),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        child: Text(arguments['rankType'] == 2 ? '${item['total']}贡献度' : '${item['totalVictory']}贡献度', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          );
  }


  // 明星榜其它排名
  Widget otherPM(List<Map> data){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Column(
              children: data.map((item){
                return Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.setWidth(70),
                        height: ScreenAdapter.setHeight(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ranking-other.png'),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Text('${item['pm']}', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                        child: ImageRoud('${item['avatar']}', 60),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${item['user_nicename']}', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                              Text('${item['signature']}', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                            ],
                          ),
                        ),
                      ),
                      item['isAttention'] == '1' ? 
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffFF3641))
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(IconData(0xe657, fontFamily: 'myIcon'), color: Color(0xffFF3641),  size: ScreenAdapter.size(30),),
                            Text('已关注', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                      :
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(35), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          color: Color(0xffFF3641),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(IconData(0xe656, fontFamily: 'myIcon'), color: Color(0xffFFFFFF), size: ScreenAdapter.size(30),),
                            Text('关注', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          );
  }

  // 综合土豪榜&竞猜收益榜其它排名

  Widget otherPM2(List<Map> data){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Column(
              children: data.map((item){
                return Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.setWidth(70),
                        height: ScreenAdapter.setHeight(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ranking-other.png'),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Text('${item['pm']}', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                        child: ImageRoud('${item['avatar']}', 60),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${item['user_nicename']}', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                              SizedBox(
                                height: ScreenAdapter.setHeight(10),
                              ),
                              // Container(
                              //   padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(20), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                              //   constraints: BoxConstraints(
                              //     maxWidth:  ScreenAdapter.setWidth(100),
                              //   ),
                              //   alignment: Alignment.centerRight,
                              //   child: Text('${item['dj']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(5),
                              //     image: DecorationImage(
                              //       image: panImage(item['dj']),
                              //       fit: BoxFit.cover
                              //     )
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(arguments['rankType'] == 2 ? '${item['total']}贡献度' : '${item['totalVictory']}贡献度', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          );
  }

    // 判断显示等级
  ImageProvider panImage(n){
    if(n<11){
      return AssetImage('assets/images/tag1.png');
    }else if(10<n && n<31){
      return AssetImage('assets/images/tag2.png');
    }else if(30<n && n<51){
      return AssetImage('assets/images/tag3.png');
    }else if(50<n && n<71){
      return AssetImage('assets/images/tag4.png');
    }else if(70<n && n<101){
      return AssetImage('assets/images/tag5.png');
    }
  }
}