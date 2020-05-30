import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// 咨询组件页面


class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return 
          Container(
            // margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15), horizontal:ScreenAdapter.setWidth(30)),
            padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(15)),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: ScreenAdapter.setHeight(1), color: Color(0xffEBEBEB)))
            ),
            child:Column(
              children: <Widget>[
                

                Container(
                  margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text('曝NBA复赛后或直接季后赛 录音为证!乔丹曾阻止刺客进梦一队',maxLines: 2, style: TextStyle(fontSize: ScreenAdapter.size(30)), overflow: TextOverflow.ellipsis,),
                              SizedBox(height: ScreenAdapter.setHeight(20),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('虎扑社区 · 30分钟前', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(IconData(0xe651, fontFamily: "myIcon"), color: Color(0xffA4A4A4), size: ScreenAdapter.size(32),),
                                        SizedBox(width: ScreenAdapter.setWidth(5),),
                                        Text('346', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)))
                                      ],
                                    ),
                                  )
                                  
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:ScreenAdapter.setWidth(20)),
                        width: ScreenAdapter.setWidth(250),
                        child: AspectRatio(
                          aspectRatio: 4/3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child:FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: 'http://n.sinaimg.cn/sports/transform/250/w150h100/20200526/2ae1-itzixrt4345076.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15)),
                  child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text('2020英雄联盟季中杯赛程赛制公布',maxLines: 2, style: TextStyle(fontSize: ScreenAdapter.size(30)), overflow: TextOverflow.ellipsis,),
                            SizedBox(height: ScreenAdapter.setHeight(20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('英雄联盟官方 · 16分钟前', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                                Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(IconData(0xe651, fontFamily: "myIcon"), color: Color(0xffA4A4A4), size: ScreenAdapter.size(32),),
                                        SizedBox(width: ScreenAdapter.setWidth(5),),
                                        Text('10', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)))
                                      ],
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:ScreenAdapter.setWidth(20)),
                      width: ScreenAdapter.setWidth(250),
                      child: AspectRatio(
                        aspectRatio: 4/3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:Image.network('https://shp.qpic.cn/cfwebcap/0/93116bcb6c982e59f30e5fd2fb934151/0?width=624&height=351', fit: BoxFit.cover,)
                        ),
                      ),
                    )
                  ],
                )
                ),
                 
                Container(
                  margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text('赌王何鸿燊逝世 曾捐资建水立方',maxLines: 2, style: TextStyle(fontSize: ScreenAdapter.size(30)), overflow: TextOverflow.ellipsis,),
                              SizedBox(height: ScreenAdapter.setHeight(20),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('凤凰娱乐 · 6个小时前', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(IconData(0xe651, fontFamily: "myIcon"), color: Color(0xffA4A4A4), size: ScreenAdapter.size(32),),
                                        SizedBox(width: ScreenAdapter.setWidth(5),),
                                        Text('9281', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)))
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:ScreenAdapter.setWidth(20)),
                        width: ScreenAdapter.setWidth(250),
                        child: AspectRatio(
                          aspectRatio: 4/3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child:Image.network('http://n.sinaimg.cn/sports/transform/250/w150h100/20200526/5077-itzixrt5056964.jpg', fit: BoxFit.cover,)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          );
        
  }
}