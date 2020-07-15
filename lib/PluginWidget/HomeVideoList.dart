import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// 赛事直播 组件页面

class HomeVideoList extends StatefulWidget {
  List<Map> videoData = [];
  var specific;
  HomeVideoList({this.videoData, this.specific = false});
  @override
  _VideoListState createState() => _VideoListState(this.videoData, this.specific);
}

class _VideoListState extends State<HomeVideoList> {
  List<Map> videoData = [];
  var specific;
  _VideoListState(this.videoData, this.specific);

  @override
  void initState() {
    super.initState();
    
  }

  var itemWidth = (ScreenAdapter.getScreenWidth() - ScreenAdapter.setWidth(110)) / 2; // 每一个网格的宽度

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15), horizontal:ScreenAdapter.setWidth(30)),
      child: Column(
      children: <Widget>[
         Wrap(
              spacing: ScreenAdapter.setWidth(30), // 平行距离
              runSpacing: ScreenAdapter.setHeight(20), // 上下距离
              children:widget.videoData.map((item){
                return InkWell(
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
                                            '${item['thumb']}',
                                        fit: BoxFit.cover,
                                      ),
                                    ))),
                            // Positioned(
                            //   right: 0,
                            //   top: 5,
                            //   child: panLiveStatus(item['islive'])
                            // ),
                             Positioned(
                              left: 3,
                              top: 3,
                              child: Container(
                                width: ScreenAdapter.setWidth(100),
                                child: widget.specific ?Container() : panStateImg(item['liveType'])  ,
                              )),
                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: Container(
                                width: itemWidth,
                                padding: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                                child: Text('${item['title']}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
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
                                      image:'${item['avatar_thumb']}',
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
                                            '${item['user_nicename']}',
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
                                          '${panType(item['liveType'])}',
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
                                                '${item['hot']}',
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
                  onTap: (){
                    print(item['uid']);
                    Navigator.pushNamed(context, '/live', arguments: item['uid']);
                  },
                );
                 
              }).toList()
              //  [
                
              //   Container(
              //     width: itemWidth,
              //     child: Column(
              //       children: <Widget>[
              //         Stack(
              //           children: <Widget>[
              //             Container(
              //                 width: double.infinity, // 自适应占满全部
              //                 child: AspectRatio(
              //                     aspectRatio: 3 / 2, // 图片宽高比 1/1
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(5),
              //                       child: Image.network(
              //                         'https://sta-op.douyucdn.cn/vod-cover/2020/05/07/dbc34cebe92ab25b6f0f6bb1541217b6.jpg',
              //                         fit: BoxFit.cover,
              //                       ), // 图片自适应,
              //                     ))),
              //             Positioned(
              //               right: 0,
              //               top: 5,
              //               child: Row(
              //                 children: <Widget>[
              //                   Container(
              //                     margin: EdgeInsets.symmetric(
              //                         horizontal: ScreenAdapter.setWidth(10)),
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: ScreenAdapter.setWidth(5)),
              //                     color: Color(0xff80D064),
              //                     child: Text(
              //                       '未开始',
              //                       style: TextStyle(
              //                           fontSize: ScreenAdapter.size(23),
              //                           color: Colors.white),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Positioned(
              //               bottom: 5,
              //               left: 5,
              //               child: Container(
              //                 child: Text('我是faker啊！！', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
              //               ),
              //             )
              //           ],
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //               vertical: ScreenAdapter.setWidth(20)),
              //           child: Row(
              //             children: <Widget>[
              //               Container(
              //                 width: ScreenAdapter.setWidth(60),
              //                 margin: EdgeInsets.only(
              //                     right: ScreenAdapter.setWidth(10)),
              //                 child: AspectRatio(
              //                   aspectRatio: 1 / 1,
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(30),
              //                     child: Image.network(
              //                       'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3196197975,1282739574&fm=111&gp=0.jpg',
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Column(
              //                   children: <Widget>[
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: <Widget>[
              //                         Text(
              //                           'Faker',
              //                           style: TextStyle(
              //                               fontSize: ScreenAdapter.size(25)),
              //                         ),
              //                       ],
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: <Widget>[
              //                         Text(
              //                           '电竞',
              //                           style: TextStyle(
              //                               fontSize: ScreenAdapter.size(20),
              //                               color: Color(0xffA4A4A4)),
              //                         ),
              //                         Text(
              //                           '39204',
              //                           style: TextStyle(
              //                               fontSize: ScreenAdapter.size(20),
              //                               color: Color(0xffA4A4A4)),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              //   Container(
              //     width: itemWidth,
              //     child: Column(
              //       children: <Widget>[
              //         Stack(
              //           children: <Widget>[
              //             Container(
              //                 width: double.infinity, // 自适应占满全部
              //                 child: AspectRatio(
              //                     aspectRatio: 3 / 2, // 图片宽高比 1/1
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(5),
              //                       child: Image.network(
              //                         'https://sta-op.douyucdn.cn/vod-cover/2020/05/05/21d685b5b2e5561052c5c2dc06a654b9.jpg',
              //                         fit: BoxFit.cover,
              //                       ), // 图片自适应,
              //                     ))),
              //             Positioned(
              //               right: 0,
              //               top: 5,
              //               child: Row(
              //                 children: <Widget>[
              //                   Container(
              //                     margin: EdgeInsets.symmetric(
              //                         horizontal: ScreenAdapter.setWidth(10)),
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: ScreenAdapter.setWidth(5)),
              //                     color: Color(0xffC6C6C6),
              //                     child: Text(
              //                       '已结束',
              //                       style: TextStyle(
              //                           fontSize: ScreenAdapter.size(23),
              //                           color: Colors.white),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //               vertical: ScreenAdapter.setWidth(20)),
              //           child: Row(
              //             children: <Widget>[
              //               Container(
              //                 width: ScreenAdapter.setWidth(60),
              //                 margin: EdgeInsets.only(
              //                     right: ScreenAdapter.setWidth(10)),
              //                 child: AspectRatio(
              //                   aspectRatio: 1 / 1,
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(30),
              //                     child: Image.network(
              //                       'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg',
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Column(
              //                   children: <Widget>[
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: <Widget>[
              //                         Text(
              //                           '起小点',
              //                           style: TextStyle(
              //                               fontSize: ScreenAdapter.size(25)),
              //                         ),
              //                       ],
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: <Widget>[
              //                         Text(
              //                           '游戏',
              //                           style: TextStyle(
              //                               fontSize: ScreenAdapter.size(20),
              //                               color: Color(0xffA4A4A4)),
              //                         ),
              //                         Text(
              //                           '102220',
              //                           style: TextStyle(
              //                               fontSize: ScreenAdapter.size(20),
              //                               color: Color(0xffA4A4A4)),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
                
              // ]
              ),
      ],
    )
    );
  }

  panType(type){
    switch (type) {
      case '1':
        return '足球';
        break;
      case '2':
        return '篮球';
        break;
      default:
        return '综合';
    }
  }

  panStateImg(type){
    switch (type) {
      case '1':
        return Image.asset('assets/images/fb.png', fit: BoxFit.contain,);
        break;
      case '2':
        return Image.asset('assets/images/bkb.png', fit: BoxFit.contain,);
        break;
      default:
    }
  }

  panLiveStatus(status){
    switch (status) {
      case '0':
        return Row(
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
              );
          break;
      case '1':
        return Row(
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
              );
        break;
      default:
        return Container();
    }
  }
}
