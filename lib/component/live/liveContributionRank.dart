import 'dart:convert';

import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/http/api.dart';
import 'package:flutter/material.dart';

class LiveContriButionRank extends StatefulWidget {
  var anchorID;
  LiveContriButionRank(this.anchorID);
  @override
  _LiveContriButionRankState createState() => _LiveContriButionRankState(this.anchorID);
}

class _LiveContriButionRankState extends State<LiveContriButionRank> {

  var anchorID;
  _LiveContriButionRankState(this.anchorID);

  List<Map> _selectExpandedBarData ;
  int highlight;

  List<Map> _rankData = [];
  var api = Api();

  @override
  void initState() {
    super.initState();
    highlight = 1;
    _selectExpandedBarData = [
      {'title':'周榜', 'code':1},
      {'title':'总榜', 'code':2},
    ];

    _rankData = [];

    _getData();
  }

  _getData(){
    print({'anchorId':anchorID, 'type':highlight, 'num':10});
    api.getData(context, 'getCoinTop', formData: {'anchorId':anchorID, 'type':highlight, 'num':10}).then((val){
      var res = json.decode(val.toString());
    var arr = res['data']['info'];
    for(var i = 0; i < arr.length; i++){
      arr[i]['pm'] = i + 1;
    }
      if (mounted) {
        setState(() {
          _rankData = (arr as List).cast();
        });
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 40 * rpx, vertical: 40 * rpx),
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300 * rpx,
                padding: EdgeInsets.all(10 * rpx),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                    children: _selectExpandedBarData.map((item) {
                  return Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10 * rpx),
                          decoration: BoxDecoration(
                              color: highlight == item['code']
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            item['title'],
                            style: TextStyle(
                                fontSize: 25 * rpx ,
                                color: highlight == item['code']
                                    ? Color(0xff333333)
                                    : Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            highlight = item['code'];
                          });
                          _getData();
                          // selectProvider.setBarIndex(item['code']);
                        },
                      ));
                }).toList()),
              ),
            ],
          ),
        ),
        _rankData.isEmpty ? 
        Center(
          child: Text('暂无数据~', style: TextStyle(fontSize: 30 *rpx),),
        )
        :
        Container(
          padding: EdgeInsets.only(top:40 * rpx),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _rankData.map((item){
              return Container(
                        margin: EdgeInsets.only(bottom: 30 * rpx),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 70 *rpx,
                              height: 70 * rpx,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: panImage(item['pm']),
                                  fit: BoxFit.contain
                                ),
                              ),
                              child: item['pm'] > 3 ? Text('${item['pm']}', style: TextStyle(fontSize: 30 * rpx, color: Colors.white, fontWeight: FontWeight.bold),) : Text(''),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:20 * rpx),
                              child:  ImageRoud('${item['uinfo']['avatar']}', 60)
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('${item['uinfo']['user_nicename']}', style: TextStyle(fontSize:30 * rpx, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              child: Text('已贡献${item['uinfo']['votestotal']}', style: TextStyle(fontSize: 25 * rpx, color: Color(0xffA4A4A4)),),
                            )
                          ],
                        ),
                      );
            }).toList()
          ),
        )
      ],
    );
  }

  panImage(n){
    switch (n) {
      case 1:
        return AssetImage('assets/images/ranking-1.png');
        break;
      case 2:
        return AssetImage('assets/images/ranking-2.png');
        break;
      case 3:
        return AssetImage('assets/images/ranking-3.png');
        break;
      default:
        return AssetImage('assets/images/ranking-other.png');
        break;
    }
  }
}