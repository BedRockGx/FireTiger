import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

// 赛事走马灯 组件页面


class HorseLantern extends StatefulWidget {
  @override
  _HorseLanternState createState() => _HorseLanternState();
}

class _HorseLanternState extends State<HorseLantern> {
  @override
  Widget build(BuildContext context) {
    return 
          SingleChildScrollView(
              scrollDirection :Axis.horizontal,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                child: Row(   
                  children: [

                    Container(
                    width: ScreenAdapter.setWidth(450),
                    decoration: BoxDecoration(
                      border:Border.all(width: 1, color: Color(0xffEBEBEB))
                    ),
                    child: Column(
                      children: <Widget>[
                      Container(
                          color: Color(0xffF5F5F5),
                          padding: EdgeInsets.all(ScreenAdapter.setHeight(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                                    Container(
                                      margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                                      color: Theme.of(context).primaryColor,
                                      child: Text('英超', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                                    ),
                                    Container(
                                      child: Text('比赛直播中', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                                    )
                                  ],
                                ),
                              ),
                              Text('第26轮', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                            ],
                          ),
                        ),
                       
                       Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(15)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(90),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(70),
                                      height: ScreenAdapter.setHeight(50),
                                      child:Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit:BoxFit.contain)
                                    ),
                                    SizedBox(height: ScreenAdapter.setHeight(10),),
                                    Text('阿森纳', style: TextStyle(fontSize: ScreenAdapter.size(23)))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  child: Text('99', style: TextStyle(fontSize: ScreenAdapter.size(60), color:Color(0xff333333), fontWeight: FontWeight.bold)),
                                )
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(10), 0, ScreenAdapter.setHeight(10), ScreenAdapter.setHeight(20)),
                                child: Text(':', style: TextStyle(fontSize: ScreenAdapter.size(50))),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  child: Text('99', style: TextStyle(fontSize: ScreenAdapter.size(60), color:Color(0xff333333), fontWeight: FontWeight.bold),),
                                )
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(100),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(80),
                                      height: ScreenAdapter.setHeight(60),
                                      child:Image.network('https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg', fit:BoxFit.contain)
                                    ),
                                    SizedBox(height: ScreenAdapter.setHeight(10),),
                                    Text('纽卡斯尔', style: TextStyle(fontSize: ScreenAdapter.size(23)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ),

                    Container(
                    width: ScreenAdapter.setWidth(450),
                    decoration: BoxDecoration(
                      border:Border.all(width: 1, color: Color(0xffEBEBEB))
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Color(0xffF5F5F5),
                          padding: EdgeInsets.all(ScreenAdapter.setHeight(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                                    Container(
                                      margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                                      // color: Theme.of(context).primaryColor,
                                      color:Color(0xff9D9D9D),
                                      child: Text('NBA', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                                    ),
                                    Container(
                                      child: Text('比赛已结束', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                                    )
                                  ],
                                ),
                              ),
                              Text('第26轮', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(15)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(90),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(70),
                                      height: ScreenAdapter.setHeight(50),
                                      child:Image.network('https://bkimg.cdn.bcebos.com/pic/3ac79f3df8dcd100aa5069327d8b4710b8122fd0?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit:BoxFit.contain)
                                    ),
                                    SizedBox(height: ScreenAdapter.setHeight(10),),
                                    Text('火箭', style: TextStyle(fontSize: ScreenAdapter.size(23)))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  child: Text('76', style: TextStyle(fontSize: ScreenAdapter.size(60), color:Color(0xff333333), fontWeight: FontWeight.bold)),
                                )
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(10), 0, ScreenAdapter.setHeight(10), ScreenAdapter.setHeight(20)),
                                child: Text(':', style: TextStyle(fontSize: ScreenAdapter.size(50))),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  child: Text('79', style: TextStyle(fontSize: ScreenAdapter.size(60), color:Color(0xff333333), fontWeight: FontWeight.bold),),
                                )
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(100),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(80),
                                      height: ScreenAdapter.setHeight(60),
                                      child:Image.network('https://bkimg.cdn.bcebos.com/pic/d788d43f8794a4c230eda89504f41bd5ac6e3945?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit:BoxFit.contain)
                                    ),
                                    SizedBox(height: ScreenAdapter.setHeight(10),),
                                    Text('湖人', style: TextStyle(fontSize: ScreenAdapter.size(23)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ),

                    Container(
                    width: ScreenAdapter.setWidth(450),
                    decoration: BoxDecoration(
                      border:Border.all(width: 1, color: Color(0xffEBEBEB))
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Color(0xffF5F5F5),
                          padding: EdgeInsets.all(ScreenAdapter.setHeight(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                                    Container(
                                      margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                      padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                                      color: Theme.of(context).primaryColor,
                                      child: Text('LPL', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                                    ),
                                    Container(
                                      child: Text('比赛直播中', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                                    )
                                  ],
                                ),
                              ),
                              Text('第4局', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(15)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(90),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(70),
                                      height: ScreenAdapter.setHeight(50),
                                      child:Image.network('https://bkimg.cdn.bcebos.com/pic/728da9773912b31b7c78cc758f18367adab4e152?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit:BoxFit.contain)
                                    ),
                                    SizedBox(height: ScreenAdapter.setHeight(10),),
                                    Text('EDG', style: TextStyle(fontSize: ScreenAdapter.size(23)))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  child: Text('1', style: TextStyle(fontSize: ScreenAdapter.size(60), color:Color(0xff333333), fontWeight: FontWeight.bold)),
                                )
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(10), 0, ScreenAdapter.setHeight(10), ScreenAdapter.setHeight(20)),
                                child: Text(':', style: TextStyle(fontSize: ScreenAdapter.size(50))),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                  child: Text('2', style: TextStyle(fontSize: ScreenAdapter.size(60), color:Color(0xff333333), fontWeight: FontWeight.bold),),
                                )
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(100),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(80),
                                      height: ScreenAdapter.setHeight(60),
                                      child:Image.network('https://bkimg.cdn.bcebos.com/pic/94cad1c8a786c917e23977d9c73d70cf3bc75713?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit:BoxFit.contain)
                                    ),
                                    SizedBox(height: ScreenAdapter.setHeight(10),),
                                    Text('RNG', style: TextStyle(fontSize: ScreenAdapter.size(23)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ),
                  ]
                ),
              ),
            );
        
  }
}