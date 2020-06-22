import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/liveSiwper.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ExpertWidget extends StatefulWidget {
  @override
  _ExpertWidgetState createState() => _ExpertWidgetState();
}

class _ExpertWidgetState extends State<ExpertWidget> {


  List<Map> data = [
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1388647394,240988450&fm=111&gp=0.jpg', 'tag':'足球名将', 'name':'浩海东', },
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'tag':'足球名将', 'name':'李海峰'},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3621869950,2480486393&fm=26&gp=0.jpg', 'tag':'足球名将', 'name':'汪苏泷'},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 'tag':'民间高手', 'name':'姜峰'},
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1354268575,1268995723&fm=26&gp=0.jpg', 'tag':'民间高手', 'name':'明祖陵'},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4146343321,3855884912&fm=111&gp=0.jpg', 'tag':'民间高手', 'name':'郭丽子'},
    {'img':'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1136624566,3053705919&fm=26&gp=0.jpg', 'tag':'民间高手', 'name':'韩尚银'},
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3521319392,1160740190&fm=26&gp=0.jpg', 'tag':'民间高手', 'name':'巨魔'},
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1311392388,1324290206&fm=26&gp=0.jpg', 'tag':'民间高手', 'name':'李明伟'},
    {'img':'', 'tag':'', 'name':'更多'},
  ];

  var light = 0;

  List<Map> data2 = [
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1388647394,240988450&fm=111&gp=0.jpg', 'probability':'100%', 'name':'浩海东', 'title':'克萨克达十九大肯德基拉拉时间段', 'vs':'罗马 vs 利物浦', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'半小时前', 'price':30},
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'probability':'89%', 'name':'李海峰', 'title':'萨克拉进去为了加强位列拉斯', 'vs':'RNG vs EDG', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'15分钟前', 'price':300},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3621869950,2480486393&fm=26&gp=0.jpg', 'probability':'93%', 'name':'汪苏泷', 'title':'马萨卡东南网签完了', 'vs':'IG vs FPX', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'2小时前', 'price':120},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 'probability':'60%', 'name':'姜峰', 'title':'请离开我今儿来块钱我就看了两块钱我看了今儿看了群文件安会计师大会的借口借口阿斯利康带回家卡拉是肯定啦数据库里的痕迹奥斯卡的健康h', 'vs':'火箭 vs 湖人', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'半小时前', 'price':20},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LiveSiwper(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40)),
            child: Column(
              children: <Widget>[
                TopWidget(),
                ToDaySchedule(),
                Programme()
              ],
            ),
          )
        ],
      ),
    );
  }


  panAssetImg(i){

    switch (i) {
      case 0:
        return AssetImage('assets/images/gj.png');
        break;
      case 1:
        return AssetImage('assets/images/yj.png');
        break;
      case 2:
        return AssetImage('assets/images/jj.png');
        break;
      default:
    }
  }

  panColor(i){
    switch (i) {
      case 0:
        return Color(0xffFDBC4B);
        break;
      case 1:
        return Color(0xffA8C6CC);
        break;
      case 2:
        return Color(0xffB09A85);
        break;
      default:
    }
  }


  // 专家排行榜
  Widget TopWidget(){
    return Container(
            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                  child: Text('TOP专家', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                ),
                Container(
                  height: ScreenAdapter.setHeight(400),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:3/6,
                    children: List.generate(data.length, (i) {
                        return InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                data[i]['img'] == '' ? 
                                Container(
                                  width: ScreenAdapter.setWidth(120),
                                  height: ScreenAdapter.setHeight(100),
                                  margin: EdgeInsets.only(top:ScreenAdapter.setHeight(30), bottom: ScreenAdapter.setHeight(20)),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F5F5),
                                    borderRadius: BorderRadius.circular(80)
                                  ),
                                  child: Icon(IconData(0xe679, fontFamily: 'myIcon'), color: Color(0xffDFDFDF),),
                                ) 
                                :
                                Container(
                                  height: ScreenAdapter.setHeight(150),
                                  child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(120),
                                      height: ScreenAdapter.setHeight(150),
                                      decoration: BoxDecoration(
                                        image: i < 3 ? DecorationImage(
                                          image: panAssetImg(i),
                                          fit: BoxFit.contain
                                        ) 
                                        : DecorationImage(
                                          image: NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1082071895,1695160707&fm=26&gp=0.jpg'),
                                          fit:  BoxFit.contain
                                        )
                                      ) ,
                                      padding: EdgeInsets.fromLTRB(ScreenAdapter.setWidth(5), ScreenAdapter.setHeight(20), ScreenAdapter.setWidth(5), ScreenAdapter.setHeight(5)),
                                      alignment:Alignment.center,
                                      child: 
                                      ImageRoud('${data[i]['img']}', 60),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: ScreenAdapter.setWidth(15),
                                      child:data[i]['tag'] == '' ? Text('') : Container(
                                        decoration: BoxDecoration(
                                          color: panColor(i),
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                        child:  Text('${data[i]['tag']}', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white),),
                                      ),
                                    )
                                  ],
                                ),
                                ),
                                SizedBox(
                                  height: ScreenAdapter.setHeight(10),
                                ),
                                Container(
                                  child: Text('${data[i]['name']}', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            if(data[i]['name'] == '更多'){
                               Navigator.pushNamed(context, '/expertRank');
                            }else{
                               Navigator.pushNamed(context, '/expertHomePage');
                             
                            }
                            
                          },
                        );
                      
                    }),
                  ),
                )
              ],
            ),
          );
  }

  // 今日赛程
  Widget ToDaySchedule(){
    return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text('今日赛程', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('全部', style: TextStyle(fontSize: ScreenAdapter.size(20), color:Color(0xff666666)),),
                                Icon(Icons.chevron_right, color: Color(0xffCACACA), size: ScreenAdapter.size(40),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB))
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Color(0xffF5F5F5),
                                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('英超', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                                        Text('16方案', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffFF3641)),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20), vertical: ScreenAdapter.setHeight(30)),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                              child: Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.cover,),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text('阿森纳'),
                                            ),
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: ScreenAdapter.setHeight(20),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                              child: Image.network('https://bkimg.cdn.bcebos.com/pic/023b5bb5c9ea15cee50cab93b1003af33b87b24e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.cover,),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text('阿森纳'),
                                            ),
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdapter.setWidth(20),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB))
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Color(0xffF5F5F5),
                                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('英超', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                                        Text('32方案', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffFF3641)),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20), vertical: ScreenAdapter.setHeight(30)),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                              child: Image.network('https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.cover,),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text('阿森纳'),
                                            ),
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              child: Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: ScreenAdapter.setHeight(20),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                              child: Image.network('https://bkimg.cdn.bcebos.com/pic/023b5bb5c9ea15cee50cab93b1003af33b87b24e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', fit: BoxFit.cover,),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text('阿森纳'),
                                            ),
                                            Container(
                                              width: ScreenAdapter.setWidth(50),
                                              child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30)),),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
  }

  // 方案推荐
  Widget Programme(){
    return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text('方案推荐', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(IconData(0xe67a, fontFamily: 'myIcon'), color: light == 0 ? Color(0xffFF3641) : Color(0xffA4A4A4), size: ScreenAdapter.size(30),),
                                        SizedBox(
                                          width: ScreenAdapter.setWidth(10),
                                        ),
                                        Text('足球方案', style: TextStyle(fontSize: ScreenAdapter.size(20), color: light == 0 ? Color(0xffFF3641) : Color(0xffA4A4A4)),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      light = 0;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: ScreenAdapter.setWidth(30),
                                ),
                                InkWell(
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(IconData(0xe67b, fontFamily: 'myIcon'), color:  light == 1 ? Color(0xffFF3641) : Color(0xffA4A4A4), size: ScreenAdapter.size(30),),
                                        SizedBox(
                                          width: ScreenAdapter.setWidth(10),
                                        ),
                                        Text('篮球方案', style: TextStyle(fontSize: ScreenAdapter.size(20), color:  light == 1 ? Color(0xffFF3641) : Color(0xffA4A4A4)),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      light = 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      child: Column(
                        children: data2.map((item){
                          return InkWell(
                            child: Container(
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
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                                        child: ImageRoud('${item['img']}', 50),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text('${item['name']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                                    margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                                                    decoration: BoxDecoration(
                                                      color:Color(0xffFFF4F5),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Text('近10中7', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(20)),),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                                    decoration: BoxDecoration(
                                                      color:Color(0xffFFF4F5),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Text('5连红', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(20)),),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                                                    decoration: BoxDecoration(
                                                      color:Color(0xffFFF4F5),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Text('历史5连红', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(20)),),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: ScreenAdapter.setWidth(150),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              child: Text('${item['probability']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(55)),),
                                            ),
                                            Container(
                                              child: Text('命中率', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
                                          child: Text('${item['title']}', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(25)),),
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
                                                      child: Text('${item['vs']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                                    ),
                                                    Container(
                                                      child: Text('${item['cc']}', style:TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
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
                                        Text('${item['time']}', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text('${item['price']}', style: TextStyle(color: Color(0xffD9C487), fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(40))),
                                              Text('火虎币', style: TextStyle(color: Color(0xffD9C487), fontSize: ScreenAdapter.size(25)))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, '/programmePay');
                            },
                          );
                        
                        }).toList()
                      ),
                    )
                 
                  ],
                );
  }
}