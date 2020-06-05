import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../utils/ScreenAdapter.dart';

class SearchVideoList extends StatefulWidget {
  @override
  _SearchVideoListState createState() => _SearchVideoListState();
}

class _SearchVideoListState extends State<SearchVideoList> {

  var itemWidth = (ScreenAdapter.getScreenWidth() - 60) / 2; // 每一个网格的宽度

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenAdapter.setWidth(30)),
      child: Column(
        children: <Widget>[
          Wrap(
              spacing: ScreenAdapter.setWidth(40), // 平行距离
              children: <Widget>[
              Container(
                  width: itemWidth,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity, // 自适应占满全部
                              child: AspectRatio(
                                  aspectRatio: 3 / 2, // 图片宽高比 1/1
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image:
                                          'https://tx-live-cover.msstatic.com/huyalive/1099531728916-1099531728916-86333738912317440-2199063581288-10057-A-0-1/20200527145722.jpg?sign=12sNHXkwKivoKepA1e9TPZeJeRBhPTEyNTM0OTg3MDEmaz1BS0lEeG56NjRXQTU3eGQ4VUVxVXlIT0tuQUxRTEN1UkN6NTUmZT0xNTk4MzM4NjQyJnQ9MTU5MDU2MjY0MiZyPTEyMzQ1Njc4JmY9L2h1eWFsaXZlLzEwOTk1MzE3Mjg5MTYtMTA5OTUzMTcyODkxNi04NjMzMzczODkxMjMxNzQ0MC0yMTk5MDYzNTgxMjg4LTEwMDU3LUEtMC0xLzIwMjAwNTI3MTQ1NzIyLmpwZyZiPWh1eWEtc2NyZWVuc2hvdHMtcmV2aWV3LTEyNTM0OTg3MDE=&x-oss-process=image/resize,limit_0,m_fill,w_338,h_190/sharpen,80/format,jpg/interlace,1/quality,q_90',
                                      fit: BoxFit.cover,
                                    ),
                                  ))),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            
                            child: Container(
                              width: itemWidth,
                              padding: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: ScreenAdapter.size(25)),
                                        SizedBox(
                                          width: ScreenAdapter.setWidth(5),
                                        ),
                                        Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(20))),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            )
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.setWidth(10)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(5)),
                              alignment: Alignment.centerLeft,
                              child: Text('内线大师课！狼王特训 萨科技的啦可视角度卡卡吉林省', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(60),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.setWidth(10)),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image:
                                            'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=433095846,3800291930&fm=111&gp=0.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left:ScreenAdapter.setWidth(10)),
                                  child: Text('隔壁老王', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: itemWidth,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity, // 自适应占满全部
                              child: AspectRatio(
                                  aspectRatio: 3 / 2, // 图片宽高比 1/1
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image:
                                          'https://tx-live-cover.msstatic.com/huyalive/1099531728916-1099531728916-86333738912317440-2199063581288-10057-A-0-1/20200527145722.jpg?sign=12sNHXkwKivoKepA1e9TPZeJeRBhPTEyNTM0OTg3MDEmaz1BS0lEeG56NjRXQTU3eGQ4VUVxVXlIT0tuQUxRTEN1UkN6NTUmZT0xNTk4MzM4NjQyJnQ9MTU5MDU2MjY0MiZyPTEyMzQ1Njc4JmY9L2h1eWFsaXZlLzEwOTk1MzE3Mjg5MTYtMTA5OTUzMTcyODkxNi04NjMzMzczODkxMjMxNzQ0MC0yMTk5MDYzNTgxMjg4LTEwMDU3LUEtMC0xLzIwMjAwNTI3MTQ1NzIyLmpwZyZiPWh1eWEtc2NyZWVuc2hvdHMtcmV2aWV3LTEyNTM0OTg3MDE=&x-oss-process=image/resize,limit_0,m_fill,w_338,h_190/sharpen,80/format,jpg/interlace,1/quality,q_90',
                                      fit: BoxFit.cover,
                                    ),
                                  ))),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            
                            child: Container(
                              width: itemWidth,
                              padding: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: ScreenAdapter.size(25)),
                                        SizedBox(
                                          width: ScreenAdapter.setWidth(5),
                                        ),
                                        Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(20))),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            )
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.setWidth(10)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(5)),
                              alignment: Alignment.centerLeft,
                              child: Text('内线大师课！狼王特训', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: ScreenAdapter.setWidth(60),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.setWidth(10)),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image:
                                            'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=433095846,3800291930&fm=111&gp=0.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left:ScreenAdapter.setWidth(10)),
                                  child: Text('隔壁老王', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
          
          ])
        ],
      ),
    );
  }
}