import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../utils/ScreenAdapter.dart';

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {

  var itemWidth = (ScreenAdapter.getScreenWidth() - 60) / 2; // 每一个网格的宽度

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenAdapter.setWidth(30)),
      child: 
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
                            right: 0,
                            top: 5,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  IconData(0xe64d, fontFamily: 'myIcon'),
                                  color: Colors.red,
                                  size: ScreenAdapter.size(15),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(5)),
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    '直播中',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.size(23),
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            child: Container(
                              width: itemWidth,
                              padding: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                              child: Text('足球足球足球萨克的骄傲了开始对接拉上来对接口了', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.setWidth(20)),
                        child: Row(
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
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '隔壁老王在看球，快来一起吧',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: ScreenAdapter.size(25)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenAdapter.setHeight(5),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '篮球',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color(0xffA4A4A4), size: ScreenAdapter.size(25),),
                                            SizedBox(
                                              width: ScreenAdapter.setWidth(5),
                                            ),
                                            Text(
                                              '39204',
                                              style: TextStyle(
                                                  fontSize: ScreenAdapter.size(20),
                                                  color: Color(0xffA4A4A4)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
                                    child: Image.network(
                                      'https://sta-op.douyucdn.cn/vod-cover/2020/05/07/dbc34cebe92ab25b6f0f6bb1541217b6.jpg',
                                      fit: BoxFit.cover,
                                    ), // 图片自适应,
                                  ))),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(5)),
                                  color: Color(0xff80D064),
                                  child: Text(
                                    '未开始',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.size(23),
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            child: Container(
                              child: Text('我是faker啊！！', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.setWidth(20)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(60),
                              margin: EdgeInsets.only(
                                  right: ScreenAdapter.setWidth(10)),
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Faker',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(25)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '电竞',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      ),
                                      Text(
                                        '39204',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
                                    child: Image.network(
                                      'https://sta-op.douyucdn.cn/vod-cover/2020/05/07/dbc34cebe92ab25b6f0f6bb1541217b6.jpg',
                                      fit: BoxFit.cover,
                                    ), // 图片自适应,
                                  ))),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(5)),
                                  color: Color(0xff80D064),
                                  child: Text(
                                    '未开始',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.size(23),
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            child: Container(
                              child: Text('我是faker啊！！', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.setWidth(20)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(60),
                              margin: EdgeInsets.only(
                                  right: ScreenAdapter.setWidth(10)),
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Faker',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(25)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '电竞',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      ),
                                      Text(
                                        '39204',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
                                    child: Image.network(
                                      'https://sta-op.douyucdn.cn/vod-cover/2020/05/07/dbc34cebe92ab25b6f0f6bb1541217b6.jpg',
                                      fit: BoxFit.cover,
                                    ), // 图片自适应,
                                  ))),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenAdapter.setWidth(5)),
                                  color: Color(0xff80D064),
                                  child: Text(
                                    '未开始',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.size(23),
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            child: Container(
                              child: Text('我是faker啊！！', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.setWidth(20)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(60),
                              margin: EdgeInsets.only(
                                  right: ScreenAdapter.setWidth(10)),
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Faker',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(25)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '电竞',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      ),
                                      Text(
                                        '39204',
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.size(20),
                                            color: Color(0xffA4A4A4)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
    );
  }
}