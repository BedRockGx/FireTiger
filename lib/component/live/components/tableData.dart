import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {

  List<Map> _selectExpandedBarData ;
  List<Map> _selectExpandedBarData2 ;
  List<Map> _selectExpandedBarData3 ;
  int highlight;
  int highlight2;
  int highlight3;

  @override
  void initState() {
    super.initState();
    _selectExpandedBarData = [
      {'title':'让球', 'code':1},
      {'title':'欧指', 'code':2},
      {'title':'大小球', 'code':3},
    ];
    _selectExpandedBarData2 = [
      {'title':'基本面', 'code':1},
      {'title':'盘面', 'code':2},
      {'title':'技术面', 'code':3},
    ];
    _selectExpandedBarData3 = [
      {'title':'总', 'code':1},
      {'title':'主', 'code':2},
      {'title':'客', 'code':3},
    ];
    highlight = 1;
    highlight2 = 1;
    highlight3 = 1;
  }


  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return Column(
      children: <Widget>[
          // 表1
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30 *rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 500 * rpx,
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
                                  // selectProvider.setBarIndex(item['code']);
                                },
                              ));
                        }).toList()),
                      ),
                    ],
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(150 * rpx),
                    1: FixedColumnWidth(280 * rpx),
                    2: FixedColumnWidth(320 * rpx),
                  },
                  border: TableBorder(
                    bottom: BorderSide(width:1 * rpx, color: Colors.black12),
                    horizontalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                    verticalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Color(0xffEBEBEB)
                      ),
                      children: [
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('公司', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),)),
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('初盘', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))))),
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('即时盘', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                      ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('欧宝', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 * rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0.90', style: TextStyle(fontSize: 25*rpx),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal:30 * rpx),
                                child: Text('4/4.5', style: TextStyle(fontSize: 25*rpx),),
                              ),
                              Text('0.90', style: TextStyle(fontSize: 25*rpx),)
                            ],
                          ),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0.90', style: TextStyle(fontSize: 25*rpx),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal:30 * rpx),
                                child: Text('4/4.5', style: TextStyle(fontSize: 25*rpx, color: Color(0xff60B343)),),
                              ),
                              Container(
                                // margin: EdgeInsets.only(right:30 * rpx),
                                child: Text('0.90', style: TextStyle(fontSize: 25*rpx,),),
                              ),
                              InkWell(
                                child: Icon(Icons.chevron_right, size: 40 * rpx, color: Color(0xffCACACA),),
                                onTap: (){
                                  
                                },
                              )
                            ],
                          ),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('欧宝', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 * rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0.90', style: TextStyle(fontSize: 25*rpx),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal:30 * rpx),
                                child: Text('4/4.5', style: TextStyle(fontSize: 25*rpx),),
                              ),
                              Text('0.90', style: TextStyle(fontSize: 25*rpx),)
                            ],
                          ),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0.90', style: TextStyle(fontSize: 25*rpx),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal:30 * rpx),
                                child: Text('4/4.5', style: TextStyle(fontSize: 25*rpx, color: Color(0xff60B343)),),
                              ),
                              Container(
                                // margin: EdgeInsets.only(right:30 * rpx),
                                child: Text('0.90', style: TextStyle(fontSize: 25*rpx,),),
                              ),
                              InkWell(
                                child: Icon(Icons.chevron_right, size: 40 * rpx, color: Color(0xffCACACA),),
                                onTap: (){
                                  
                                },
                              )
                            ],
                          ),)),
                        ]
                    ),
                  ],
                )
              ],
            ),
          ),
          // 联赛积分
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20 *rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 500 * rpx,
                        padding: EdgeInsets.all(10 * rpx),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            children: _selectExpandedBarData2.map((item) {
                          return Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10 * rpx),
                                  decoration: BoxDecoration(
                                      color: highlight2 == item['code']
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Text(
                                    item['title'],
                                    style: TextStyle(
                                        fontSize: 25 * rpx ,
                                        color: highlight2 == item['code']
                                            ? Color(0xff333333)
                                            : Colors.white),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    highlight2 = item['code'];
                                  });
                                  // selectProvider.setBarIndex(item['code']);
                                },
                              ));
                        }).toList()),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical:10 * rpx, horizontal:40*rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('联赛积分', style: TextStyle(fontSize:  30 * rpx, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Row(
                          children: _selectExpandedBarData3.map((item){
                            return InkWell(
                              child: Container(
                                margin: item['code'] == 2 ? EdgeInsets.symmetric(horizontal: 25 * rpx) : EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: highlight3 == item['code'] ? BorderSide(width: 1 * rpx, color: Colors.red) : BorderSide.none
                                  )
                                ),
                                child: Text('${item['title']}', style: TextStyle(fontSize: 25 * rpx, color:highlight3 == item['code'] ? Colors.red : Colors.black),),
                              ),
                              onTap: (){
                                setState(() {
                                  highlight3 = item['code'];
                                });
                              },
                            );
                          }).toList()
                        ),
                      )
                    ],
                  ),
                ),

                Table(
                  columnWidths: {
                    0: FixedColumnWidth(250 * rpx),
                    1: FixedColumnWidth(125 * rpx),
                    2: FixedColumnWidth(125 * rpx),
                    3: FixedColumnWidth(125 * rpx),
                    4: FixedColumnWidth(125 * rpx),
                  },
                  border: TableBorder(
                    bottom: BorderSide(width:1 * rpx, color: Colors.black12),
                    horizontalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                    verticalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Color(0xffEBEBEB)
                      ),
                      children: [
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('球队', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('胜/平/负', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('进/失', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('积分', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                        TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('排名', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                      ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('图谱恩斯', textAlign: TextAlign.center, style: TextStyle( fontSize: 25 * rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Text('0/0/4', textAlign: TextAlign.center, style: TextStyle(fontSize: 25*rpx),))),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('2/13', textAlign: TextAlign.center, style: TextStyle(fontSize: 25*rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('0',  textAlign: TextAlign.center,style: TextStyle(fontSize: 25*rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('7',  textAlign: TextAlign.center,style: TextStyle(fontSize: 25*rpx, color: Colors.red),),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('台湾电力', textAlign: TextAlign.center, style: TextStyle( fontSize: 25 * rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Text('4/1/0',  textAlign: TextAlign.center,style: TextStyle(fontSize: 25*rpx),))),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('12/3',  textAlign: TextAlign.center,style: TextStyle(fontSize: 25*rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('13',  textAlign: TextAlign.center,style: TextStyle(fontSize: 25*rpx),),)),
                          TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('1',  textAlign: TextAlign.center,style: TextStyle(fontSize: 25*rpx, color: Colors.red,),))),
                        ]
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical:30 * rpx),
                  decoration: BoxDecoration(
                    border: Border(
                                bottom: BorderSide(width: 1 * rpx, color: Color(0xffEBEBEB))
                              )
                  ),
                  child: Text('查看更多', style: TextStyle(color: Color(0xffA4A4A4), fontSize:  20 *rpx),),
                )
              ],
            ),
          ),
          // 历史交锋
          Container(
            margin: EdgeInsets.only(top:20 * rpx),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical:10 * rpx, horizontal:40*rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('历史交锋', style: TextStyle(fontSize:  30 * rpx, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text('同主客', style: TextStyle(fontSize: 20 * rpx, color:Color(0xffA4A4A4),)),
                      )
                    ],
                  ),
                ),
              


                Container(
                  padding: EdgeInsets.symmetric(horizontal:20 * rpx),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 30 * rpx,
                        child: Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.contain,),
                      ),
                      Container(
                        width: 60 * rpx,
                        margin: EdgeInsets.symmetric(horizontal: 10 *rpx),
                        child: Column(
                          children: <Widget>[
                            Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),),
                            Container(
                              margin: EdgeInsets.symmetric(vertical:5 * rpx),
                              width: double.infinity,
                              height: 15 * rpx,
                              decoration: BoxDecoration(
                                color: Color(0xff0074FF),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Text('胜', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                          ],
                        ),
                      ),
                      Container(
                        width: 60 * rpx,
                        margin: EdgeInsets.only(right: 10 *rpx),
                        child: Column(
                          children: <Widget>[
                            Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),),
                            Container(
                              margin: EdgeInsets.symmetric(vertical:5 * rpx),
                              width: double.infinity,
                              height: 15 * rpx,
                              decoration: BoxDecoration(
                                color: Color(0xffEBEBEB),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Text('平', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 10 *rpx),
                          child:Column(
                            children: <Widget>[
                              Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 * rpx),),
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5 * rpx),
                                width: double.infinity,
                                height: 15 * rpx,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFAC3A),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              Text('胜', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                            ],
                          ),
                        )
                      ),
                      Container(
                        width: 30 * rpx,
                        child: Image.network('https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg', fit: BoxFit.contain,),
                      ),
                    ],
                  ),
                ),

                Table(
                        columnWidths: {
                          0: FixedColumnWidth(200 * rpx),
                          1: FixedColumnWidth(120 * rpx),
                          2: FixedColumnWidth(300 * rpx),
                          3: FixedColumnWidth(150 * rpx),
                        },
                        border: TableBorder(
                          bottom: BorderSide(width:1 * rpx, color: Colors.black12),
                          horizontalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                          verticalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Color(0xffEBEBEB)
                            ),
                            children: [
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('时间', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('联赛', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('比赛', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('盘路', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                              
                            ]
                          ),
                          TableRow(
                              children: [
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('19/07/21', textAlign: TextAlign.center, style: TextStyle( fontSize: 30 * rpx, color: Color(0xffA4A4A4)),),)),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Text('中台联', textAlign: TextAlign.center, style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('图谱恩斯',  style: TextStyle(fontSize: 25*rpx),),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:5 * rpx),
                                      child: Column(
                                        children: <Widget>[
                                          Text('0-3', style: TextStyle(fontSize: 20*rpx),),
                                          Text('(0-1)', style: TextStyle(fontSize: 20*rpx, color: Color(0xffA4A4A4)),),
                                        ],
                                      ),
                                    ),
                                    
                                    Text('台湾电力',  style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),),
                                  ],
                                ))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:
                                  Container(
                                    padding: EdgeInsets.all(10 * rpx),
                                    margin: EdgeInsets.only(right:10 * rpx),
                                    decoration: BoxDecoration(
                                      color: Color(0xff55AE36),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('输',  style: TextStyle(fontSize: 20*rpx, color: Colors.white)),
                                        SizedBox(width: 5 * rpx,),
                                        Text('-1.75',  style: TextStyle(fontSize: 20*rpx, color:Colors.white)),
                                      ],
                                    ),
                                  )
                                )),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('19/07/21', textAlign: TextAlign.center, style: TextStyle( fontSize: 30 * rpx, color: Color(0xffA4A4A4)),),)),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Text('中台联', textAlign: TextAlign.center, style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('图谱恩斯',  style: TextStyle(fontSize: 25*rpx),),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:5 * rpx),
                                      child: Column(
                                        children: <Widget>[
                                          Text('0-3', style: TextStyle(fontSize: 20*rpx),),
                                          Text('(0-1)', style: TextStyle(fontSize: 20*rpx, color: Color(0xffA4A4A4)),),
                                        ],
                                      ),
                                    ),
                                    
                                    Text('台湾电力',  style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),),
                                  ],
                                ))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:
                                  Container(
                                    padding: EdgeInsets.all(10 * rpx),
                                    margin: EdgeInsets.only(right:10 * rpx),
                                    decoration: BoxDecoration(
                                      color: Color(0xff55AE36),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('输',  style: TextStyle(fontSize: 20*rpx, color: Colors.white)),
                                        SizedBox(width: 5 * rpx,),
                                        Text('-1.75',  style: TextStyle(fontSize: 20*rpx, color:Colors.white)),
                                      ],
                                    ),
                                  )
                                )),
                              ]
                          ),
                        ],
                      ),
              ],
            ),
          ),
          // 近期战绩
          Container(
            margin: EdgeInsets.only(bottom:50 * rpx, top:20 * rpx),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical:10 * rpx, horizontal:40*rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('近期战绩', style: TextStyle(fontSize:  30 * rpx, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text('同赛事  |  同主客', style: TextStyle(fontSize: 20 * rpx, color:Color(0xffA4A4A4),)),
                      )
                    ],
                  ),
                ),
                Table(
                        columnWidths: {
                          0: FixedColumnWidth(320 * rpx),
                          1: FixedColumnWidth(300 * rpx),
                          2: FixedColumnWidth(150 * rpx),
                        },
                        border: TableBorder(
                          horizontalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                          verticalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Color(0xffEBEBEB)
                            ),
                            children: [
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left:20*rpx, right: 10 *rpx),
                                    width: 30 * rpx,
                                    child: Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.contain,),
                                  ),
                                  Text('图谱恩斯', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)))
                                ],
                              ),)),
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('比赛', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                              TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('盘路', textAlign: TextAlign.center, style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4))),)),
                              
                            ]
                          ),
                        ],
                      ),

                Table(
                        columnWidths: {
                          0: FixedColumnWidth(200 * rpx),
                          1: FixedColumnWidth(120 * rpx),
                          2: FixedColumnWidth(300 * rpx),
                          3: FixedColumnWidth(150 * rpx),
                        },
                        border: TableBorder(
                          bottom: BorderSide(width:1 * rpx, color: Colors.black12),
                          horizontalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                          verticalInside: BorderSide(width:1 * rpx, color: Colors.black12),
                        ),
                        children: [
                          TableRow(
                              children: [
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('19/07/21', textAlign: TextAlign.center, style: TextStyle( fontSize: 30 * rpx, color: Color(0xffA4A4A4)),),)),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Text('中台联', textAlign: TextAlign.center, style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('图谱恩斯',  style: TextStyle(fontSize: 25*rpx),),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:5 * rpx),
                                      child: Column(
                                        children: <Widget>[
                                          Text('0-3', style: TextStyle(fontSize: 20*rpx),),
                                          Text('(0-1)', style: TextStyle(fontSize: 20*rpx, color: Color(0xffA4A4A4)),),
                                        ],
                                      ),
                                    ),
                                    
                                    Text('台湾电力',  style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),),
                                  ],
                                ))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:
                                  Container(
                                    padding: EdgeInsets.all(10 * rpx),
                                    margin: EdgeInsets.only(right:10 * rpx),
                                    decoration: BoxDecoration(
                                      color: Color(0xff55AE36),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('输',  style: TextStyle(fontSize: 20*rpx, color: Colors.white)),
                                        SizedBox(width: 5 * rpx,),
                                        Text('-1.75',  style: TextStyle(fontSize: 20*rpx, color:Colors.white)),
                                      ],
                                    ),
                                  )
                                )),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child: Text('19/07/21', textAlign: TextAlign.center, style: TextStyle( fontSize: 30 * rpx, color: Color(0xffA4A4A4)),),)),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Text('中台联', textAlign: TextAlign.center, style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('图谱恩斯',  style: TextStyle(fontSize: 25*rpx),),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal:5 * rpx),
                                      child: Column(
                                        children: <Widget>[
                                          Text('0-3', style: TextStyle(fontSize: 20*rpx),),
                                          Text('(0-1)', style: TextStyle(fontSize: 20*rpx, color: Color(0xffA4A4A4)),),
                                        ],
                                      ),
                                    ),
                                    
                                    Text('台湾电力',  style: TextStyle(fontSize: 25*rpx, color: Color(0xffA4A4A4)),),
                                  ],
                                ))),
                                TableCell(child: Container(margin:EdgeInsets.all(20 *rpx), child:
                                  Container(
                                    padding: EdgeInsets.all(10 * rpx),
                                    margin: EdgeInsets.only(right:10 * rpx),
                                    decoration: BoxDecoration(
                                      color: Color(0xff55AE36),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('输',  style: TextStyle(fontSize: 20*rpx, color: Colors.white)),
                                        SizedBox(width: 5 * rpx,),
                                        Text('-1.75',  style: TextStyle(fontSize: 20*rpx, color:Colors.white)),
                                      ],
                                    ),
                                  )
                                )),
                              ]
                          ),
                        ],
                      ),
              ],
            ),
          )

          
      ],
    );
  }
}