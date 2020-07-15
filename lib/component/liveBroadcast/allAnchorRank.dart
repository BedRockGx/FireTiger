

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firetiger/Bus/RankType.dart';
import 'package:firetiger/component/liveBroadcast/AnchorRankDataWidget.dart';
import 'package:firetiger/http/api.dart';
import 'package:firetiger/provider/allAnchorRankProvider.dart';
import 'package:firetiger/utils/PublicStorage.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllAnchorRank extends StatefulWidget {
  @override
  _AllAnchorRankState createState() => _AllAnchorRankState();
}

class _AllAnchorRankState extends State<AllAnchorRank> with TickerProviderStateMixin{

  TabController _tabController;
  var dateType = 1;
  var rankType = 1;
  var str = '';
  var uid;
  var api = Api();
  var _futureRankDataBuilder;

  List<Map> mData = [];
  List<Map> zData = [];
  List<Map> wData = [];

  StreamController<List> _streamController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _streamController = StreamController<List>();
    // _tabController.addListener((){
    //   print(_tabController.index);
    // });
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
    
  }

    

  @override
  void dispose() {
    _tabController.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var anchorRankProvider = Provider.of<AnchorRankProvider>(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('主播排行榜', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xffFAFAFA),
          brightness: Brightness.light,
          elevation: 0,
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
            PopupMenuButton<String>(
              color: Color(0xffFFFBF6),
              elevation: 1,
              offset: Offset(0, 50),
              // icon: Icon(Icons.add, color: Colors.red,),
              child: Container(
                margin: EdgeInsets.only(right:ScreenAdapter.setWidth(40)),
                child: Row(
                  children: <Widget>[
                    Text('${panTxt(anchorRankProvider.dateType)}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666)),),
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
                  case '日榜':
                    v = 1;
                    break;
                  case '周榜':
                    v = 2;
                    break;
                  case '月榜':
                    v = 3;
                    break;
                  default:
                }
                setState(() {
                  str = e;
                  dateType = v;
                });

                anchorRankProvider.setDateType(v);
                anchorRankProvider.getRankData(context, uid);

              },
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: '日榜',
                    child: Text('日榜'),
                  ),
                  PopupMenuItem<String>(
                    value: '周榜',
                    child: Text('周榜'),
                  ),
                  PopupMenuItem<String>(
                    value: '月榜',
                    child: Text('月榜'),
                  ),
                ];
              },
            )
          ],
          bottom: TabBar(
              controller: _tabController,
              indicatorColor:Theme.of(context).primaryColor,
              labelColor:Color(0xff333333),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor:Color(0xff333333),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicatorSize:TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(text: '明星主播榜',),
                Tab(text: '综合土豪榜',),
                Tab(text: '助威收益榜',),
              ],
              onTap: (index) {
                
              },
            ),
      ),
      body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                AnchorRnakDataWidget({'color':0xffFFF6F6, 'type':1, 'rankType':1}, anchorRankProvider:anchorRankProvider),
                AnchorRnakDataWidget({'color':0xffFFFBF6, 'type':2, 'rankType':2}, anchorRankProvider:anchorRankProvider),
                AnchorRnakDataWidget({'color':0xffFDF6FF, 'type':2, 'rankType':3}, anchorRankProvider:anchorRankProvider),
              ],
            )

    );
  }

  panTxt(type){
    switch (type) {
      case 1:
        return '日榜';
        break;
      case 2:
        return '周榜';
        break;
      case 3:
        return '月榜';
        break;
      default:
    }
  }
}