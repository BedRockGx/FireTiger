import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/searDataProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../PluginWidget/ImageRound.dart';
import '../../../utils/ScreenAdapter.dart';
import '../../../utils/ScreenAdapter.dart';
import '../../../utils/ScreenAdapter.dart';
import '../../../utils/ScreenAdapter.dart';

class AnchorPage extends StatefulWidget {
  @override
  _AnchorPageState createState() => _AnchorPageState();
}

class _AnchorPageState extends State<AnchorPage> {

  var api = Api();

  @override
  Widget build(BuildContext context) {
    var searchDataProvider = Provider.of<SearchDataProvider>(context);
    if(searchDataProvider.anchorData.length == 0){
      return Center(
        child: Text('暂无数据', style: TextStyle(fontSize: ScreenAdapter.size(30),),),
      );
    }else{
        return Container(
              margin: EdgeInsets.all(ScreenAdapter.setHeight(30)),
              child: Column(
              children: searchDataProvider.anchorData.map((item){
                return Container(
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                  child:Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ImageRoud(item['avatar'], 60),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: item['isAttention'] != '0' ? 
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(10),),
                                        Container(
                                          margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                          padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                                          color: Theme.of(context).primaryColor,
                                          child: Text('直播中', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  )
                                  :
                                  Text(''),
                          )
                        ],
                      ),
                      SizedBox(width: ScreenAdapter.setWidth(20),),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(item['user_nicename'], style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                  padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                                  // width: ScreenAdapter.setWidth(80),
                                  alignment: Alignment.centerRight,
                                  child: Text('${item['level']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: panImage(int.parse(item['level'])),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenAdapter.setHeight(20),
                            ),
                            Row(
                              children: <Widget>[
                                Text('粉丝数 ${item['fans']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                              ],
                            )
                          ],
                        ),
                      ),
                      item['isAttention'] != '0' ? 
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
                      InkWell(
                        child: Container(
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
                        ),
                        onTap: () async {
                          var uid = await PublicStorage.getHistoryList('uuid');
                          var token = await PublicStorage.getHistoryList('token');
                          if(uid.isEmpty && token.isEmpty){
                            Navigator.pushNamed(context, '/login');
                            return;
                          }
                          api.postData(context, 'followAdd', formData: {'uid':uid[0], 'token':token[0], 'toUid':item['id']}).then((val){
                            var res = json.decode(val.toString());
                            Fluttertoast.showToast(msg: '${res['data']['msg']}, 关注有延迟，请稍后刷新查看');
                          });
                        },
                      )
                    ],
                  )
                );
                
              }).toList()
            ),
            );
    
    }
    
  }

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