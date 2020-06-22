import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/Alert.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProgrammePay extends StatefulWidget {
  @override
  _ProgrammePayState createState() => _ProgrammePayState();
}

class _ProgrammePayState extends State<ProgrammePay> {

  var mz = true;
  int gl = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('方案详情', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(100)),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                      child: Column(
                        children: <Widget>[
                          userData(),
                          Container(
                            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                            alignment: Alignment.centerLeft,
                            child: Text('韩挑联：附赠参考比分和进球数', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                            alignment: Alignment.centerRight,
                            child: Text('2020-05-18 10:00 发布', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                          )
                        ],
                      ),
                    ),
                    match(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(30), vertical: ScreenAdapter.setHeight(20)),
                            child: Text('推荐理由', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                          ),
                          Container(
                            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由推荐理由', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                          )
                        ],
                      ),
                    ),
                    !mz ? coutDown() : Text(''),
                  ],
                ),
              ),
              !mz ?  Positioned(
                width: ScreenAdapter.setWidth(750),
                height: ScreenAdapter.setHeight(100),
                bottom: 0,
                child: Container(
                  color: Color(0xffE3E3E3),
                  // padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(n)),
                  // width: ScreenAdapter.setWidth(750),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('45火花查看/首单不中包退', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                      RaisedButton(
                          child: Text('立即支付', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                          textColor: Colors.white,
                          highlightColor:Theme.of(context).primaryColor,
                          color:Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                          onPressed:(){
                            Alert.alertDialog(context, 45);
                          }
                        ),
                    ],
                  ),
                ),
              )
              :
              Container()
            ],
          )
        ),
      )
    );
  }


   // 头部
  Widget userData(){
    return Container(
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
              ],
            )
          );
  }

  // 赛事
  Widget match(){
    return Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical: ScreenAdapter.setHeight(20)),
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('韩挑K联 05-18 14:00', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                      ),
                      mz ? Image.asset('assets/images/hd.png') : Text('')
                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(60),
                                margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                child:  Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.cover,),
                              ),
                              Container(
                                child: Text('阿森纳', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                              ),
                              Container(
                                child: Text('主场', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:ScreenAdapter.setHeight(30)),
                        child: Text('VS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35))),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.setWidth(60),
                                margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                                child:  Image.network('https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg', fit: BoxFit.cover,),
                              ),
                              Container(
                                child: Text('纽卡斯尔', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                              ),
                              Container(
                                child: Text('', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenAdapter.setHeight(30), bottom:ScreenAdapter.setHeight(20)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // height: ScreenAdapter.setHeight(50),
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffE5E5E5))
                          ),
                          alignment: Alignment.center,
                          child: Text('主胜 0.88', style: TextStyle(fontSize: ScreenAdapter.size(30), color: gl == 0 ? Colors.red : Colors.black),),
                        ),
                      ),
                      SizedBox(
                        width: ScreenAdapter.setWidth(20),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffE5E5E5))
                          ),
                          alignment: Alignment.center,
                          child: Text('客让 0.25', style: TextStyle(fontSize: ScreenAdapter.size(30), color: gl == 1 ? Colors.red : Colors.black),),
                        ),
                      ),
                      SizedBox(
                        width: ScreenAdapter.setWidth(20),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                          decoration: BoxDecoration(
                            color: mz ? Colors.red : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(width:ScreenAdapter.setWidth(1), color:Color(0xffE5E5E5))
                          ),
                          alignment: Alignment.center,
                          child: Text('客胜 0.92', style: TextStyle(fontSize: ScreenAdapter.size(30), color: gl == 2 ? Colors.white : Colors.black),),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  // 倒计时
  Widget coutDown(){
    return Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('付费购买文章可查看，还剩下', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(200)),
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setHeight(10), vertical:ScreenAdapter.setHeight(40)),
                        decoration: BoxDecoration(
                          border: Border.all(width:ScreenAdapter.setWidth(2), color:Colors.red),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text('00', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        child: Container(
                          child: Text(':', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setHeight(10), vertical:ScreenAdapter.setHeight(40)),
                        decoration: BoxDecoration(
                          border: Border.all(width:ScreenAdapter.setWidth(2), color:Colors.red),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text('00', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        child: Container(
                          child: Text(':', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setHeight(10), vertical:ScreenAdapter.setHeight(40)),
                        decoration: BoxDecoration(
                          border: Border.all(width:ScreenAdapter.setWidth(2), color:Colors.red),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text('00', style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                  child: Text.rich(
                    TextSpan(
                      children:[
                        TextSpan(
                          text:'购买代表您已阅读并同意',
                          style:TextStyle(fontSize:ScreenAdapter.size(30))
                        ),
                        TextSpan(
                          text:'用户购买服务协议',
                          style:TextStyle(fontSize:ScreenAdapter.size(30), color: Colors.red)
                        )
                      ]
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(10)),
                  child: Text('球会体育非购彩平台 推荐内容仅代表作者个人观点', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20))),
                )
              ],
            ),
          );
  }
}