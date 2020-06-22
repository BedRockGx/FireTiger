import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// 竞猜

class LiveGuessingCompetition extends StatefulWidget {

  var live;
  LiveGuessingCompetition({this.live});

  @override
  _LiveGuessingCompetitionState createState() => _LiveGuessingCompetitionState();
}

class _LiveGuessingCompetitionState extends State<LiveGuessingCompetition> {
  /*
    status:
      0：结束
      1：进行中
      2:封盘
    At/Bt:是否投注
    win:必须在status为0时才会显示哪方胜利
    tz: 投注价格
    tindex:投注的是哪一方     -1为没有投注
   */
  List<Map> data = [
    {'title':'哪方会赢得比赛？', 'status':1, 'time':'06:12', 'AName':'罗马', 'Apl':'0.12', 'tindex':-1, 'BName':'利物浦', 'Bpl':'1.78', 'tz':'', 'win':'', 'ANum':'11000', 'BNum':'1240000'},
    {'title':'哪方先进2球', 'status':2, 'time':'', 'AName':'罗马', 'Apl':'1.24',  'BName':'利物浦', 'Bpl':'0.88', 'tindex':1, 'tz':'1000', 'win':'', 'ANum':'11000', 'BNum':'1240000'},
    {'title':'队员xx有没有首发？', 'status':0, 'time':'06:12', 'AName':'有', 'Apl':'0.12', 'tindex':0, 'BName':'没有', 'Bpl':'1.78',  'tz':'20000', 'win':1},
  ];

  var _showBottomIndex = -1;

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom:200 * rpx,),
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              widget.live ? Container() : Container(
                padding: EdgeInsets.all(40 * rpx),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom:10 * rpx),
                      child: Text('竞猜结果', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      child: Text('若主播结错账，请联系主播协商处理。若主播不受理，请联系客服，官方将视情节对主播进行处罚。', style: TextStyle(color: Color(0xffA4A4A4), fontSize: 20 * rpx),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20 * rpx),
                padding: EdgeInsets.symmetric(horizontal:20 * rpx),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.help, size: 35 * rpx, color: Color(0xffA4A4A4A4),),
                    SizedBox(width: 10 * rpx,),
                    Text('什么是获胜赔率', style: TextStyle(color: Color(0xff555555), fontSize: 30 * rpx),)
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: data.map((item){
                    return dataWidget(item);
                  }).toList(),
                ),
              ),
              
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
                                Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),)
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
                                Text('100000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),)
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
  }


  // 下注数据Widget
  Widget dataWidget(item){
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
            margin: EdgeInsets.only(bottom:20 * rpx),
            padding: EdgeInsets.symmetric(horizontal:20 * rpx),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20 * rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            child: ClipPath(
                              clipper:LeftClipPath(),
                              child: Container(
                                width: 250 * rpx,
                                height: 200 * rpx,
                                padding: EdgeInsets.only(left:30*rpx),
                                decoration: BoxDecoration(
                                  gradient: panLinearColor(item, 0),
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10), bottomLeft:Radius.circular(10))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text('${item['AName']}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40 * rpx),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15 * rpx),
                                      child: Text.rich(TextSpan(
                                        style:TextStyle(color:Colors.white),
                                        children:[
                                        TextSpan(text:'获胜赔率 ', style:TextStyle(fontSize:20 * rpx)),
                                        TextSpan(text:' ${item['Apl']}', style:TextStyle(fontSize:30 * rpx, fontWeight:FontWeight.bold))
                                      ])),
                                    ),
                                    panXiaZhu(item, 0)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          item['status']  == 0 ?
                          Positioned(
                            right: 10 * rpx,
                            top:30 * rpx,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:20 * rpx),
                              decoration: BoxDecoration(
                                color: item['win'] == 0 ? Colors.red : Color(0xffC1C1C1) ,
                                border: Border.all(width:3 * rpx, color:Color(0xffFFFFFF)),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(item['win'] == 0 ? '胜' : '败',style: TextStyle(color: Colors.white, fontSize: 25 * rpx, fontWeight: FontWeight.bold),),
                            ),
                          )
                          :Container()
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200 * rpx,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('${item['title']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx,),),
                              panStatusText(item)
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            child: ClipPath(
                              clipper:RightClipPath(),
                              child: Container(
                                width: 250 * rpx,
                                height: 200 * rpx,
                                padding: EdgeInsets.only(right:30*rpx),
                                decoration: BoxDecoration(
                                  gradient: panLinearColor(item, 1),
                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10), bottomRight:Radius.circular(10))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text('${item['BName']}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40 * rpx),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15 * rpx),
                                      child: Text.rich(TextSpan(
                                        style:TextStyle(color:Colors.white),
                                        children:[
                                        TextSpan(text:'${item['Bpl']} ', style:TextStyle(fontSize:30 * rpx, fontWeight:FontWeight.bold)),
                                        TextSpan(text:' 获胜赔率', style:TextStyle(fontSize:20 * rpx)),
                                        
                                      ])),
                                    ),
                                    panXiaZhu(item, 1)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          item['status']  == 0 ?
                          Positioned(
                            left: 10 * rpx,
                            top:30 * rpx,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:20 * rpx),
                              decoration: BoxDecoration(
                                color: item['win'] == 1 ? Colors.red : Color(0xffC1C1C1),
                                border: Border.all(width:3 * rpx, color:Color(0xffFFFFFF)),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(item['win'] == 1 ? '胜' : '败',style: TextStyle(color: Colors.white, fontSize: 25 * rpx, fontWeight: FontWeight.bold),),
                            ),
                          )
                          :Container()
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50 * rpx,
                              decoration: BoxDecoration(
                                gradient: panLinearColor(item, 0),
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20), bottomLeft:Radius.circular(20))
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              height: 50 * rpx,
                              decoration: BoxDecoration(
                                gradient: panLinearColor(item, 1),
                                  borderRadius: BorderRadius.only(topRight:Radius.circular(20), bottomRight:Radius.circular(20))
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:20 * rpx),
                          height: 50 * rpx,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('11.1万', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text('124万', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          );
  }

  // 判断状态文字
  panStatusText(item){
    double rpx = MediaQuery.of(context).size.width / 750;

    switch (item['status']) {
      case 0:
        return Text('已结束', style: TextStyle( fontSize: 23 * rpx),);
        break;
      case 1:
        return  Text('06:12后封盘', style: TextStyle(color: Colors.red, fontSize: 23 * rpx),);
        break;
      case 2:
        return Text('已封盘', style: TextStyle( fontSize: 23 * rpx),);
        break;
      default:
    }
  }

  // 判断显示渐变背景色
  // 首先判断当前状态是否为结束，如果为结束，再去判断胜利的一方，如果没有结束则返回正常颜色
  panLinearColor(item, index){
    if(item['status'] != 0 ){
      return panIndexLinerColor(index);
    }else{
      if(item['win'] != '' && item['win'] == index){
        return panIndexLinerColor(index);
      }else{
        return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                colors: [
                  Color(0xffC1C1C1),
                  Color(0xffC1C1C1),
                ]);
      }
    }

  }

  // 根据下标返回渐变色
  panIndexLinerColor(index){
    if(index == 0){
        return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                colors: [
                  Color(0xffFD7186),
                  Color(0xffFFA65E),
                ]);
      }else{
        return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                colors: [
                  Color(0xff418DFF),
                  Color(0xff9582FF),
                ]);
      }
  }

  // 判断是否已下注 并且当前状态 是否可以继续投注
  panXiaZhu(item, index){
    double rpx = MediaQuery.of(context).size.width / 750;

    if(item['tindex'] == index){
      return Container(
                padding: EdgeInsets.symmetric(horizontal:20 * rpx, vertical: 5 * rpx),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 20 * rpx),
                    children:[
                      TextSpan(
                        text:'已下注 '
                      ),
                      TextSpan(
                        text:' ${item['tz']}',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ]
                  )
                )
              );
    }else{
      if(item['status'] == 1){
        return InkWell(
          child: Container(
                  padding: EdgeInsets.symmetric(horizontal:20 * rpx, vertical: 5 * rpx),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text('点击投注', style: TextStyle(fontSize: 20 * rpx),),
                ),
          onTap: showBottom
        );
      }else{
        return Container();
      }
    }
  }

  showBottom(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      isScrollControlled:true,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        double rpx = MediaQuery.of(context).size.width / 750;

        return StatefulBuilder(
          builder:(BuildContext context, setBottomState) {
            return 
                Container(
                  height: 1000 * rpx,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top:20 * rpx),
                        child: Column(
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.symmetric(vertical:10 * rpx),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 100 * rpx,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('哪方会赢得这场比赛？',textAlign: TextAlign.center, style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold,)),
                                ),
                                IconButton(
                                  icon: Icon(Icons.close, size: 50 * rpx,),
                                  color: Color(0xff000000),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 300 *rpx,
                            padding: EdgeInsets.symmetric(horizontal:80 * rpx),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  bottom: 0,
                                  width: 590 * rpx,
                                  height: 200 * rpx,
                                  child: Container(
                                    height: 300 * rpx,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xff418DFF),
                                                    Color(0xff9582FF),
                                                  ])
                                    ),
                                    child:Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top:50 * rpx),
                                          child: Text('利物浦', style: TextStyle(fontSize: 40 *rpx, color: Colors.white),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top:10 * rpx),
                                          child: Text.rich(
                                            TextSpan(
                                              style: TextStyle(fontSize: 25 * rpx, color: Colors.white),
                                              children:[
                                                TextSpan(text:'获胜赔率'),
                                                TextSpan(text:'1.78', style: TextStyle(fontWeight: FontWeight.bold)),
                                              ]
                                            )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  width: 590 * rpx,
                                  height: 130 * rpx,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Image.asset('assets/images/award.png', fit: BoxFit.cover,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical:30 *rpx),
                            padding: EdgeInsets.symmetric(horizontal:60 * rpx),
                            child:Container(
                              padding: EdgeInsets.symmetric(vertical:20 * rpx, horizontal:220 * rpx),
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text('请选择投注数额', style: TextStyle(color: Color(0xffCECECE), fontSize: 25 * rpx),),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:80 * rpx),
                            height: 140 * rpx,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top:10 * rpx),
                                  width: 590 * rpx,
                                  height: 20 * rpx,
                                  color: Color(0xffF5F5F5),
                                ),
                                Positioned(
                                  width: 590 * rpx,
                                  height: 120 * rpx,
                                  child: Container(
                                    height: 100 * rpx,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                width: 40 * rpx,
                                                margin: EdgeInsets.only(bottom: 20 *rpx),
                                                child:AspectRatio(
                                                  aspectRatio: 1/1,
                                                  child:  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Container(
                                                      color: _showBottomIndex == 0 ? Colors.red : Color(0xffF5F5F5) ,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              onTap: (){
                                                 setBottomState(() {     // 注意 改变showModalBottomState的数据(来源于StatefulBuilder)
                                                  this._showBottomIndex = 0;
                                                });
                                              },
                                            ),
                                            
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal:10 * rpx, vertical: 5*rpx),
                                              decoration: BoxDecoration(
                                                border: Border.all(width:1 * rpx, color:Colors.red),
                                                color: _showBottomIndex == 0 ? Colors.red : Colors.white ,
                                              ),
                                              child: Text('清空', style: TextStyle(color: _showBottomIndex == 0 ?  Colors.white : Colors.red , fontSize: 20 * rpx),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                width: 40 * rpx,
                                                margin: EdgeInsets.only(bottom: 20 *rpx),
                                                child:AspectRatio(
                                                  aspectRatio: 1/1,
                                                  child:  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Container(
                                                      color: _showBottomIndex == 1 ? Colors.red : Color(0xffF5F5F5) ,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              onTap: (){
                                                setBottomState(() {     // 注意 改变showModalBottomState的数据(来源于StatefulBuilder)
                                                  this._showBottomIndex = 1;
                                                });
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal:10 * rpx, vertical: 5*rpx),
                                              decoration: BoxDecoration(
                                                border: Border.all(width:1 * rpx, color:Colors.red),
                                                color: _showBottomIndex == 1 ? Colors.red : Colors.white ,
                                              ),
                                              child: Text('10', style: TextStyle(color: _showBottomIndex == 1 ?  Colors.white : Colors.red , fontSize: 20 * rpx),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                width: 40 * rpx,
                                                margin: EdgeInsets.only(bottom: 20 *rpx),
                                                child:AspectRatio(
                                                  aspectRatio: 1/1,
                                                  child:  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Container(
                                                      color: _showBottomIndex == 2 ? Colors.red : Color(0xffF5F5F5) ,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              onTap: (){
                                                setBottomState(() {     // 注意 改变showModalBottomState的数据(来源于StatefulBuilder)
                                                  this._showBottomIndex = 2;
                                                });
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal:10 * rpx, vertical: 5*rpx),
                                              decoration: BoxDecoration(
                                                border: Border.all(width:1 * rpx, color:Colors.red),
                                                color: _showBottomIndex == 2 ? Colors.red : Colors.white ,
                                              ),
                                              child: Text('100', style: TextStyle(color: _showBottomIndex == 2 ?  Colors.white : Colors.red , fontSize: 20 * rpx),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                width: 40 * rpx,
                                                margin: EdgeInsets.only(bottom: 20 *rpx),
                                                child:AspectRatio(
                                                  aspectRatio: 1/1,
                                                  child:  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Container(
                                                      color: _showBottomIndex == 3 ? Colors.red : Color(0xffF5F5F5) ,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              onTap: (){
                                                setBottomState(() {     // 注意 改变showModalBottomState的数据(来源于StatefulBuilder)
                                                  this._showBottomIndex = 3;
                                                });
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal:10 * rpx, vertical: 5*rpx),
                                              decoration: BoxDecoration(
                                                border: Border.all(width:1 * rpx, color:Colors.red),
                                                color: _showBottomIndex == 3 ? Colors.red : Colors.white ,
                                              ),
                                              child: Text('1000', style: TextStyle(color: _showBottomIndex == 3 ?  Colors.white : Colors.red , fontSize: 20 * rpx),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                width: 40 * rpx,
                                                margin: EdgeInsets.only(bottom: 20 *rpx),
                                                child:AspectRatio(
                                                  aspectRatio: 1/1,
                                                  child:  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Container(
                                                      color: _showBottomIndex == 4 ? Colors.red : Color(0xffF5F5F5) ,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              onTap: (){
                                                setBottomState(() {     // 注意 改变showModalBottomState的数据(来源于StatefulBuilder)
                                                  this._showBottomIndex = 4;
                                                });
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal:10 * rpx, vertical: 5*rpx),
                                              decoration: BoxDecoration(
                                                border: Border.all(width:1 * rpx, color:Colors.red),
                                                color: _showBottomIndex == 4 ? Colors.red : Colors.white ,
                                              ),
                                              child: Text('10000', style: TextStyle(color: _showBottomIndex == 4 ?  Colors.white : Colors.red , fontSize: 20 * rpx),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                width: 40 * rpx,
                                                margin: EdgeInsets.only(bottom: 20 *rpx),
                                                child:AspectRatio(
                                                  aspectRatio: 1/1,
                                                  child:  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Container(
                                                      color: _showBottomIndex == 5 ? Colors.red : Color(0xffF5F5F5) ,
                                                    ),
                                                  ),
                                                )
                                              ),
                                              onTap: (){
                                                setBottomState(() {     // 注意 改变showModalBottomState的数据(来源于StatefulBuilder)
                                                  this._showBottomIndex = 5;
                                                });
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal:10 * rpx, vertical: 5*rpx),
                                              decoration: BoxDecoration(
                                                border: Border.all(width:1 * rpx, color:Colors.red),
                                                color: _showBottomIndex == 5 ? Colors.red : Colors.white ,
                                              ),
                                              child: Text('全部', style: TextStyle(color: _showBottomIndex == 5 ?  Colors.white : Colors.red , fontSize: 20 * rpx),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Text('胜利后预计获得', style: TextStyle(fontSize: 35 * rpx),),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical:20*rpx),
                            child: Text('0', style: TextStyle(fontSize: 40 * rpx, color: Color(0xffCECECE),)),
                          ),
                          Container(
                            child: Text('以封盘时的赔率为准，结算收益', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffCECECE),)),
                          )
                        ],
                      ),
                      ),
                      Positioned(
                        width: 750 * rpx,
                        height: 130 * rpx,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:40 * rpx),
                          color: Color(0xffF5F5F5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(right: 10 *rpx),
                                      width: 50 * rpx,
                                      child:Image.asset('assets/images/jb2.png', fit: BoxFit.contain),
                                    ),
                                    Text('0', style: TextStyle(fontSize:40 * rpx, fontWeight: FontWeight.bold,))
                                  ],
                                ),
                              ),
                              Container(
                                child: RaisedButton(
                                  child: Text('投注', style: TextStyle(fontSize:25 * rpx),),
                                  textColor: Colors.white,
                                  highlightColor:Color(0xffDFDFDF),
                                  color:Color(0xffDFDFDF),
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
                        ),
                      )
                    ],
                  )
                );
      
          }
        );
        
      });
  }

}


// 左边切割
class LeftClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    // 线到（`lineTo`）方法，添加从当前点到给定点的直线段。
    // 起点变量。
    path.lineTo(size.width - 30.0 , 0.0);
    // 终点变量。
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// 右边切割
class RightClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    // 线到（`lineTo`）方法，添加从当前点到给定点的直线段。
    // 起点变量。
    // path(0.0 + 30.0 , size.height);
    path.moveTo(0.0 + 30.0, 0.0);
    // 终点变量。
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width,0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
 