import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ExpertHomePage extends StatefulWidget {
  @override
  _ExpertHomePageState createState() => _ExpertHomePageState();
}

class _ExpertHomePageState extends State<ExpertHomePage> {

  var str = '展开';
  var _manLines = 2;
  var strVal = '按时看见的哈就开始登记哈数据库的拿去玩家可开启就看见奥斯卡的理解阿里看到迦拉克隆大立科技看了';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('专家主页', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
          userData(),
          GreyDivider(),
          saleProgramme(),
          GreyDivider(),
          oldProgramme(),
        ],
      ),
    );
  }


  // 头部
  Widget userData(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child:Column(
              children: <Widget>[
                 Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                      child: ImageRoud('https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3321238736,733069773&fm=26&gp=0.jpg', 50),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('潘帕斯麻雀',maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: ScreenAdapter.size(30)),),
                          ),
                          Container(
                            child: Text('粉丝：2人   发布：307', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                          )
                        ],
                      ),
                    ),
                    Container(
                        // width: ScreenAdapter.setWidth(220),
                        // height: ScreenAdapter.setHeight(50),
                        margin: EdgeInsets.only(left:ScreenAdapter.setWidth(15)),
                        child: RaisedButton(
                          child: Text('+关注', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
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
                      )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                  child: Text.rich(
                          TextSpan(
                            children:[
                              strVal.length > 22 ? WidgetSpan(
                                child: InkWell(
                                  child: Text(str, style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                                  onTap: (){
                                    if(_manLines ==  2){
                                      setState(() {
                                        str = '收起';
                                        _manLines = 10;
                                      });
                                    }else{
                                      setState(() {
                                        str = '展开';
                                        _manLines = 2;
                                      });
                                    }
                                    
                                  },
                                )
                              ) : TextSpan(text: ''),
                              TextSpan(
                                text:'$strVal',
                                style: TextStyle(
                                  fontSize: ScreenAdapter.size(30),
                                ),
                              ),
                            ]
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: _manLines,
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenAdapter.setHeight(40), bottom:ScreenAdapter.setHeight(20)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: '156', style: TextStyle(fontSize: ScreenAdapter.size(48), fontWeight: FontWeight.bold)),
                                    TextSpan(text: '篇', style: TextStyle(fontSize: ScreenAdapter.size(28)))
                                  ]
                                ),
                              )
                            ),
                            SizedBox(
                              height: ScreenAdapter.setHeight(10),
                            ),
                            Text('发布', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: '10', style: TextStyle(fontSize: ScreenAdapter.size(48), fontWeight: FontWeight.bold)),
                                    TextSpan(text: '篇', style: TextStyle(fontSize: ScreenAdapter.size(28))),
                                    TextSpan(text: '10', style: TextStyle(fontSize: ScreenAdapter.size(48), fontWeight: FontWeight.bold)),
                                  ]
                                ),
                              )
                            ),
                            SizedBox(
                              height: ScreenAdapter.setHeight(10),
                            ),
                            Text('近10场', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: '83', style: TextStyle(fontSize: ScreenAdapter.size(48), fontWeight: FontWeight.bold)),
                                    TextSpan(text: '%', style: TextStyle(fontSize: ScreenAdapter.size(28))),
                                  ]
                                ),
                              )
                            ),
                            SizedBox(
                              height: ScreenAdapter.setHeight(10),
                            ),
                            Text('周命中率', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: '10', style: TextStyle(fontSize: ScreenAdapter.size(48), fontWeight: FontWeight.bold)),
                                    TextSpan(text: '连红', style: TextStyle(fontSize: ScreenAdapter.size(28))),
                                  ]
                                ),
                              )
                            ),
                            SizedBox(
                              height: ScreenAdapter.setHeight(10),
                            ),
                            Text('近期连红', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          );
  }

  // 在售方案
  Widget saleProgramme(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('在售方案(共1篇)', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: EdgeInsets.only(top:ScreenAdapter.setHeight(30)),
                  // decoration: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(
                  //       width: ScreenAdapter.setWidth(1),
                  //       color: Color(0xffEBEBEB)
                  //       // color: Colors.red
                  //     )
                  //   )
                  // ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(200, 200, 200, 0.1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20), horizontal:ScreenAdapter.setWidth(40)),
                              child: Text('主流联赛周末持续盈利！德甲本周一周双赛提前送胆', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                              color: Color(0xffEBEBEB),
                              width: double.infinity,
                              height: ScreenAdapter.setHeight(1),
                              // child:
                            ),
                            Container(
                              padding: EdgeInsets.only(left:ScreenAdapter.setWidth(40),top:ScreenAdapter.setHeight(20),  bottom: ScreenAdapter.setHeight(20)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                                    child: ImageRoud('https://bkimg.cdn.bcebos.com/pic/728da9773912b31babe91c558c18367adbb4e1c1?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 40),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text('RNG vs EDG', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                        ),
                                        Container(
                                          child: Text('19/20赛季欧冠半决赛 2020-5-17 18:00', style:TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: ScreenAdapter.setWidth(100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft: Radius.circular(20)),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xffE1CD92),
                                            Color(0xffBFA764),
                                          ])
                                    ),
                                    padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                    child: Container(
                                      child: Text('让球', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                                    )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('半小时前发布', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text('30', style: TextStyle(color: Color(0xffD9C487), fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(40))),
                                  Text('火虎币', style: TextStyle(color: Color(0xffD9C487), fontSize: ScreenAdapter.size(25)))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          );
  }

  // 历史方案
  Widget oldProgramme(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('历史方案(共2篇)', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: ScreenAdapter.setWidth(1),
                            color: Color(0xffEBEBEB)
                            // color: Colors.red
                          )
                        )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(200, 200, 200, 0.1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20), horizontal:ScreenAdapter.setWidth(40)),
                                  child: Text('主流联赛周末持续盈利！德甲本周一周双赛提前送胆', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
                                  color: Color(0xffEBEBEB),
                                  width: double.infinity,
                                  height: ScreenAdapter.setHeight(1),
                                  // child:
                                ),
                                Container(
                                  padding: EdgeInsets.only(left:ScreenAdapter.setWidth(40),top:ScreenAdapter.setHeight(20),  bottom: ScreenAdapter.setHeight(20)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                                        child: ImageRoud('https://bkimg.cdn.bcebos.com/pic/728da9773912b31babe91c558c18367adbb4e1c1?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 40),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text('RNG vs EDG', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                            ),
                                            Container(
                                              child: Text('19/20赛季欧冠半决赛 2020-5-17 18:00', style:TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: ScreenAdapter.setWidth(100),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft: Radius.circular(20)),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xffE1CD92),
                                                Color(0xffBFA764),
                                              ])
                                        ),
                                        padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                        child: Container(
                                          child: Text('竞彩单关', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('半小时前发布', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                                Container(
                                  child: Image.asset('assets/images/hd.png')
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          );
  }
}