import 'package:firetiger/provider/matchBarProvider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarDataRank extends StatefulWidget {
  @override
  _BarDataRankState createState() => _BarDataRankState();
}

class _BarDataRankState extends State<BarDataRank> {
 

  @override
  Widget build(BuildContext context) {
    var selectProvider = Provider.of<MatchBarProvider>(context);
    return Scaffold(
      body: selectProvider.mathData.isEmpty ? 
      Center(
        child: Text('暂无数据', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
      ) :
      selectProvider.homeBarIndex == 1 ? 
      Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(40)),
        child: ListView(
          children: <Widget>[
            Container(
                margin:
                    EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(20)),
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(ScreenAdapter.setWidth(300)),
                    1: FixedColumnWidth(ScreenAdapter.setWidth(70)),
                    2: FixedColumnWidth(ScreenAdapter.setWidth(150)),
                    3: FixedColumnWidth(ScreenAdapter.setWidth(90)),
                    4: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                  },
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Text(
                          '球队',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '赛',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '胜/平/负',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '进/失',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '积分',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                    ])
                  ],
                )),
            Container(
              child: Column(
                children:[
                  Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: ScreenAdapter.setHeight(20)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '欧冠区',
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.size(35),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: ScreenAdapter.setHeight(20)),
                                    child: Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(ScreenAdapter.setWidth(300)),
                                        1: FixedColumnWidth(ScreenAdapter.setWidth(70)),
                                        2: FixedColumnWidth(ScreenAdapter.setWidth(150)),
                                        3: FixedColumnWidth(ScreenAdapter.setWidth(90)),
                                        4: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: 
                                        selectProvider.mathData.map((item){
                                          return TableRow(children: [
                                          TableCell(
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '${item['rank']}',
                                                  style: TextStyle(
                                                      fontSize: ScreenAdapter.size(35),
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Container(
                                                  width: ScreenAdapter.setWidth(50),
                                                  margin: EdgeInsets.only(
                                                      left: ScreenAdapter.setWidth(40),
                                                      right: ScreenAdapter.setWidth(20)),
                                                  child: Image.network(
                                                      '${item['logo']}?win007=sell',
                                                      fit: BoxFit.cover),
                                                ),
                                                Container(
                                                  width: ScreenAdapter.setWidth(120),
                                                  child: Text(
                                                    '${item['nameChs']}',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: ScreenAdapter.size(25)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                                              child: Text(
                                                '${item['totalCount']}',
                                                style: TextStyle(
                                                    fontSize: ScreenAdapter.size(25)),
                                              ),
                                            )
                                          ),
                                          TableCell(
                                            child: Text(
                                              '${item['winCount']}/${item['drawCount']}/${item['loseCount']}',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(25)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Text(
                                              '${item['getScore']}/${item['loseScore']}',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(25)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Text(
                                              '${item['integral']}',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(25)),
                                            ),
                                          ),
                                        ]);
                                        }).toList()
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        
                ]
              ),
            )
          ],
        ),
      )
      :
      Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(40)),
        child: ListView(
          children: <Widget>[
            Container(
                margin:
                    EdgeInsets.symmetric(vertical: ScreenAdapter.setHeight(20)),
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(ScreenAdapter.setWidth(300)),
                    1: FixedColumnWidth(ScreenAdapter.setWidth(110)),
                    2: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                    3: FixedColumnWidth(ScreenAdapter.setWidth(90)),
                    4: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                  },
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Text(
                          '球队',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '胜/负',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '胜率',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '胜差',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '连胜/负',
                          style: TextStyle(fontSize: ScreenAdapter.size(20)),
                        ),
                      ),
                    ])
                  ],
                )),
            Container(
              child: Column(
                children:[
                  Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: ScreenAdapter.setHeight(20)),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '欧冠区',
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.size(35),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: ScreenAdapter.setHeight(20)),
                                    child: Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(ScreenAdapter.setWidth(300)),
                                        1: FixedColumnWidth(ScreenAdapter.setWidth(110)),
                                        2: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                                        3: FixedColumnWidth(ScreenAdapter.setWidth(90)),
                                        4: FixedColumnWidth(ScreenAdapter.setWidth(100)),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: 
                                        selectProvider.mathData.map((item){
                                          return TableRow(children: [
                                          TableCell(
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '${item['totalRank']}',
                                                  style: TextStyle(
                                                      fontSize: ScreenAdapter.size(35),
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Container(
                                                  width: ScreenAdapter.setWidth(50),
                                                  margin: EdgeInsets.only(
                                                      left: ScreenAdapter.setWidth(40),
                                                      right: ScreenAdapter.setWidth(20)),
                                                  child: Image.network(
                                                      '${item['logo']}',
                                                      fit: BoxFit.cover),
                                                ),
                                                Container(
                                                  width: ScreenAdapter.setWidth(120),
                                                  child: Text(
                                                    '${item['nameChs']}',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: ScreenAdapter.size(25)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                                              child: Text(
                                                '${item['homeWin']}/${item['homeLose']}',
                                                style: TextStyle(
                                                    fontSize: ScreenAdapter.size(25)),
                                              ),
                                            )
                                          ),
                                          TableCell(
                                            child: Text(
                                              '${item['winRate']}',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(25)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Text(
                                              '${item['WinsAndLosses']}',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(25)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Text(
                                              '${panState(item['state'])}',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(25)),
                                            ),
                                          ),
                                        ]);
                                        }).toList()
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  panState(n){
    if(int.parse(n) < 0){
      return '$n连败';
    }else{
      return '$n连胜';
    }
  }
}
