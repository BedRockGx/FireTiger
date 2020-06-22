import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ShoppingMall extends StatefulWidget {
  @override
  _ShoppingMallState createState() => _ShoppingMallState();
}

class _ShoppingMallState extends State<ShoppingMall> {

  var itemWidth = (ScreenAdapter.getScreenWidth() - 60) / 2; // 每一个网格的宽度

  List<Map> data=  [
    {'img':'https://img12.360buyimg.com/babel/s320x320_jfs/t1/114835/28/6594/79883/5ebbe7d6E7c1c23fd/943d7a23eb7b03f1.jpg!cc_320x320.webp', 'title':'游戏U盘16G 大航海时代 合集 包含2-4外传 4部 经', 'price':'74'},
    {'img':'https://img30.360buyimg.com/babel/s320x320_jfs/t1/124906/20/2648/111506/5ec769a4E580de196/2877a61efb77d999.jpg!cc_320x320.webp', 'title':'成者(CZUR) AuraMate小光环儿童智能视频陪伴阿萨德离开家阿克苏断开连接', 'price':'1000'},
    {'img':'https://img30.360buyimg.com/babel/s320x320_jfs/t1/128449/15/4012/60896/5ed8697eE22d9d73d/9ad151a69eb8276a.jpg!cc_320x320.webp', 'title':'游戏U盘16G 大航海时代 合集 包含2-4外传 4部 经', 'price':'74'},
    {'img':'https://img13.360buyimg.com/babel/s320x320_jfs/t1/113123/28/2746/538931/5ea3f1eaEb2a43574/61967101b55f877a.jpg!cc_320x320.webp', 'title':'游戏U盘16G 大航海时代 合集 包含2-4外传 4部 经', 'price':'74'},
    {'img':'https://img10.360buyimg.com/babel/s320x320_jfs/t1/120016/11/3467/314774/5ed111abEaa5aeccd/63fa0f437ca2583c.jpg!cc_320x320.webp', 'title':'游戏U盘16G 大航海时代 合集 包含2-4外传 4部 经', 'price':'74'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('火虎商城', style: TextStyle(color: Colors.black87, fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
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
          IconButton(
            icon: Icon(IconData(0xe678, fontFamily: 'myIcon'), color: Colors.black,),
            onPressed: (){

            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenAdapter.setWidth(60)),
            decoration: BoxDecoration(
              color: Color(0xffF9F9F9),
              border: Border(
                bottom: BorderSide(
                  width: ScreenAdapter.setHeight(1),
                  color: Colors.black12
                )
              )
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('我的火虎币', style: TextStyle(fontSize: ScreenAdapter.size(25), fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:ScreenAdapter.setWidth(5)),
                      child: Icon(Icons.help_outline, color: Color(0xffA4A4A4), size: ScreenAdapter.size(30),),
                    ),
                    Text('如何获得', style: TextStyle(fontSize: ScreenAdapter.size(20), color: Color(0xffA4A4A4)),)
                  ],
                ),
                SizedBox(
                  height: ScreenAdapter.setHeight(10),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                      width: ScreenAdapter.setWidth(40),
                      child: Image.asset('assets/images/jb2.png', fit: BoxFit.cover,),
                    ),
                    Text('23975', style: TextStyle(fontSize: ScreenAdapter.size(60), color: Color(0xffFF3641)),)
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Color(0xffFFFFFF),
            padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
            child: Wrap(
              spacing: ScreenAdapter.setWidth(30),
              runSpacing: ScreenAdapter.setWidth(20),
              children: data.map((item){
                return InkWell(
                  child: Container(
                    width: itemWidth,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.setWidth(10)),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEBEBEB),width: 1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image:
                                        '${item['img']}',
                                    fit: BoxFit.contain,
                                  ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(10)),
                          child: Text(
                            '${item['title']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenAdapter.size(25),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenAdapter.setWidth(20),
                                      margin: EdgeInsets.only(right:ScreenAdapter.setWidth(10)),
                                      child: Image.asset('assets/images/jb2.png'),
                                    ),
                                    Container(
                                      child: Text('${item['price']}', style: TextStyle(color: Colors.red, fontSize: ScreenAdapter.size(40), fontWeight: FontWeight.bold),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: ScreenAdapter.setWidth(130),
                                child: RaisedButton(
                                  child: Text('兑换', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
                                  textColor: Colors.white,
                                  highlightColor:Theme.of(context).primaryColor,
                                  color:Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  elevation: 0,
                                  onPressed:(){

                                  }
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/shoppingMallDetails');
                  },
                );
              }).toList()
            ),
          ),
        ],
      ),
    );
  }
}