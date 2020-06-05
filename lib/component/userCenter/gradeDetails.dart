import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class GradeDetails extends StatefulWidget {
  @override
  _GradeDetailsState createState() => _GradeDetailsState();
}

class _GradeDetailsState extends State<GradeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的主播等级', style: TextStyle(color: Colors.white),),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white,),
            onPressed: (){
              
            },
          )
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          color: Color(0xff333333),
          child: ListView(
            children: <Widget>[
              GradeRegion()
            ],
          ),
      )),
    );
  }
  }

  // 等级信息区域
class GradeRegion extends StatelessWidget {

  var itemWidth = (ScreenAdapter.getScreenWidth() - 60) / 2; // 每一个网格的宽度
  
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
                Text('   距离升级经验还差经验值', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('当前等级', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                ),
                Expanded(
                  flex: 1,
                  child: Text('下一等级', textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
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
                  child: Text('Lv 98', textAlign: TextAlign.left, style: TextStyle(fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold, color: Colors.white,)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('99', textAlign: TextAlign.center, style: TextStyle(fontSize: ScreenAdapter.size(70), fontWeight: FontWeight.bold, color: Colors.white,)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Lv 100', textAlign: TextAlign.right, style: TextStyle(fontSize: ScreenAdapter.size(40),fontWeight: FontWeight.bold, color: Colors.white,)),
                ),
              ],
            ),
          ),
          LienrGrade(),
          

          Container(
                margin: EdgeInsets.only(top:ScreenAdapter.setHeight(60)),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 250,
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
                                SizedBox(width: ScreenAdapter.setWidth(10),),
                                Text('基础任务', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),)
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
                          SizedBox(
                            height: ScreenAdapter.setHeight(20),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: ScreenAdapter.setWidth(50),
                                        margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                        child: Image.asset('assets/images/bz.png', fit: BoxFit.cover,)
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text('单场有效直播时长达100分钟', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                                SizedBox(
                                                  width: ScreenAdapter.setWidth(10),
                                                ),
                                                Text('每日1次', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                                Text('100',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Colors.red),),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: ScreenAdapter.setWidth(50),
                                        margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                        child: Image.asset('assets/images/bzb.png', fit: BoxFit.cover,)
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text('每天累计有效直播时长达300分钟', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                                SizedBox(
                                                  width: ScreenAdapter.setWidth(10),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(IconData(0xe669, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(20),),
                                                Text('300',  style: TextStyle(fontSize: ScreenAdapter.size(28), color: Colors.red),),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: ScreenAdapter.setWidth(10),),
                                Text('如何快速升级', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),)
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
                          SizedBox(
                            height: ScreenAdapter.setHeight(20),
                          ),
                          Wrap(
                            spacing: ScreenAdapter.setWidth(10),
                            runSpacing: ScreenAdapter.setHeight(20),
                            children: <Widget>[
                              Container(
                                width: itemWidth,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(50),
                                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                      child: Image.asset('assets/images/gift.png', fit: BoxFit.cover,)
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('获得礼物', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                        Text('呼朋唤友礼物刷起来', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: itemWidth,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(50),
                                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                      child: Image.asset('assets/images/comments.png', fit: BoxFit.cover,)
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('全民弹幕', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                        Text('增加你的额外的经验和热度', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: itemWidth,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(50),
                                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                      child: Image.asset('assets/images/bz.png', fit: BoxFit.cover,)
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('勤奋直播', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                        Text('直播多多，奖励多多', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
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



// 等级进度条
class LienrGrade extends StatelessWidget {

  double linerValue = 0.6;

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
                  width: ScreenAdapter.setWidth(630),
                  height: ScreenAdapter.setHeight(50),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top:ScreenAdapter.setHeight(22),
                        child: Container(
                          width: ScreenAdapter.setWidth(630),
                          height: ScreenAdapter.setHeight(5),
                          color: Colors.red,
                          child: LinearProgressIndicator(
                                value: linerValue,
                                backgroundColor:Color(0xff484848),
                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                              ),
                        ),
                      ),
                      Positioned(
                        top:ScreenAdapter.setHeight(0),
                        child: Container(
                          width: ScreenAdapter.setWidth(60),
                          margin: EdgeInsets.only(left:panLeft(linerValue)),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
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
                      )
                    ],
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

    // 计算偏移距离
  panLeft(n){
    var left;
    if(n > 0.7){
      left = 550 * n + 20;
    }else{
      left = 550 * n;
    }
    

    return ScreenAdapter.setWidth(left);
  }
}
