import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class SelectBarData extends StatefulWidget {
  @override
  _SelectBarDataState createState() => _SelectBarDataState();
}

class _SelectBarDataState extends State<SelectBarData> {

  List<Map> data = [
    {'day':'11/20', 'time':'00:00', 'title':'足球 · 巴塞罗那vs尤文图斯', 'subtitle':'17/18赛季欧冠半决赛', 'status':1, 'bifen':'3:9', 'videoStatus':1},
    {'day':'11/20', 'time':'09:55', 'title':'足球 · 罗马vs利物浦', 'subtitle':'17/18赛季欧冠半决赛', 'status':1, 'bifen':'2:1', 'videoStatus':1},
    {'day':'11/20', 'time':'10:30', 'title':'足球 · 足球 · 巴塞罗那vs尤文图斯', 'subtitle':'欧冠经典比赛回放', 'status':2, 'bifen':'0:0', 'videoStatus':2},
    {'day':'11/20', 'time':'12:45', 'title':'足球 · 篮球 · 高速vs新疆喀什古城', 'subtitle':'CBA16/17赛季季后赛1/4决赛第4', 'status':3, 'bifen':'0:0', 'videoStatus':2},
    {'day':'11/20', 'time':'20:20', 'title':'足球 · 罗马vs利物浦', 'subtitle':'17/18赛季欧冠半决赛', 'status':3, 'bifen':'0:0', 'videoStatus':3},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: ScreenAdapter.setHeight(65),
            alignment: Alignment.center,
            color: Color(0xffF5F5F5),
            child: Text('联赛第26轮', style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(30)),),
          ),
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
                            Text(item['day'], style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                            Text(item['time'], style: TextStyle(fontSize: ScreenAdapter.size(60), fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('${item['title']}',overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            Container(
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                              child: Text('${item['subtitle']}', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                            ),
                            Row(
                              children: <Widget>[
                                panStatus(item['status']),
                                item['status'] != 3 ? Container(
                                  child: Text('比分', style: TextStyle(color: Color(0xffA4A4A4), fontSize:  ScreenAdapter.size(20)),),
                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                ):Text(''),
                                item['status'] != 3 ? Text('${item['bifen']}', style: TextStyle(fontSize:  ScreenAdapter.size(30), fontWeight: FontWeight.bold)) :Text(''),
                              ],
                            )
                          ],
                        ),
                      ),
                      panShowBtn(item['videoStatus'])
                    ],
                  ),
                );
              }).toList()
            ),
          )
        ],
      ),
    );
  }

  // 判断显示什么状态
  Widget panStatus(status){
    switch (status) {
      case 1:
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
                        child: Text('直播中', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                      ),
                    ],
                  ),
                );
        break;
      case 3:
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
      default:
    }
  }


  // 判断显示什么按钮
  Widget panShowBtn(status){
    switch (status) {
      case 1:
        return Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(35), vertical: ScreenAdapter.setHeight(10)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffFF3641))
                  ),
                  child:Text('回放', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
                ),
              );
        break;
      case 2:
        return  Container(
                  child: Container(
                    margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                    child:Row(
                      children: <Widget>[
                        Icon(IconData(0xe657, fontFamily: 'myIcon'), color: Color(0xffFF3641),  size: ScreenAdapter.size(30),),
                        SizedBox(width: ScreenAdapter.setWidth(5),),
                        Text('已预约', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
                      ],
                    )
                  )
                );
        break;
      case 3:
        return Container(
                width: ScreenAdapter.setWidth(120),
                height: ScreenAdapter.setHeight(50),
                margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                child: RaisedButton(
                  child: Text('预约', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
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
              );
        break;
      default:
    }
  }

}