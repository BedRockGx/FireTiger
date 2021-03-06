import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

// 资讯轮播图

class ConsulationSwiper extends StatelessWidget {
  List<Map> swiperArr;
  ConsulationSwiper(this.swiperArr);

  // List arr = [
  //   'http://n.sinaimg.cn/front/200/w640h360/20180425/uBJd-fzqvvsc0562357.jpg',
  //   'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00443-4126.jpg',
  //   'https://huyaimg.msstatic.com/cdnimage/gamebanner/phpz4v8PF1553828503.png'
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              scrollDirection :Axis.horizontal,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                child: Row(   
                  children: swiperArr.map((item){
                    if(swiperArr.isNotEmpty){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.setWidth(630),
                              child: AspectRatio(
                                aspectRatio: 4/3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image:
                                              '${item['slide_pic']}',
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 5,
                                left: 5,
                                child: Container(
                                  width: ScreenAdapter.setWidth(630),
                                  padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                                  child: Text('${item['slide_name']}',maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9), fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(30))),
                                ),
                              )
                          ],
                        ),
                      );
                    }else{
                      return Container();
                    }
                    
                  }).toList()
                ),
              ),
            );
   
  }
}