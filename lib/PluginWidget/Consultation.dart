import 'package:firetiger/http/api.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:firetiger/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// 咨询组件页面

class Consultation extends StatelessWidget {
  List<Map> newsArticlesData;
  Consultation({@required this.newsArticlesData});

  
   @override
  Widget build(BuildContext context) {
    return 
        Container(
          // margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15), horizontal:ScreenAdapter.setWidth(30)),
          padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(15)),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: ScreenAdapter.setHeight(1), color: Color(0xffEBEBEB)))
          ),
          child:Column(
            children: newsArticlesData.map((item){
              return InkWell(
                child: Container(
                  margin:EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(15)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${item['post_title']}',maxLines: 2, style: TextStyle(fontSize: ScreenAdapter.size(30)), overflow: TextOverflow.ellipsis,),
                              SizedBox(height: ScreenAdapter.setHeight(20),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${item['name']} · ${Utils.handleDate(item['post_date'])}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(IconData(0xe685, fontFamily: "myIcon"), color: Color(0xffA4A4A4), size: ScreenAdapter.size(32),),
                                        SizedBox(width: ScreenAdapter.setWidth(5),),
                                        Text('${item['post_hits']}111', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)))
                                      ],
                                    ),
                                  )
                                  
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left:ScreenAdapter.setWidth(20)),
                          width: ScreenAdapter.setWidth(250),
                          child: AspectRatio(
                            aspectRatio: 4/3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child:FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: '${item['new_smeta']['thumb']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/consulationDetails', arguments: item['id']);
                },
              );
            }).toList()
          )
        );
      
}
}

