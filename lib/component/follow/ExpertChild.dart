import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ExpertChild extends StatefulWidget {
  var data;
  ExpertChild(this.data);
  @override
  _ExpertChildState createState() => _ExpertChildState(data);
}

class _ExpertChildState extends State<ExpertChild> {
  var data;
  _ExpertChildState(this.data);

  var str = '展开';
  var _manLines = 2;

  @override
  void initState() {
    super.initState();
    data = this.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                            margin: EdgeInsets.only(bottom:ScreenAdapter.setHeight(40)),
                            // height: ScreenAdapter.setHeight(150),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right:ScreenAdapter.setWidth(20)),
                                  child: ImageRoud('${data['img']}', 50),
                                ),
                                Expanded(
                                  flex: 1,
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Container(
                                              width: ScreenAdapter.setWidth(300),
                                              alignment:Alignment.centerLeft, 
                                              child: Text('${data['name']}', overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                                            ),
                                      ),
                                      SizedBox(
                                        height: ScreenAdapter.setHeight(10),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children:[
                                            data['subname'].length > 22 ? WidgetSpan(
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
                                              text:'${data['subname']}',
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
                                Container(
                                  margin: EdgeInsets.only(left:ScreenAdapter.setWidth(30)),
                                  child: Column(
                                    children: <Widget>[
                                      Text('胜率', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),),
                                      SizedBox(
                                        height: ScreenAdapter.setHeight(10),
                                      ),
                                      Text('${data['sl']}', style: TextStyle(fontSize: ScreenAdapter.size(45), fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
  }
}