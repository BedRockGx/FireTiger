import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class MyGrade extends StatefulWidget {
  @override
  _MyGradeState createState() => _MyGradeState();
}

class _MyGradeState extends State<MyGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的等级', style: TextStyle(color: Colors.white),),
        brightness: Brightness.dark,
        elevation: 3,
        centerTitle: true,
        backgroundColor: Color(0xff333333),
        leading: IconButton(
          icon: Icon(
            IconData(0xe654, fontFamily: 'myIcon'),
            size: ScreenAdapter.size(60),
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          color: Color(0xff333333),
          child:ListView(
            children: <Widget>[
              GradeRegion(),
              Container(
                margin: EdgeInsets.only(top:ScreenAdapter.setHeight(60)),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: ScreenAdapter.setHeight(15),
                          width:ScreenAdapter.setWidth(40),
                          child: ClipPath(
                            clipper: TrianglePath(),
                            child: Container(
                              color: Colors.white,
                            )
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(ScreenAdapter.setWidth(20), ScreenAdapter.setHeight(0), ScreenAdapter.setWidth(20), 0),
                      padding: EdgeInsets.all(ScreenAdapter.setWidth(30)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10), topRight: Radius.circular(10))
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(50),
                                  child: Image.asset('assets/images/order.png', fit: BoxFit.cover,)
                                ),
                                SizedBox(width: ScreenAdapter.setWidth(10),),
                                Text('做任务', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                            child: Divider(
                              height: ScreenAdapter.setHeight(30),
                              thickness: ScreenAdapter.setHeight(2),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('每日签到', style: TextStyle(fontSize: ScreenAdapter.size(28)),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                      Text('100',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Colors.red),),
                                    ],
                                  ),
                                ),
                                raisedButton('去签到', (){

                                })
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('每日观看1小时', style: TextStyle(fontSize: ScreenAdapter.size(28)),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                      Text('100',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Colors.red),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Color(0xffFFB839), size: ScreenAdapter.size(20),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Text('500',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Color(0xffFFB839)),),
                                    ],
                                  ),
                                ),
                                raisedButton('去观看', (){
                                  
                                })
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('绑定手机', style: TextStyle(fontSize: ScreenAdapter.size(28)),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                      Text('200',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Colors.red),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Color(0xffFFB839), size: ScreenAdapter.size(20),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Text('100',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Color(0xffFFB839)),),
                                    ],
                                  ),
                                ),
                                raisedButton('去绑定', (){
                                  
                                })
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('下载APP', style: TextStyle(fontSize: ScreenAdapter.size(28)),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Color(0xffA4A4A4), size: ScreenAdapter.size(20),),
                                      Text('100',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Color(0xffA4A4A4)),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Color(0xffA4A4A4), size: ScreenAdapter.size(20),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Text('1000',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Color(0xffA4A4A4)),),
                                    ],
                                  ),
                                ),
                                yiButton()
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('分享直播间5次', style: TextStyle(fontSize: ScreenAdapter.size(28)),),
                                      SizedBox(width: ScreenAdapter.setWidth(5),),
                                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                      Text('200',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Colors.red)),
                                    ],
                                  ),
                                ),
                                raisedButton('去分享', (){
                                  
                                })
                              ],
                            ),
                          ),
                        
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(50),
                                  child: Image.asset('assets/images/wallet.png', fit: BoxFit.cover,)
                                ),
                                SizedBox(width: ScreenAdapter.setWidth(10),),
                                Text('充值', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(20)),
                            child: Divider(
                              height: ScreenAdapter.setHeight(30),
                              thickness: ScreenAdapter.setHeight(2),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('充值火花', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                      Row(
                                        children: <Widget>[
                                          Text('充值1元得 ', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                          SizedBox(width: ScreenAdapter.setWidth(5),),
                                          Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                          Text(' 1经验', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                raisedButton('去充值', (){

                                })
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('赠送礼物', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                      Row(
                                        children: <Widget>[
                                          Text('充值1元得 ', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                          SizedBox(width: ScreenAdapter.setWidth(5),),
                                          Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                          Text(' 1经验', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                raisedButton('赠送', (){

                                })
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('收礼物', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                      Row(
                                        children: <Widget>[
                                          Text('收到的礼物获得对应价值的 ', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                          SizedBox(width: ScreenAdapter.setWidth(5),),
                                          Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                          Text(' 经验', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  // 操作按钮
  Widget raisedButton(title, fn){
    return Container(
            height: ScreenAdapter.setHeight(50),
            child: RaisedButton(
              child: Text(title, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
              textColor: Colors.white,
              highlightColor:Theme.of(context).primaryColor,
              color:Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
              onPressed: fn
            ),
          );
  }

  // 已经操作过
  Widget yiButton(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffFF3641))
            ),
            child: Row(
              children: <Widget>[
                Icon(IconData(0xe657, fontFamily: 'myIcon'), color: Color(0xffFF3641),  size: ScreenAdapter.size(30),),
                SizedBox(width: ScreenAdapter.setWidth(10),),
                Text('已下载', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
              ],
            ),
          );
  }
}



// 等级信息区域
class GradeRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:ScreenAdapter.setHeight(30)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(30),),
                Text('   当前经验值', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
            child: Text('9262655435', style: TextStyle(fontSize: ScreenAdapter.size(60), color: Colors.white),),
          ),
          LienrGrade(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('上一等级', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('+9800 ', textAlign: TextAlign.end, style: TextStyle(color: Color(0xff666666), fontSize: ScreenAdapter.size(20)),),
                      SizedBox(width: ScreenAdapter.setWidth(5),),
                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Color(0xff666666), size: ScreenAdapter.size(20),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('当前等级', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('还需9238 ', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                      SizedBox(width: ScreenAdapter.setWidth(5),),
                      Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('下一等级', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30), vertical: ScreenAdapter.setHeight(10)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('98', textAlign: TextAlign.left, style: TextStyle(fontSize: ScreenAdapter.size(40), color: Colors.white,)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('99', textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(40), color: Colors.red,)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('100', textAlign: TextAlign.right, style: TextStyle(fontSize: ScreenAdapter.size(40), color: Colors.white,)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// 等级进度条
class LienrGrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenAdapter.setWidth(30),
                  height: ScreenAdapter.setHeight(5),
                  color: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                  width: ScreenAdapter.setWidth(10),
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        alignment: Alignment.center,
                        color: Theme.of(context).primaryColor,
                        child:Text('', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                      )
                    ),
                  ),
                ),
                Container(
                  width: ScreenAdapter.setWidth(260),
                  height: ScreenAdapter.setHeight(5),
                  color: Colors.red,
                ),
                Container(
                  width: ScreenAdapter.setWidth(80),
                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                  
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width:ScreenAdapter.setWidth(5), color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: NetworkImage('https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1967122488,1967216897&fm=26&gp=0.jpg',),
                             fit:BoxFit.cover
                          )
                        ),
                        
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ScreenAdapter.setWidth(250),
                  height: ScreenAdapter.setHeight(5),
                  color: Colors.red,
                  child: LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor:Color(0xff484848),
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                      ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                  width: ScreenAdapter.setWidth(10),
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        alignment: Alignment.center,
                        color: Theme.of(context).primaryColor,
                        child:Text('', style:TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25))) ,
                      )
                    ),
                  ),
                ),
                Container(
                  width: ScreenAdapter.setWidth(30),
                  height: ScreenAdapter.setHeight(5),
                  color: Colors.red,
                ),
              ],
            ),
          );
  }
}

// 三角

class TrianglePath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
 