

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  var api = Api();
  var page =1;
  var data;
  var _futureAccoutBuilder;
  var str = '今天';
  var dateType = 1;
  var uid, token;

  @override
  void initState() {
    super.initState();
    getHistoryData();
  }

  getHistoryData() async {
    var uuid = await PublicStorage.getHistoryList('uuid');
    var tokens = await PublicStorage.getHistoryList('token');
    print(tokens);
    if(uuid.isEmpty && tokens.isEmpty){
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }else{
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _futureAccoutBuilder = _getData();
    }
  }

  Future _getData() async {
    
    Response response;
    response = await api.getData(context, 'getUserAccount', formData: {'uid':uid, 'token':token, 'p':page, 'dateType':dateType});
    var val = json.decode(response.toString());
    print(val);
    return val['data']['info'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的账户', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            IconData(0xe654, fontFamily: 'myIcon'),
            size: ScreenAdapter.size(60),
            color: Color(0xff333333),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body:FutureBuilder(
        future: _futureAccoutBuilder,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                    Color(0xffFFC6CA),
                                    Color(0xffFF3641)
                                  ]),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: ScreenAdapter.setWidth(40),
                                          child: Image.asset('assets/images/hj.png', fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: ScreenAdapter.setWidth(10),),
                                        Text('火花', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20), bottom:ScreenAdapter.setHeight(40)),
                                      // alignment: Alignment.centerLeft,
                                      child: Text('${snapshot.data['total']['huohua']}', style: TextStyle(fontSize: ScreenAdapter.size(60), color: Colors.white, fontWeight: FontWeight.bold,), ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: ScreenAdapter.setWidth(120),
                                        height: ScreenAdapter.setHeight(50),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffFF3641)),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        child: Text('充值'),
                                      ),
                                      onTap: (){
                                        Navigator.pushNamed(context, '/pay');
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenAdapter.setWidth(20),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                    Color(0xffFFDF5A),
                                    Color(0xffFF7038)
                                  ]),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: ScreenAdapter.setWidth(40),
                                          child: Image.asset('assets/images/jb.png', fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: ScreenAdapter.setWidth(10),),
                                        Text('火虎币', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20), bottom:ScreenAdapter.setHeight(40)),
                                      // alignment: Alignment.centerLeft,
                                      child: Text('${snapshot.data['total']['huohubi']}', style: TextStyle(fontSize: ScreenAdapter.size(50), color: Colors.white, fontWeight: FontWeight.bold,), ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: ScreenAdapter.setWidth(120),
                                            height: ScreenAdapter.setHeight(50),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(width:ScreenAdapter.setWidth(2), color:Color(0xffFF3641)),
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Text('做任务'),
                                          ),
                                          onTap: (){
                                            Navigator.pushNamed(context, '/myGrade');
                                          },
                                        ),
                                        SizedBox(
                                          width: ScreenAdapter.setWidth(15),
                                        ),
                                        InkWell(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: ScreenAdapter.setWidth(120),
                                            height: ScreenAdapter.setHeight(50),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(width:ScreenAdapter.setWidth(2), color:Color(0xffFF3641)),
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Text('兑换'),
                                          ),
                                          onTap: (){
                                            Navigator.pushNamed(context, '/shoppingMall');
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                        margin: EdgeInsets.only(top:ScreenAdapter.setHeight(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('我的消费记录', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                            PopupMenuButton<String>(
                              color: Color(0xffFFFBF6),
                              elevation: 1,
                              offset: Offset(0, 50),
                              // icon: Icon(Icons.add, color: Colors.red,),
                              child: Container(
                                // margin: EdgeInsets.only(right:ScreenAdapter.setWidth(40)),
                                child: Row(
                                  children: <Widget>[
                                    Text('$str', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666)),),
                                    SizedBox(
                                      width: ScreenAdapter.setWidth(5),
                                    ),
                                    Icon(IconData(0xe677, fontFamily: 'myIcon'), size: ScreenAdapter.size(15), color: Color(0xff666666),)
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)
                                )
                              ),
                              onSelected: (e){
                                var v;

                                switch (e) {
                                  case '今天':
                                    v = 1;
                                    break;
                                  case '本周':
                                    v = 2;
                                    break;
                                  case '本月':
                                    v = 3;
                                    break;
                                  case '近三月':
                                    v = 4;
                                    break;
                                  default:
                                }
                                setState(() {
                                  str = e;
                                  dateType = v;
                                });

                                _getData();
                              },
                              itemBuilder: (context) {
                                return <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: '今天',
                                    child: Text('今天'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: '本周',
                                    child: Text('本周'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: '本月',
                                    child: Text('本月'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: '近三月',
                                    child: Text('近三月'),
                                  ),
                                ];
                              },
                            )
                          ],
                        )
                      ),

                      snapshot.data['list']['list'].length == 0 ? 
                      Center(
                        child: Text('暂无消费记录~', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                      )
                      :
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(30)),
                            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(50),
                                  margin: EdgeInsets.only(right:ScreenAdapter.setWidth(15)),
                                  child: Image.asset('assets/images/huohuan.png', fit: BoxFit.cover,)
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('充值火花', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                      SizedBox(height: ScreenAdapter.setHeight(10),),
                                      Text('05-08 22:10', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: ScreenAdapter.setWidth(100),
                                  child: Text('+12', style: TextStyle(fontSize: ScreenAdapter.size(35), color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(30)),
                            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(60)),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(50),
                                  margin: EdgeInsets.only(right:ScreenAdapter.setWidth(15)),
                                  child: Image.asset('assets/images/jb.png', fit: BoxFit.cover,)
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('消费火虎币', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                      SizedBox(height: ScreenAdapter.setHeight(10),),
                                      Text('03-12 22:10', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: ScreenAdapter.setWidth(100),
                                  child: Text('-92万', style: TextStyle(fontSize: ScreenAdapter.size(35))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )

                    ],
                  );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
      
       
    );
  }
}