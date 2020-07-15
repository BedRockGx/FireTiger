import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class LiveSiwper extends StatelessWidget {

  List swiperArr = [];

  LiveSiwper({this.swiperArr});

  @override
  Widget build(BuildContext context) {
    return  Container(
            height: ScreenAdapter.setHeight(300),
            child: Swiper(
              itemBuilder: (BuildContext context,int index){
                return   Container(
                          margin: EdgeInsets.fromLTRB(ScreenAdapter.setWidth(20),0, ScreenAdapter.setWidth(20), ScreenAdapter.setWidth(20)),
                          
                          child: Container(
                            width: ScreenAdapter.setWidth(100),
                            child: AspectRatio(
                              aspectRatio: 1/1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: swiperArr[index]['slide_pic'], fit: BoxFit.cover,),
                                      onTap: ()async {
                                        
                                      },
                                )
                              ),
                            ),
                          )
                        );
              },
              itemCount: swiperArr.length,
              autoplay: true,
            ),
          );
  }
}





// class LiveSiwper extends StatelessWidget {

//   final swiperArr;
//   LiveSiwper(this.swiperArr);


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                 child: Swiper(
//                 itemCount: swiperArr['list'].length,
//                 itemBuilder: (context, index){
//                   return Container(
//                           margin: EdgeInsets.fromLTRB(ScreenAdapter.setWidth(20),0, ScreenAdapter.setWidth(20), ScreenAdapter.setWidth(20)),
                          
//                           child: Container(
//                             width: ScreenAdapter.setWidth(100),
//                             child: AspectRatio(
//                               aspectRatio: 1/1,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: InkWell(
//                                   child: FadeInImage.memoryNetwork(
//                                       placeholder: kTransparentImage,
//                                       image: swiperArr[index]['slide_pic'], fit: BoxFit.cover,),
//                                   onTap: ()async {
                                    
//                                   },
//                                 )
//                               ),
//                             ),
//                           )
//                         );
//                 },
//                 autoplay: true,
//                 pagination: SwiperPagination(margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40))),
//               ),
//               );
//   }
// }



