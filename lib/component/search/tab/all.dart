import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class SearchTabAll extends StatefulWidget {
  @override
  _SearchTabAllState createState() => _SearchTabAllState();
}

class _SearchTabAllState extends State<SearchTabAll> {

  List userData = [
    {'head_pic':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3256100974,305075936&fm=26&gp=0.jpg', 'dengji':9, 'type':'足球', 'fensi':1285, 'isZhi':false},
    {'head_pic':'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1967122488,1967216897&fm=26&gp=0.jpg', 'dengji':26, 'type':'娱乐', 'fensi':153641, 'isZhi':true},
    {'head_pic':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1950846641,3729028697&fm=111&gp=0.jpg', 'dengji':45, 'type':'一起看', 'fensi':35, 'isZhi':false},
    {'head_pic':'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3859800586,1907430584&fm=26&gp=0.jpg', 'dengji':67, 'type':'电竞', 'fensi':6, 'isZhi':true},
    {'head_pic':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3521319392,1160740190&fm=26&gp=0.jpg', 'dengji':98, 'type':'星秀', 'fensi':56, 'isZhi':true},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10), horizontal:ScreenAdapter.setWidth(30)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('主播', style: TextStyle(fontSize: ScreenAdapter.size(32), fontWeight: FontWeight.bold),),
                Row(
                  children: <Widget>[
                    Text('全部', style: TextStyle(fontSize: ScreenAdapter.size(23),  color: Color(0xff666666))),
                    Icon(IconData(0xe655, fontFamily: 'myIcon'), color: Color(0xffCACACA),)
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
            child: Column(
            children: userData.map((item){
              return Container(
                margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                child:Row(
                  children: <Widget>[
                    ImageRoud(item['head_pic'], 60),
                    SizedBox(width: ScreenAdapter.setWidth(20),),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(item['type'], style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                                padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(50), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(10), ScreenAdapter.setWidth(5)),
                                // width: ScreenAdapter.setWidth(80),
                                alignment: Alignment.centerRight,
                                child: Text('${item['dengji']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Colors.white), textAlign: TextAlign.right,),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: panImage(item['dengji']),
                                    fit: BoxFit.cover
                                  )
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenAdapter.setHeight(20),
                          ),
                          Row(
                            children: <Widget>[
                              Text('粉丝数 ${item['fensi']}', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Color(0xffA4A4A4)),)
                            ],
                          )
                        ],
                      ),
                    ),
                    item['isZhi'] ? 
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(IconData(0xe64d, fontFamily: 'myIcon'), color: Colors.red, size: ScreenAdapter.size(15),),
                          Container(
                            margin:EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10)),
                            padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                            color: Theme.of(context).primaryColor,
                            child: Text('直播中', style: TextStyle(fontSize: ScreenAdapter.size(23), color: Colors.white),),
                          ),
                        ],
                      ),
                    )
                    :
                    Text('')
                  ],
                )
              );
              
            }).toList()
          ),
          )
        ],
      ),
    );
  }

  ImageProvider panImage(n){
    if(n<11){
      return AssetImage('assets/images/tag1.png');
    }else if(10<n && n<31){
      return AssetImage('assets/images/tag2.png');
    }else if(30<n && n<51){
      return AssetImage('assets/images/tag3.png');
    }else if(50<n && n<71){
      return AssetImage('assets/images/tag4.png');
    }else if(70<n && n<101){
      return AssetImage('assets/images/tag5.png');
    }
    
    
  }
}