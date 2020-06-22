import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ExpertChild extends StatefulWidget {
  var item;
  ExpertChild(this.item);
  @override
  _ExpertChildState createState() => _ExpertChildState(item);
}

class _ExpertChildState extends State<ExpertChild> {
  var item;
  _ExpertChildState(this.item);

  var str = '展开';
  var _manLines = 2;

  @override
  void initState() {
    super.initState();
    item = this.item;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.setWidth(80),
                        height: ScreenAdapter.setHeight(70),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: panImage(item['pm']),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: item['pm'] > 3 ? Text('${item['pm']}', style: TextStyle(fontSize: ScreenAdapter.size(30), color: Colors.white, fontWeight: FontWeight.bold),) : Text(''),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                        child: ImageRoud('${item['image']}', 60),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${item['title']}', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                              Text.rich(
                                        TextSpan(
                                          children:[
                                            item['describe'].length > 22 ? WidgetSpan(
                                              child: InkWell(
                                                child: Text(str, style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                                                onTap: (){
                                                  if(_manLines ==  2){
                                                    setState(() {
                                                      str = '收起';
                                                      _manLines = 10;
                                                    });
                                                  }else{
                                                    setState(() {
                                                      str = '展开';
                                                      _manLines = 2;
                                                    });
                                                  }
                                                  
                                                },
                                              )
                                            ) : TextSpan(text: ''),
                                            TextSpan(
                                              text:'${item['describe']}',
                                              style: TextStyle(
                                                fontSize: ScreenAdapter.size(30),
                                              ),
                                            ),
                                          ]
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: _manLines,
                                      )
                            ],
                          ),
                        ),
                      ),
                      item['isGuan'] ? 
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(25), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width:ScreenAdapter.setWidth(1), color: Color(0xffFF3641))
                        ),
                        child: Row(
                          children: <Widget>[
                            // Icon(IconData(0xe657, fontFamily: 'myIcon'), color: Color(0xffFF3641),  size: ScreenAdapter.size(30),),
                            Text('已关注', style: TextStyle(color: Color(0xffFF3641), fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                      :
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20), vertical: ScreenAdapter.setHeight(10)),
                        decoration: BoxDecoration(
                          color: Color(0xffFF3641),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(IconData(0xe656, fontFamily: 'myIcon'), color: Color(0xffFFFFFF), size: ScreenAdapter.size(30),),
                            Text('关注', style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(25)),)
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }

  panImage(n){
    switch (n) {
      case 1:
        return AssetImage('assets/images/ranking-1.png');
        break;
      case 2:
        return AssetImage('assets/images/ranking-2.png');
        break;
      case 3:
        return AssetImage('assets/images/ranking-3.png');
        break;
      default:
        return AssetImage('assets/images/ranking-other.png');
        break;
    }
  }
}