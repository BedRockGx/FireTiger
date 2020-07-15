import 'package:firetiger/provider/searDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    var searchDataProvider = Provider.of<SearchDataProvider>(context);

    if(searchDataProvider.videoData.length == 0){
      return Center(
        child: Text('暂无数据', style: TextStyle(fontSize: ScreenAdapter.size(30),),),
      );
    }else{
      return Container(
            margin: EdgeInsets.all(ScreenAdapter.setWidth(30)),
            child: Column(
              children: <Widget>[
                Wrap(
                    spacing: ScreenAdapter.setWidth(40), // 平行距离
                    children: searchDataProvider.videoData.map((item){
                      return 
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
                                                  '${item['thumb']}',
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
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // Text('03:12', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: ScreenAdapter.size(20))),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Icon(IconData(0xe650, fontFamily: "myIcon"), color: Color.fromRGBO(255, 255, 255, 0.9), size: ScreenAdapter.size(25)),
                                                SizedBox(
                                                  width: ScreenAdapter.setWidth(5),
                                                ),
                                                Text('${item['likes']}', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(20))),
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
                                      child: Text('${item['title']}', overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize: ScreenAdapter.size(25)),),
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
                                                    '${item['avatar_thumb']}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left:ScreenAdapter.setWidth(10)),
                                          child: Text('${item['user_nicename']}', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),),
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
                          Navigator.pushNamed(context, '/playVideo', arguments: item['id']);
                        },
                      );
                
                    }).toList()
                   )
              ],
            ),
          );
        
    }
    
  }
}