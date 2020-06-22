import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// 视频列表 组件页面

class VideoList extends StatefulWidget {
  bool isUnpublished = false;                       // 是否从个人中心查看 判断是否显示审核失败
  bool isLiveAnchor = false;                        // 是否从直播回放查看 判断是否显示头像和名字
  VideoList({this.isUnpublished, this.isLiveAnchor});
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {

  var sh = false;

  var itemWidth; // 每一个网格的宽度

  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;
    itemWidth  = (MediaQuery.of(context).size.width  - 60) / 2;

    return Container(
      // margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15), horizontal:ScreenAdapter.setWidth(30)),
      child: Column(
      children: <Widget>[
         Wrap(
              spacing: 30 * rpx, // 平行距离
              runSpacing: 20 * rpx, // 上下距离
              children: [
                InkWell(
                  child: Container(
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
                            sh ? Positioned(
                              top: ScreenAdapter.setHeight(0),
                              left: ScreenAdapter.setWidth(0),
                              child: Container(
                                padding: EdgeInsets.all(10 * rpx),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.only( bottomRight:Radius.circular(5))
                                ),
                                child: Text('审核失败', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                              ),
                            ) : Container(),
                            Positioned(
                              bottom: 10 * rpx,
                              left: 10 * rpx,
                              child: Container(
                                width: itemWidth,
                                padding: EdgeInsets.only(right:20 * rpx),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 20 * rpx)),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: 25 * rpx),
                                          SizedBox(
                                            width: ScreenAdapter.setWidth(5),
                                          ),
                                          Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: 20 * rpx)),
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
                              vertical: 10 * rpx),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5 * rpx),
                                alignment: Alignment.centerLeft,
                                child: Text('内线大师课！狼王特训 萨科技的啦可视角度卡卡吉林省', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize:25 * rpx),),
                              ),
                              widget.isLiveAnchor ? Row(
                                children: <Widget>[
                                  Container(
                                    width: 60 * rpx,
                                    margin: EdgeInsets.only(
                                        right: 10 * rpx),
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
                                    margin: EdgeInsets.only(left:10 * rpx),
                                    child: Text('隔壁老王', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                                  )
                                ],
                              ) :Container()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    // Navigator.pushNamed(context, '/videoScreen', arguments: 'http://player.alicdn.com/video/aliyunmedia.mp4');
                    Navigator.pushNamed(context, '/playVideo');
                  },
                ),
                      InkWell(
                  child: Container(
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
                            sh ? Positioned(
                              top: ScreenAdapter.setHeight(0),
                              left: ScreenAdapter.setWidth(0),
                              child: Container(
                                padding: EdgeInsets.all(10 * rpx),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.only( bottomRight:Radius.circular(5))
                                ),
                                child: Text('审核失败', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                              ),
                            ) : Container(),
                            Positioned(
                              bottom: 10 * rpx,
                              left: 10 * rpx,
                              child: Container(
                                width: itemWidth,
                                padding: EdgeInsets.only(right:20 * rpx),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 20 * rpx)),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: 25 * rpx),
                                          SizedBox(
                                            width: ScreenAdapter.setWidth(5),
                                          ),
                                          Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: 20 * rpx)),
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
                              vertical: 10 * rpx),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5 * rpx),
                                alignment: Alignment.centerLeft,
                                child: Text('内线大师课！狼王特训 萨科技的啦可视角度卡卡吉林省', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize:25 * rpx),),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 60 * rpx,
                                    margin: EdgeInsets.only(
                                        right: 10 * rpx),
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
                                    margin: EdgeInsets.only(left:10 * rpx),
                                    child: Text('隔壁老王', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    // Navigator.pushNamed(context, '/videoScreen', arguments: 'http://player.alicdn.com/video/aliyunmedia.mp4');
                    Navigator.pushNamed(context, '/playVideo');
                  },
                ),
                      InkWell(
                  child: Container(
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
                            sh ? Positioned(
                              top: ScreenAdapter.setHeight(0),
                              left: ScreenAdapter.setWidth(0),
                              child: Container(
                                padding: EdgeInsets.all(10 * rpx),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.only( bottomRight:Radius.circular(5))
                                ),
                                child: Text('审核失败', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                              ),
                            ) : Container(),
                            Positioned(
                              bottom: 10 * rpx,
                              left: 10 * rpx,
                              child: Container(
                                width: itemWidth,
                                padding: EdgeInsets.only(right:20 * rpx),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 20 * rpx)),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: 25 * rpx),
                                          SizedBox(
                                            width: ScreenAdapter.setWidth(5),
                                          ),
                                          Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: 20 * rpx)),
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
                              vertical: 10 * rpx),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5 * rpx),
                                alignment: Alignment.centerLeft,
                                child: Text('内线大师课！狼王特训 萨科技的啦可视角度卡卡吉林省', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize:25 * rpx),),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 60 * rpx,
                                    margin: EdgeInsets.only(
                                        right: 10 * rpx),
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
                                    margin: EdgeInsets.only(left:10 * rpx),
                                    child: Text('隔壁老王', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    // Navigator.pushNamed(context, '/videoScreen', arguments: 'http://player.alicdn.com/video/aliyunmedia.mp4');
                    Navigator.pushNamed(context, '/playVideo');
                  },
                ),
                      InkWell(
                  child: Container(
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
                            sh ? Positioned(
                              top: ScreenAdapter.setHeight(0),
                              left: ScreenAdapter.setWidth(0),
                              child: Container(
                                padding: EdgeInsets.all(10 * rpx),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.only( bottomRight:Radius.circular(5))
                                ),
                                child: Text('审核失败', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                              ),
                            ) : Container(),
                            Positioned(
                              bottom: 10 * rpx,
                              left: 10 * rpx,
                              child: Container(
                                width: itemWidth,
                                padding: EdgeInsets.only(right:20 * rpx),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 20 * rpx)),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: 25 * rpx),
                                          SizedBox(
                                            width: ScreenAdapter.setWidth(5),
                                          ),
                                          Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: 20 * rpx)),
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
                              vertical: 10 * rpx),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5 * rpx),
                                alignment: Alignment.centerLeft,
                                child: Text('内线大师课！狼王特训 萨科技的啦可视角度卡卡吉林省', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize:25 * rpx),),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 60 * rpx,
                                    margin: EdgeInsets.only(
                                        right: 10 * rpx),
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
                                    margin: EdgeInsets.only(left:10 * rpx),
                                    child: Text('隔壁老王', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    // Navigator.pushNamed(context, '/videoScreen', arguments: 'http://player.alicdn.com/video/aliyunmedia.mp4');
                    Navigator.pushNamed(context, '/playVideo');
                  },
                ),
                      InkWell(
                  child: Container(
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
                            sh ? Positioned(
                              top: ScreenAdapter.setHeight(0),
                              left: ScreenAdapter.setWidth(0),
                              child: Container(
                                padding: EdgeInsets.all(10 * rpx),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.only( bottomRight:Radius.circular(5))
                                ),
                                child: Text('审核失败', style: TextStyle(fontSize: ScreenAdapter.size(20)),),
                              ),
                            ) : Container(),
                            Positioned(
                              bottom: 10 * rpx,
                              left: 10 * rpx,
                              child: Container(
                                width: itemWidth,
                                padding: EdgeInsets.only(right:20 * rpx),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 20 * rpx)),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: 25 * rpx),
                                          SizedBox(
                                            width: ScreenAdapter.setWidth(5),
                                          ),
                                          Text('39204', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: 20 * rpx)),
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
                              vertical: 10 * rpx),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical:5 * rpx),
                                alignment: Alignment.centerLeft,
                                child: Text('内线大师课！狼王特训 萨科技的啦可视角度卡卡吉林省', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize:25 * rpx),),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 60 * rpx,
                                    margin: EdgeInsets.only(
                                        right: 10 * rpx),
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
                                    margin: EdgeInsets.only(left:10 * rpx),
                                    child: Text('隔壁老王', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    // Navigator.pushNamed(context, '/videoScreen', arguments: 'http://player.alicdn.com/video/aliyunmedia.mp4');
                    Navigator.pushNamed(context, '/playVideo');
                  },
                ),
              ]),
      ],
    )
    );
    
  }
}
