import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class SwiperPage extends StatelessWidget {
  var bannerArr;
  SwiperPage({@required this.bannerArr});

  // List arr = [
  //   'http://n.sinaimg.cn/front/200/w640h360/20180425/uBJd-fzqvvsc0562357.jpg',
  //   'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00443-4126.jpg',
  //   'https://huyaimg.msstatic.com/cdnimage/gamebanner/phpz4v8PF1553828503.png'
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: bannerArr.length,
        itemBuilder: (context, index) {
          return Container(
              child: Container(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: bannerArr[index]['slide_pic'],
                          fit: BoxFit.fill,
                        ),
                        onTap: () async {},
                      )
                    ),
                ),
              ));
        },
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
      ),
    );
  }
}
