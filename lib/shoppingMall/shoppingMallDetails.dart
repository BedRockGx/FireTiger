import 'package:firetiger/PluginWidget/GreyDivider.dart';
import 'package:firetiger/utils/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ShoppingMallDetails extends StatefulWidget {
  @override
  _ShoppingMallDetailsState createState() => _ShoppingMallDetailsState();
}

class _ShoppingMallDetailsState extends State<ShoppingMallDetails> {
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
      ),
      body:Stack(
        children: <Widget>[
           ListView(
            children: <Widget>[
              Container(
                height: ScreenAdapter.setHeight(600),
                // padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(30)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: ScreenAdapter.setHeight(2), color: Colors.black12)
                  )
                ),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://img12.360buyimg.com/n7/jfs/t1/140162/39/258/417932/5ede68f2E4b58c4f5/fd41782b2ae1dddc.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.setWidth(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('荣耀笔记本MaicBook14英寸长',  style: TextStyle(fontSize: ScreenAdapter.size(35), fontWeight: FontWeight.bold),),
                    SizedBox(height: ScreenAdapter.setHeight(10),),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: ScreenAdapter.setWidth(30),
                                    child: Image.asset('assets/images/jb2.png', fit: BoxFit.cover,),
                                  ),
                                  Text('23975', style: TextStyle(fontSize: ScreenAdapter.size(60),color: Color(0xffFF3641), fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('232354115', style: TextStyle(fontSize: ScreenAdapter.size(25))),
                                Text('人兑换',  style: TextStyle(fontSize: ScreenAdapter.size(25),color: Color(0xffCBCBCB)))
                              ],
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GreyDivider(),
              Container(
                padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(20), horizontal:ScreenAdapter.setWidth(40)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: ScreenAdapter.setHeight(1), color: Color(0xffE4E4E4))
                  )
                ),
                child: Text('商品详情', style: TextStyle(fontSize: ScreenAdapter.size(25)),),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical:ScreenAdapter.setHeight(40), horizontal:ScreenAdapter.setWidth(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('机型参数比较', style: TextStyle(fontSize: ScreenAdapter.size(30), fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: ScreenAdapter.setHeight(20),
            left: MediaQuery.of(context).size.width / 2 - ScreenAdapter.setWidth(150),
            child: Container(
                    width: ScreenAdapter.setWidth(300),
                    height: ScreenAdapter.setHeight(70),
                    child: RaisedButton(
                      highlightColor:Theme.of(context).primaryColor,
                      child: Text('立即兑换', style: TextStyle(fontSize: ScreenAdapter.size(30)),),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/confirmOrder');
                      },
                    ),
                  ),
          )
        ],
      )
    );
  }
}