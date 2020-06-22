import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/imageDecoration.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class AnchorRnakDataWidget extends StatefulWidget {
  var arguments;
  AnchorRnakDataWidget(this.arguments);
  @override
  _AnchorRnakDataWidgetState createState() => _AnchorRnakDataWidgetState(this.arguments);
}

class _AnchorRnakDataWidgetState extends State<AnchorRnakDataWidget> {

  var arguments;
  _AnchorRnakDataWidgetState(this.arguments);

  List<Map> data = [
    {'pm':3 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':false},
    {'pm':4 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':true},
    {'pm':5 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':false},
    {'pm':6 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':false},
    {'pm':7 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':true},
    {'pm':8 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':false},
    {'pm':9 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':false},
    {'pm':10 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':true},
    {'pm':11 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'subtitle':'20年球迷', 'isGuan':false},
  ];

  List<Map> data2 = [
    {'pm':3 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'dj':34, 'gx':25.6},
    {'pm':4 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'dj':68, 'gx':38},
    {'pm':5 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'dj':75, 'gx':78.2},
    {'pm':6 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'dj':98, 'gx':1000},
    {'pm':7 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'dj':11, 'gx':2035},
    {'pm':8 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'dj':100, 'gx':1571},
    {'pm':9 , 'image':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3873278591,2846033136&fm=26&gp=0.jpg', 'title':'隔壁老王', 'dj':66, 'gx':22556},
    {'pm':10 , 'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 'title':'隔壁老王', 'dj':52, 'gx':12.5},
    {'pm':11 , 'image':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'title':'隔壁老王', 'dj':67, 'gx':2641},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          panShow()
        ],
      ),
    );
  }

  Widget panShow(){
    if(arguments['type'] == 1){
      return Container(
        child: Column(
          children: <Widget>[
              mingXing(),
              otherPM()
          ],
        ),
      );
    }else{
      return Container(
        child: Column(
          children: <Widget>[
              tuHaoshouYi(),
              otherPM2()
          ],
        ),
      );
    }
  }

  // 明星主播榜
  Widget mingXing(){
    return Container(
            color: Color(arguments['color']),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical:ScreenAdapter.setHeight(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 'borderWidth':10.0,  'title':'师爷大大按实际单价暗红色的', 'subTitle':'20年球迷阿里大师的好几款h', 'pm':1}),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      Container(
                        width: ScreenAdapter.setWidth(150),
                        height: ScreenAdapter.setHeight(50),
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
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                     ImageDecoration({'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 'borderWidth':10.0, 'title':'你是谁啊', 'subTitle':'20年球迷', 'pm':2}),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      Container(
                        width: ScreenAdapter.setWidth(150),
                        height: ScreenAdapter.setHeight(50),
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
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=443801258,2722780474&fm=111&gp=0.jpg', 'borderWidth':10.0, 'title':'尿尿的日常生活', 'subTitle':'20年球迷', 'pm':3}),
                      SizedBox(
                        height: ScreenAdapter.setHeight(20),
                      ),
                      Container(
                        width: ScreenAdapter.setWidth(150),
                        height: ScreenAdapter.setHeight(50),
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
                ),
              ],
            ),
          );
  }

  // 综合土豪榜&竞猜收益榜
   Widget tuHaoshouYi(){
    return Container(
            color: Color(arguments['color']),
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical:ScreenAdapter.setHeight(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 'borderWidth':10.0,  'title':'师爷大大按实际单价暗红色的', 'subTitle':'', 'pm':1}),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(20), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                        constraints: BoxConstraints(
                          maxWidth:  ScreenAdapter.setWidth(120),
                        ),
                        alignment: Alignment.centerRight,
                        child: Text('65', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: panImage(65),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        child: Text('36.1万贡献度', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 'borderWidth':10.0,  'title':'师爷大大按实际单价暗红色的', 'subTitle':'', 'pm':1}),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                        constraints: BoxConstraints(
                          maxWidth:  ScreenAdapter.setWidth(120),
                        ),
                        alignment: Alignment.centerRight,
                        child: Text('34', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: panImage(34),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        child: Text('36.1万贡献度', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      ImageDecoration({'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=443801258,2722780474&fm=111&gp=0.jpg', 'borderWidth':10.0,  'title':'师爷大大按实际单价暗红色的', 'subTitle':'', 'pm':1}),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                        constraints: BoxConstraints(
                          maxWidth:  ScreenAdapter.setWidth(120),
                        ),
                        alignment: Alignment.centerRight,
                        child: Text('100', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: panImage(99),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        child: Text('36.1万贡献度', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }


  // 明星榜其它排名
  Widget otherPM(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Column(
              children: data.map((item){
                return Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.setWidth(70),
                        height: ScreenAdapter.setHeight(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ranking-other.png'),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Text('${item['pm']}', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                        child: ImageRoud('${item['image']}', 60),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${item['title']}', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                              Text('${item['subtitle']}', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                            ],
                          ),
                        ),
                      ),
                      item['isGuan'] ? 
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffFF3641))
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(IconData(0xe657, fontFamily: 'myIcon'), color: Color(0xffFF3641),  size: ScreenAdapter.size(30),),
                            Text('已关注', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                      :
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(35), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          color: Color(0xffFF3641),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(IconData(0xe656, fontFamily: 'myIcon'), color: Color(0xffFFFFFF), size: ScreenAdapter.size(30),),
                            Text('关注', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          );
  }

  // 综合土豪榜&竞猜收益榜其它排名

  Widget otherPM2(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Column(
              children: data2.map((item){
                return Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.setWidth(70),
                        height: ScreenAdapter.setHeight(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ranking-other.png'),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Text('${item['pm']}', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                        child: ImageRoud('${item['image']}', 60),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${item['title']}', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                              SizedBox(
                                height: ScreenAdapter.setHeight(10),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(20), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                                constraints: BoxConstraints(
                                  maxWidth:  ScreenAdapter.setWidth(100),
                                ),
                                alignment: Alignment.centerRight,
                                child: Text('${item['dj']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: panImage(item['dj']),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Text('${item['gx']}贡献度', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          );
  }

    // 判断显示等级
  ImageProvider panImage(n){
    if(n<11){
      return AssetImage('assets/images/tag1.png');
    }else if(10<n && n<31){
      return AssetImage('assets/images/tag2.png');
    }else if(30<n && n<51){
      return AssetImage('assets/images/tag3.png');
    }else if(50<n && n<71){
      return AssetImage('assets/images/tag4.png');
    }else if(70<n && n<101){
      return AssetImage('assets/images/tag5.png');
    }
  }
}