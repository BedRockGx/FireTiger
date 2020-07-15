import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class GoalTableDetails extends StatefulWidget {
  var arguments;
  GoalTableDetails(arguments);
  @override
  _GoalTableDetailsState createState() => _GoalTableDetailsState();
}

class _GoalTableDetailsState extends State<GoalTableDetails> {

  List<Map> siderBarList =  [
    {'title':'欧宝', 'code':0},
    {'title':'皇冠', 'code':1},
  ];

  var siderBarIndex = 0;

  List<Map> dataList = [
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
    {'dq':0.82, 'jq':2.5, 'xq':0.97, 'time':'06.20 13:04'},
    {'dq':0.85, 'jq':1.5, 'xq':0.95, 'time':'06.20 13:04'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('进球数指数变化', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
      body:Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('公司',style: TextStyle(fontSize: ScreenAdapter.size(20) )),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text('大球', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                                    // margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25)),
                                  ),
                                  SizedBox(width: ScreenAdapter.setWidth(20),),
                                  Text('进球数', style: TextStyle(fontSize: ScreenAdapter.size(20)),)
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: ScreenAdapter.setWidth(70),
                                    child: Text('小球', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text('进球时间', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
             ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height
              ),
              child:Container(
                // padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(400)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child:  ListView(
                          children: siderBarList.map((item){
                            return InkWell(
                              child: Container(
                                padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                                color: siderBarIndex == item['code'] ? Colors.white : Color(0xffEAEAEA),
                                alignment: Alignment.centerRight,
                                child: Text('${item['title']}', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight:siderBarIndex == item['code'] ? FontWeight.bold : FontWeight.normal),),
                              ),
                              onTap: (){
                                setState(() {
                                  siderBarIndex = item['code'];
                                });
                              },
                            );
                          }).toList()
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                        color: Colors.white,
                        child: ListView(
                          children: dataList.map((item){
                            return Container(
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(35)),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text('${item['dq']}', style: TextStyle(fontSize: ScreenAdapter.size(25),color: Color(0xff569A3E)),),
                                          // margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                                        ),
                                        SizedBox(width: ScreenAdapter.setWidth(20),),
                                        Text('${item['jq']}', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          width: ScreenAdapter.setWidth(70),
                                          child: Text('${item['xq']}', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Text('${item['time']}', style: TextStyle(fontSize: ScreenAdapter.size(25),)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList()
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      )
      
    );
  }
}