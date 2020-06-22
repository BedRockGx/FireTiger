

import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/imageDecoration.dart';
import 'package:firetiger/PluginWidget/liveSiwper.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class LiveCurrencyWidget extends StatefulWidget {
  @override
  _LiveCurrencyWidgetState createState() => _LiveCurrencyWidgetState();
}

class _LiveCurrencyWidgetState extends State<LiveCurrencyWidget> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[

          LiveSiwper(),
          
          classWidget(),

          Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40),),
            padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(30)),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                  child: Text('热门直播', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                ),
                HomeVideoList()
              ],
            ),
          ),

          anchorRank(),

          Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40),),
            padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(30)),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
                  child: Text('精彩推荐', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(35)),),
                ),
                HomeVideoList()
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 类型选项
  Widget classWidget(){
    return Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/footballball.png'),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('足球赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){

                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/basketball.png', fit: BoxFit.cover,),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('蓝球赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){

                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/videoGame.png'),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('电竞赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){

                    },
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(130),
                          child: Image.asset('assets/images/golf.png'),
                        ),
                        SizedBox(height: ScreenAdapter.setHeight(10)),
                        Text('综合赛事', style: TextStyle(fontSize: ScreenAdapter.size(25)),)
                      ],
                    ),
                    onTap: (){
                      
                    },
                  )
                ),
              ],
            ),
          );
  }

  // 主播排行榜
  Widget anchorRank(){
    return Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40),),
            padding: EdgeInsets.symmetric( vertical: ScreenAdapter.setHeight(30)),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: ScreenAdapter.setWidth(1), color: Color(0xffEBEBEB)))
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('主播排行', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                      ),
                      InkWell(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text('全部排行', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xff666666)),),
                              Icon(Icons.chevron_right, size: ScreenAdapter.size(40), color: Color(0xffCACACA),)
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, '/allAnchorRank');
                        },
                      )
                    ],
                  ),
                ),
                
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ImageDecoration({'image':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg', 'borderWidth':5.0,  'title':'师爷大大按实际单价暗红色的', 'subTitle':'20年球迷阿里大师的好几款h', 'pm':1})
                      ),
                      Expanded(
                        flex: 1,
                        child: ImageDecoration({'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 'borderWidth':5.0, 'title':'你是谁啊', 'subTitle':'20年球迷', 'pm':2})
                      ),
                      Expanded(
                        flex: 1,
                        child: ImageDecoration({'image':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=443801258,2722780474&fm=111&gp=0.jpg', 'borderWidth':5.0, 'title':'尿尿的日常生活', 'subTitle':'20年球迷', 'pm':3})
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}