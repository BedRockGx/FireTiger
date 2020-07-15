import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// 视频列表 组件页面
class VideoList extends StatefulWidget {
  bool isUnpublished = false;                       // 是否从个人中心查看 判断是否显示审核失败
  bool isLiveAnchor = false;                        // 是否从直播回放查看 判断是否显示头像和名字
  List<Map> videoListData;

  VideoList({this.isUnpublished, this.isLiveAnchor, @required this.videoListData});
  @override
  _VideoListState createState() => _VideoListState(this.isUnpublished, this.isLiveAnchor, this.videoListData);
}

class _VideoListState extends State<VideoList> with AutomaticKeepAliveClientMixin{
  bool isUnpublished = false;                       
  bool isLiveAnchor = false;                       
  List<Map> videoListData;
  var sh = false;
  var itemWidth; // 每一个网格的宽度

  _VideoListState(this.isUnpublished, this.isLiveAnchor, this.videoListData);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    double rpx = MediaQuery.of(context).size.width / 750;
    itemWidth  = (MediaQuery.of(context).size.width  - 70) / 2;

    return Container(
      margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15), horizontal:ScreenAdapter.setWidth(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Wrap(
              spacing: 40 * rpx, // 平行距离
              runSpacing: 20 * rpx, // 上下距离
              children: videoListData.map((item){
                return InkWell(
                  child: Container(
                    width: itemWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                            '${item['thumb']}',
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    // Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 20 * rpx)),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: 25 * rpx),
                                          SizedBox(
                                            width: ScreenAdapter.setWidth(5),
                                          ),
                                          Text('${item['views']}', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: 20 * rpx)),
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
                                child: Text('${item['title']}', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize:25 * rpx),),
                              ),
                              isLiveAnchor ? Container() :
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
                                    child: Text('${item['user_nicename']}', style: TextStyle(fontSize: 20 * rpx, color: Color(0xffA4A4A4)),),
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
                    // print(item['id']);
                    // Navigator.pushNamed(context, '/videoScreen', arguments: 'http://player.alicdn.com/video/aliyunmedia.mp4');
                    Navigator.pushNamed(context, '/playVideo', arguments: item['id']);
                  },
                );
              }).toList()
            ),
      ],
    )
    );
    
  }
}
