import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/component/live/components/charts.dart';
import 'package:firetiger/component/live/components/linearData.dart';
import 'package:firetiger/component/live/components/tableData.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;

import 'components/CircularData.dart';

// 直播赛况

class LiveOuts extends StatefulWidget {
  @override
  _LiveOutsState createState() => _LiveOutsState();
}

class _LiveOutsState extends State<LiveOuts> {

  


  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;
    
    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 80 * rpx, vertical:50 * rpx),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 100 * rpx,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage, 
                              image: 'https://bkimg.cdn.bcebos.com/pic/96dda144ad3459829291943b06f431adcbef847b?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:20 * rpx),
                            child: Text('阿森纳', style: TextStyle(fontSize: 30 * rpx),),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text('17/18赛季欧冠半决赛', style: TextStyle(fontSize: 25 * rpx),),
                            ),
                            Container(
                              child: Text('3 : 0', style: TextStyle(fontSize: 90 * rpx, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              child: Text('2020年4月29日 18:00', style: TextStyle(fontSize:  20 * rpx, color: Color(0xffA4A4A4)),),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 100 * rpx,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage, 
                              image: 'https://gss3.bdstatic.com/84oSdTum2Q5BphGlnYG/timg?wapp&quality=80&size=b150_150&subsize=20480&cut_x=0&cut_w=0&cut_y=0&cut_h=0&sec=1369815402&srctrace&di=389d5376b014b7a137913edd1fb77112&wh_rate=null&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F314e251f95cad1c87e6e16727e3e6709c83d518a.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:20 * rpx),
                            child: Text('纽卡斯尔', style: TextStyle(fontSize: 30 * rpx),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical:10 * rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: 15 * rpx,),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal:10 * rpx),
                        padding: EdgeInsets.symmetric(horizontal:5 * rpx),
                        color: Theme.of(context).primaryColor,
                        child: Text('直播中', style: TextStyle(fontSize:23 * rpx, color: Colors.white),),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
          GreyDivider(),

          CircularData(),

          LinearData(),

          GreyDivider(),

          TableData()
          
        ],
      ),
    );
  }
}