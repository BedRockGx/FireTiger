import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyGuessingCompetition2 extends StatefulWidget {
  @override
  _MyGuessingCompetition2State createState() => _MyGuessingCompetition2State();
}

class _MyGuessingCompetition2State extends State<MyGuessingCompetition2> {

  List tabList = ['总场', '胜场', '胜率', '盈亏', '余额'];
  List tabNum = ['0', '0', '0%', '0', '0'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的竞猜', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
      body: ListView(
        children: <Widget>[
          // 顶部Tab数据
          tabText(),
          // 商城区域
          shop(),
          // 我的竞猜数据
          guessingCompetition(),
          // 推荐竞猜
          historyGuessingCompetition()
        ],
      ),
    );
  }

  Widget tabText(){
    return Column(
      children: <Widget>[
        Container(
            margin:EdgeInsets.only(top:ScreenAdapter.setHeight(40), bottom:ScreenAdapter.setHeight(20)),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
            child: Row(
              children: tabList.map((v){
                return Expanded(
                  flex: 1,
                  child: Text(v, textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(30), color: Color(0xffA4A4A4)),),
                );
              }).toList(),
            ),
          ),
          Container(
            margin:EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
            child: Row(
              children: tabNum.map((v){
                return Expanded(
                  flex: 1,
                  child: Text(v, textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(60), color: Color(0xff333333)),),
                );
              }).toList(),
            ),
          )
      ],
    );
  }

  Widget shop(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(50),
                          child: Image.asset('assets/images/shop.png', fit: BoxFit.cover,)
                        ),
                        SizedBox(
                          width: ScreenAdapter.setWidth(20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('乐答商城', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            SizedBox(height: ScreenAdapter.setHeight(5),),
                            Text('超高中奖率', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                          ],
                        )
                      ],
                    )
                  ),
                ),
                SizedBox(
                  width: ScreenAdapter.setWidth(20),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(50),
                          child: Image.asset('assets/images/award.png', fit: BoxFit.cover,)
                        ),
                        SizedBox(
                          width: ScreenAdapter.setWidth(20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('乐答收益榜', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                            SizedBox(height: ScreenAdapter.setHeight(5),),
                            Text('猜胜负 上榜单', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          );
  }

  Widget guessingCompetition(){
    return Container(
      margin: EdgeInsets.only(top:ScreenAdapter.setHeight(60)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('罗马vs利物浦', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: ScreenAdapter.setWidth(50),),
                Text('今天09:00', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical: ScreenAdapter.setHeight(5)),
            alignment: Alignment.centerLeft,
            child: Text('17/18赛季欧冠半决赛',  overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                    height: ScreenAdapter.setHeight(130),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10), bottomLeft:Radius.circular(10))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('哪方先进2球？', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                        
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Text('未封盘', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                    height: ScreenAdapter.setHeight(130),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        
                        Color(0xff9582FF),
                        Color(0xff418DFF),
                      ]),
                      borderRadius: BorderRadius.only(topRight:Radius.circular(10), bottomRight:Radius.circular(10))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text('我的选择', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white54),),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('利物浦',  textAlign: TextAlign.end, style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white),),
                            )
                          ],
                        ),
                        Row(
                          
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text('我的投注', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white54),),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('99千万', textAlign: TextAlign.end, style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white),),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                    height: ScreenAdapter.setHeight(130),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10), bottomLeft:Radius.circular(10))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('球员是首发吗卡几点回家卡手动滑稽？', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                        
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xffC1C1C1),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Text('已封盘', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                    height: ScreenAdapter.setHeight(130),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        
                        Color(0xffFD7186),
                        Color(0xffFFA65E),
                      ]),
                      borderRadius: BorderRadius.only(topRight:Radius.circular(10), bottomRight:Radius.circular(10))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text('我的选择', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white54),),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('利物浦',  textAlign: TextAlign.end, style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white),),
                            )
                          ],
                        ),
                        Row(
                          
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text('我的投注', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white54),),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('99千万', textAlign: TextAlign.end, style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white),),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget historyGuessingCompetition(){
    return Container(
      margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(60)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('高速vs新疆喀什古城埃里克森大家可拉伸的杰拉德', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: ScreenAdapter.setWidth(50),
                ),
                Text('2020-04-30 09:00', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical: ScreenAdapter.setHeight(5)),
            alignment: Alignment.centerLeft,
            child: Text('CBA16/17赛季季后赛1/4决赛第4', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(20)),
            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
            height: ScreenAdapter.setHeight(160),
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('哪方先得80分？'),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xffC1C1C1),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text('已结束', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20), vertical:ScreenAdapter.setHeight(5)),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text('胜', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('我的选择',style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666))),
                          Text('新疆喀什古城', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('我的投注',style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666))),
                          Text('999万', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('我的收入',style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666))),
                          Text('+12千万', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold, color: Colors.red))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(20)),
            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
            height: ScreenAdapter.setHeight(160),
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('哪方先得80分？'),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xffC1C1C1),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text('已结束', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20), vertical:ScreenAdapter.setHeight(5)),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text('胜', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('我的选择',style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666))),
                          Text('新疆喀什古城', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('我的投注',style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666))),
                          Text('1000', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('我的收入',style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666))),
                          Text('-1000', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold, color: Color(0xff3661FF)))
                        ],
                      ),
                    ],
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