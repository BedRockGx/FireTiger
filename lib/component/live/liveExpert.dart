import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:flutter/material.dart';

class LiveExpert extends StatefulWidget {
  @override
  _LiveExpertState createState() => _LiveExpertState();
}

class _LiveExpertState extends State<LiveExpert> {

  List<Map> data2 = [
    {'img':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1388647394,240988450&fm=111&gp=0.jpg', 'probability':'100%', 'name':'浩海东', 'title':'克萨克达十九大肯德基拉拉时间段', 'vs':'罗马 vs 利物浦', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'半小时前', 'price':30, 'isM':true},
    {'img':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3118813608,3660597234&fm=26&gp=0.jpg', 'probability':'89%', 'name':'李海峰', 'title':'萨克拉进去为了加强位列拉斯', 'vs':'RNG vs EDG', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'15分钟前', 'price':300, 'isM':false},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3621869950,2480486393&fm=26&gp=0.jpg', 'probability':'93%', 'name':'汪苏泷', 'title':'马萨卡东南网签完了', 'vs':'IG vs FPX', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'2小时前', 'price':120, 'isM':true},
    {'img':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 'probability':'60%', 'name':'姜峰', 'title':'请离开我今儿来块钱我就看了两块钱我看了今儿看了群文件安会计师大会的借口借口阿斯利康带回家卡拉是肯定啦数据库里的痕迹奥斯卡的健康h', 'vs':'火箭 vs 湖人', 'cc':'19/20赛季欧冠半决赛 2020-5-17 18:00', 'time':'半小时前', 'price':20, 'isM':false},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top:0),
      children: <Widget>[
        dataWidget()
      ],
    );
  }


  Widget dataWidget(){
    double rpx = MediaQuery.of(context).size.width / 750;
    
    return Container(
            margin: EdgeInsets.symmetric(vertical:20 * rpx, horizontal:40 * rpx),
                      child: Column(
                        children: data2.map((item){
                          return InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical:30 * rpx),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1 * rpx,
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
                                        margin: EdgeInsets.only(right:10 * rpx),
                                        child: ImageRoud('${item['img']}', 50),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text('${item['name']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30 * rpx),),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.all(5 * rpx),
                                                    margin: EdgeInsets.only(right:10 * rpx),
                                                    decoration: BoxDecoration(
                                                      color:Color(0xffFFF4F5),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Text('近10中7', style: TextStyle(color: Color(0xffFF3641), fontSize: 20 * rpx),),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5 * rpx),
                                                    decoration: BoxDecoration(
                                                      color:Color(0xffFFF4F5),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Text('5连红', style: TextStyle(color: Color(0xffFF3641), fontSize: 20 * rpx),),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5 * rpx),
                                                    decoration: BoxDecoration(
                                                      color:Color(0xffFFF4F5),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Text('历史5连红', style: TextStyle(color: Color(0xffFF3641), fontSize:20 * rpx),),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:150 * rpx,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              child: Text('${item['probability']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55 * rpx),),
                                            ),
                                            Container(
                                              child: Text('命中率', style: TextStyle(color: Color(0xffA4A4A4), fontSize: 20 * rpx),),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical:20 * rpx),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(200, 200, 200, 0.1),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical:20 * rpx, horizontal:40 * rpx),
                                          child: Text('${item['title']}', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 25 * rpx),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal:40 * rpx),
                                          color: Color(0xffEBEBEB),
                                          width: double.infinity,
                                          height:1 * rpx,
                                          // child:
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left:40 * rpx,top:20 * rpx,  bottom: 20 * rpx),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(right:10 * rpx),
                                                child: ImageRoud('https://bkimg.cdn.bcebos.com/pic/728da9773912b31babe91c558c18367adbb4e1c1?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg', 40),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text('${item['vs']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30 * rpx),),
                                                    ),
                                                    Container(
                                                      child: Text('${item['cc']}', style:TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),)
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 100 * rpx,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft: Radius.circular(20)),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xffE1CD92),
                                                        Color(0xffBFA764),
                                                      ])
                                                ),
                                                padding: EdgeInsets.all(5 * rpx),
                                                child: Container(
                                                  child: Text('竞彩单关', style: TextStyle(color: Colors.white, fontSize: 20 * rpx),),
                                                )
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:10 * rpx),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('半小时前发布', style: TextStyle(color: Color(0xffA4A4A4), fontSize:20 * rpx),),
                                        item['isM'] ? Container(
                                          child: Image.asset('assets/images/hd.png')
                                        ) : Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Color(0xffAFAFAF),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Text('本场未中', style: TextStyle(fontSize: 20 * rpx, color: Colors.white),),
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
                    );
  }
}