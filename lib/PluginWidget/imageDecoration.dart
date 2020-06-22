import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageDecoration extends StatelessWidget {

  var arguments;
  ImageDecoration(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.setWidth(200),
                          margin: EdgeInsets.all(ScreenAdapter.setHeight(25)),
                          decoration: BoxDecoration(
                            border: Border.all(width:ScreenAdapter.setWidth(arguments['borderWidth']), color:Color(panColor(arguments['pm']))),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: arguments['image'],
                                      fit: BoxFit.cover,
                                    ),
                              )
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 0,
                          left: ScreenAdapter.setWidth(85),
                          child: Container(
                            width: ScreenAdapter.setWidth(60),
                            child: Image.asset('${panPM(arguments['pm'])}', fit: BoxFit.cover,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text('${arguments['title']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                  Text('${arguments['subTitle']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                ],
              ),
            );
  }

  panColor(n){
    switch (n) {
      case 1:
        return 0xffFFCC5B;
        break;
      case 2:
        return 0xffBBD5DA;
        break;
      case 3:
        return 0xffC0A994;
        break;
      default:
    }
  }

  panPM(n){
    switch (n) {
      case 1:
        return 'assets/images/ranking-1.png';
        break;
      case 2:
        return 'assets/images/ranking-2.png';
        break;
      case 3:
        return 'assets/images/ranking-3.png';
        break;
      default:
    }
  }
}