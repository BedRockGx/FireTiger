import 'package:firetiger/PluginWidget/ImageRound.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class AnchorRelated extends StatefulWidget {
  @override
  _AnchorRelatedState createState() => _AnchorRelatedState();
}

class _AnchorRelatedState extends State<AnchorRelated> {

  double _sliderValue = 0;
  double linerValue = 0.2;
  int showTab = 0;

  List<Map> tabStr =  [{'title':'今天', 'code':0}, {'title':'本周', 'code':1}, {'title':'本月', 'code':2}, {'title':'近三月', 'code':3},];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('主播相关', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xffFAFAFA),
        brightness: Brightness.light,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            IconData(0xe654, fontFamily: 'myIcon'),
            size: ScreenAdapter.size(60),
            color: Color(0xff333333),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('等级详情', style: TextStyle(fontSize: ScreenAdapter.size(25), color: Theme.of(context).primaryColor),),
            onPressed: (){
              Navigator.pushNamed(context, '/gradeDetails');
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
        children: <Widget>[
          userHeader(),
          linear(),
          Container(
            margin: EdgeInsets.only(top:ScreenAdapter.setHeight(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Text('我的收益', style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: tabStr.map((item){
                   return InkWell(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(10), vertical: ScreenAdapter.setHeight(20)),
                          padding: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(40), vertical: ScreenAdapter.setHeight(15)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width:ScreenAdapter.setWidth(1), color:showTab == item['code'] ?  Colors.red : Color(0xffE5E5E5)),
                            color: Color(0xffF9F9F9)
                          ),
                          child: Text(item['title'], style: TextStyle(fontSize: ScreenAdapter.size(25), color:showTab == item['code'] ?  Colors.red : Color(0xff333333)),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          showTab = item['code'];
                        });
                      },
                    );
                 }).toList()
               ),
               Column(
                 children: <Widget>[
                   Container(
                     margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                     child: Row(
                       children: <Widget>[
                         Container(
                           width: ScreenAdapter.setWidth(100),
                           child: Column(
                             children: <Widget>[
                               Text('今天', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                               Text('12:11', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),)
                             ],
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Container(
                             child: Row(
                               children: <Widget>[
                                 Container(
                                   width: ScreenAdapter.setWidth(60),
                                   margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                                   child: Image.asset('assets/images/shop.png', fit: BoxFit.cover,),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('火箭', style: TextStyle( fontSize: ScreenAdapter.size(30)),),
                                      Text('12:11', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                         Container(
                           child: Text('x1', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(30)),),
                         )
                       ],
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20)),
                     child: Row(
                       children: <Widget>[
                         Container(
                           width: ScreenAdapter.setWidth(100),
                           child: Column(
                             children: <Widget>[
                               Text('今天', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                               Text('12:11', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(20)),)
                             ],
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Container(
                             child: Row(
                               children: <Widget>[
                                 Container(
                                   width: ScreenAdapter.setWidth(60),
                                   margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.setWidth(20)),
                                   child: Image.asset('assets/images/shop.png', fit: BoxFit.cover,),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                      Text('火箭', style: TextStyle( fontSize: ScreenAdapter.size(30)),),
                                      Text('12:11', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                         Container(
                           child: Text('x1', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(30)),),
                         )
                       ],
                     ),
                   )
                 ],
               )
            ],)
          ),
        ],
      ),
    );
  }

  // 计算偏移距离
  panLeft(n){
    var left;
    if(n < 0.5){
      left = 450 * n -30;
    }else{
      left = 450 * n;
    }
    return ScreenAdapter.setWidth(left);
  }


  // 数字取整
  transformNum(n){
    return n.toStringAsFixed(0);
  }

  Widget linear(){
    return Container(
            margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(22)),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('Lv92', style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(20)),),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(20)),
                    padding: EdgeInsets.only(bottom:ScreenAdapter.setHeight(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left:panLeft(linerValue)),
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Text('${transformNum(linerValue * 100)}/100',  style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.size(20)),),
                        ),
                        SizedBox(
                          height: ScreenAdapter.setHeight(5),
                        ),
                        Container(
                          height: ScreenAdapter.setHeight(5),
                          child: LinearProgressIndicator(
                            value: linerValue,
                            backgroundColor: Color(0xffECECEC),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Text('Lv100', style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(20)),),
              ],
            ),
          );
  }

  Widget userHeader(){
    return Row(
            children: <Widget>[
              ImageRoud('https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3140403455,2984550794&fm=26&gp=0.jpg', 50),
              SizedBox(
                width: ScreenAdapter.setWidth(15),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('磐石BedRock', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(ScreenAdapter.setHeight(40), ScreenAdapter.setWidth(5), ScreenAdapter.setWidth(15), ScreenAdapter.setWidth(5)),
                          // width: ScreenAdapter.setWidth(80),
                          alignment: Alignment.centerRight,
                          child: Text('92', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Colors.white), textAlign: TextAlign.right,),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: panImage(92),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenAdapter.setHeight(10),
                    ),
                    Row(
                      children: <Widget>[
                        Text('房间号 29374', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                        Text(' | ', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),),
                        Text('关注 34', style: TextStyle(color: Color(0xffA4A4A4), fontSize: ScreenAdapter.size(25)),)
                      ],
                    )
                  ],
                ),
              )
            ],
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