import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/PluginWidget/HomeVideoList.dart';
import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/PluginWidget/VideoList.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class BriefIntroduction extends StatefulWidget {
  @override
  _BriefIntroductionState createState() => _BriefIntroductionState();
}

class _BriefIntroductionState extends State<BriefIntroduction> {

  var maxLines = 1;

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;

    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(rpx * 30),
          child: Column(
            children: <Widget>[
              Text('足球带我奔跑：一停一拉一传，萨拉赫背身做球的梦幻三连', style: TextStyle(fontSize: 35 * rpx),),
              SizedBox(
                height: 10 * rpx,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(IconData(0xe681, fontFamily: 'myIcon'), size: 30 * rpx, color: Color(0xffA4A4A4)),
                    SizedBox(width: 10 * rpx,),
                    Text('83876', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                    SizedBox(width: 20 * rpx,),
                    Icon(IconData(0xe680, fontFamily: 'myIcon'), size: 30 * rpx, color: Color(0xffA4A4A4)),
                    SizedBox(width: 10 * rpx,),
                    Text('34', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                    SizedBox(width: 30 * rpx,),
                    Text('分类：足球', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),)
                  ],
                ),
              ),
              SizedBox(
                height: 10 * rpx,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('简介：卡拉时间段克拉斯加大了开始的进口蜡打开链接的即可拉伸可怜的健康奥斯卡讲道理哈基督教爱哭的骄傲罕见的喀回家看到黄金卡很骄傲圣诞节开户行阿拉山口的骄傲理解的卡卡老实交代垃圾堆拉时间段拉上来肯德基爱丽丝的加拉开始就打开了大家卢卡斯建档立卡记得', overflow: TextOverflow.ellipsis, maxLines: maxLines, style: TextStyle(fontSize: 20 * rpx),),
                    ),
                    Container(
                      child: InkWell(
                        child:Icon( Icons.keyboard_arrow_down, color: Color(0xffA4A4A4),), 
                        
                        onTap: (){
                          if(maxLines == 1){
                            maxLines = 10;
                          }else{
                            maxLines = 1;
                          }
                          setState(() {
                            
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        GreyDivider(),
        Container(
          padding: EdgeInsets.all(rpx * 30),
          child: Row(
            children: <Widget>[
              ImageRoud('https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1803056350,344909414&fm=111&gp=0.jpg', 50),
              SizedBox(width: 20 * rpx,),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('磐石BedRock', style: TextStyle(fontSize: 30 * rpx, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5 * rpx,),
                    Text('二级信息', style: TextStyle(fontSize: 20 * rpx, color:Color(0xffA4A4A4)),),
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                    child: Text('关注', style: TextStyle(fontSize: 25 * rpx),),
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
        GreyDivider(),
        Container(
          padding: EdgeInsets.all(rpx * 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('相关视频', style: TextStyle(fontSize:30 * rpx),),
                margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(20)),
              ),
              VideoList(isUnpublished:false, isLiveAnchor:false)
            ],
          ),
        )
      ],
    );
  }
}