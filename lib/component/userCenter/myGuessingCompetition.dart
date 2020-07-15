import 'dart:convert';

import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'guessingCompetitionWidget.dart';

class MyGuessingCompetition extends StatefulWidget {
  @override
  _MyGuessingCompetitionState createState() => _MyGuessingCompetitionState();
}

class _MyGuessingCompetitionState extends State<MyGuessingCompetition>  with TickerProviderStateMixin{

    TabController _tabController;
    var startTime;
    var endTime;

    List<String> classData = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

    var month;

    var _selectMonth = '1';
    var api = Api();
    var uid, token;
    var futureDataBuilder;
    List<Map> data = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    startTime = Utils.currentTimeMillis(int.parse(_selectMonth), 1, 0, 0, 0);
    endTime = Utils.currentTimeMillis(int.parse(_selectMonth), 30, 23, 59, 59);
    // });
    
    _getUserIsLogin();
    month = DateTime.now().month;
  }

    _getUserIsLogin() async {
    var tokens = await PublicStorage.getHistoryList('token');
    var uuid = await PublicStorage.getHistoryList('uuid');
    print(tokens);
    if(tokens.isNotEmpty && uuid.isNotEmpty){
      setState(() {
        uid = uuid[0];
        token = tokens[0];
      });
      _getData();     // 获取用户信息
    }else{
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  _getData(){
    // print( {'uid':uid, 'token':token, 'startTime':startTime, 'endTime':endTime})
    api.getData(context, 'getMyGuess', formData: {'uid':uid, 'token':token, 'startTime':startTime, 'endTime':endTime}).then((val){
      var res = json.decode(val.toString());
      print(res);
      setState(() {
        data =(res['data']['info'] as List).cast();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的助威', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
        actions: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right:ScreenAdapter.setWidth(30)),
              child: Row(
                children: <Widget>[
                  Text('$month月', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666)),),
                  SizedBox(
                    width: ScreenAdapter.setWidth(5),
                  ),
                  Icon(IconData(0xe677, fontFamily: 'myIcon'), color: Color(0xff666666), size: ScreenAdapter.size(15),)
                ],
              ),
            ),
            onTap:showBottom,
          )
        ],
        // bottom: TabBar(
        //   controller: _tabController,
        //   indicatorColor:Theme.of(context).primaryColor,
        //   labelColor:Color(0xff333333),
        //   labelStyle: TextStyle(fontWeight: FontWeight.bold),
        //   unselectedLabelColor:Color(0xff333333),
        //   unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        //   indicatorSize:TabBarIndicatorSize.label,
        //   tabs: <Widget>[
        //     Tab(text: '发起记录',),
        //     Tab(text: '参与记录',),
        //   ],
        //   onTap: (index) {
            
        //   },
        // ),
      ),
      body: GuessingCompetitionWidget(2, data)
      // TabBarView(
      //   controller: _tabController,
      //   children: <Widget>[
      //     GuessingCompetitionWidget(1),
      //     GuessingCompetitionWidget(2),
      //   ],
      // ),
    );
  }

  showBottom(){
    setState(() {
      _selectMonth = '1';
    });
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: ScreenAdapter.setHeight(500),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  border:Border(
                    bottom: BorderSide(
                      width: ScreenAdapter.setHeight(1),
                      color: Color(0xffE5E5E5)
                    )
                  )
                ),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(30)),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text('确定', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25)),),
                  ),
                  onTap: (){
                    // _selectMonth == '' ?  month = classData[0] : month = _selectMonth;
                    
                    setState(() {
                      startTime = Utils.currentTimeMillis(int.parse(_selectMonth), 1, 0, 0, 0);
                      endTime = Utils.currentTimeMillis(int.parse(_selectMonth), 30, 23, 59, 59);
                      month = _selectMonth;
                    });
                    _getData();
                    Navigator.pop(context);
                  },
                )
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: ScreenAdapter.setHeight(400)
                ),
                child: CupertinoPicker(
                  itemExtent: ScreenAdapter.setHeight(70),
                  diameterRatio: 1,
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (index){
                    setState(() {
                      _selectMonth = classData[index];
                      startTime = Utils.currentTimeMillis(int.parse(classData[index]), 1, 0, 0, 0);
                      endTime = Utils.currentTimeMillis(int.parse(classData[index]), 30, 23, 59, 59);
                    });
                  },
                  children: classData.map((item){
                    return Center(
                      child: Text('$item月'),
                    );
                  }).toList()
                )
              )
            ],
          ),
        );
      });
  }
}